import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:trackexpense/data/remote/splitFriend/models/split_friend_model.dart';
import 'package:trackexpense/data/remote/splitFriendDetail/models/split_friend_detail_model.dart';
import 'package:trackexpense/utils/app_sizes.dart';
import 'package:trackexpense/utils/colors.dart';
import 'package:trackexpense/utils/utils.dart';
import 'package:trackexpense/view/screen/dashboard/profile/bloc/profileData/profile_data_bloc.dart';
import 'package:trackexpense/view/screen/splitWithFriend/addSplitFriend/bloc/add_split_friend_bloc.dart';
import 'package:trackexpense/view/screen/splitWithFriend/addSplitFriendDetail/bloc/add_split_expense_bloc.dart';
import 'package:trackexpense/view/screen/splitWithFriend/splitFriend/bloc/split_friend_bloc.dart';
import 'package:trackexpense/view/screen/splitWithFriend/splitFriendDetails/bloc/split_friend_detail_bloc.dart';

class AddSplitDetailBottomSheet extends StatefulWidget {
  final DateTime dateTime;
  final SplitFriendModel splitFriendModel;
  final double totalAmount;

  const AddSplitDetailBottomSheet({
    super.key,
    required this.dateTime,
    required this.splitFriendModel,
    required this.totalAmount
  });

  @override
  State<AddSplitDetailBottomSheet> createState() =>
      _AddSplitDetailBottomSheetState();
}

class _AddSplitDetailBottomSheetState extends State<AddSplitDetailBottomSheet> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  Timer? debounce; 

  List<UserContribution> userContributions = [];
  List<TextEditingController> textEditingControllerList = [];
  List<int> updatedIndex = [];
  final List<String> suggestions = [
    "Food",
    "Breakfast",
    "Lunch",
    "Dinner",
    "Snacks",
    "Other"
  ];

  @override
  void initState() {
    super.initState();
    int userCount = widget.splitFriendModel.userListDetail?.length ?? 0;
    textEditingControllerList = List.generate(userCount, (_) => TextEditingController());
  }

  void initializeContributions(double totalAmount) {
    updatedIndex =[];
    int userCount = widget.splitFriendModel.userListDetail?.length ?? 0;

    if (userCount > 0 && totalAmount > 0) {
      double equalAmount = totalAmount / userCount;
      double remainder = totalAmount % userCount;

      userContributions = widget.splitFriendModel.userListDetail?.asMap().entries.map((entry) {
        int userIndex = entry.key;
        return UserContribution(
          userId: entry.value.userId,
          name: entry.value.name,
          isSelected: true,
          amount: userIndex == 0 ? (equalAmount + remainder).floorToDouble() : equalAmount.floorToDouble(),
        );
      }).toList() ?? [];

      textEditingControllerList = List.generate(userContributions.length, (i) {
        return TextEditingController(
          text: userContributions[i].amount?.toStringAsFixed(0) ?? "0",
        );
      });
    } else {
      userContributions.clear();
      textEditingControllerList.clear();
    }

    setState(() {});
  }

  void updateContributionWithDebounce(int index, double newAmount) {
    if (debounce?.isActive ?? false) debounce!.cancel();

    debounce = Timer(Duration(seconds: 1), () {
      updateContribution(index, newAmount);
    });
  }

  void updateContribution(int index, double newAmount) {
    final double totalAmount = double.tryParse(_amountController.text.trim()) ?? 0.0;

    // Only consider users who are selected
    final selectedUsers = userContributions
        .asMap()
        .entries
        .where((e) => (e.value.isSelected ?? false))
        .map((e) => e.key)
        .toList();

    // Count how many are selected
    // int selectedCount = selectedUsers.length;

    // If this index is not selected, just return - or handle how you want
    if (!selectedUsers.contains(index)) {
      return;
    }

    // Check if we are about to change the only remaining auto-calculated user.
    // i.e., if there's exactly one user left who hasn't been manually updated, disallow changing that user:
    //  1) If user is not already in updatedIndex
    //  2) and difference = 1
    int notUpdatedCount = selectedUsers.where((idx) => !updatedIndex.contains(idx)).length;
    bool isIndexAlreadyUpdated = updatedIndex.contains(index);

    // If difference is 1 and the user is not already in updatedIndex, disallow update
    if (notUpdatedCount == 1 && !isIndexAlreadyUpdated) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You cannot manually update the last auto-calculated user!')),
      );
      return;
    }

    // ----------------------------------------------------------------
    // 1) Add this index to updatedIndex if not already there
    // ----------------------------------------------------------------
    if (!isIndexAlreadyUpdated) {
      updatedIndex.add(index);
    }

    // ----------------------------------------------------------------
    // 2) First, apply the new amount to this user
    // ----------------------------------------------------------------
    userContributions[index] = userContributions[index].copyWith(amount: newAmount);

    // ----------------------------------------------------------------
    // 3) Sum up the amounts for all manually updated (locked) users
    // ----------------------------------------------------------------
    double lockedAmountSum = 0.0;
    for (int idx in updatedIndex) {
      if ((userContributions[idx].isSelected ?? false)) {
        lockedAmountSum += (userContributions[idx].amount ?? 0.0);
      }
    }

    // ----------------------------------------------------------------
    // 4) Calculate remaining amount for all auto-calculated users
    // ----------------------------------------------------------------
    double remainder = totalAmount - lockedAmountSum;

    // If remainder < 0 => total contribution exceeds the entered total
    if (remainder < 0) {
      // Revert the change or handle it your way
      userContributions[index] = userContributions[index].copyWith(amount: 0.0);

      // Also remove index if it was newly added
      if (!isIndexAlreadyUpdated) {
        updatedIndex.remove(index);
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Total contribution exceeds the entered amount!')),
      );
      setState(() {});
      return;
    }

    // ----------------------------------------------------------------
    // 5) Distribute the remainder among the NOT updated indices (auto-calculated)
    // ----------------------------------------------------------------
    final notUpdatedIndices = selectedUsers.where((idx) => !updatedIndex.contains(idx)).toList();
    int autoCount = notUpdatedIndices.length;

    if (autoCount > 0) {
      double share = remainder / autoCount;
      // We'll put integer math to floor the share, and distribute leftover to the first user
      double leftover = remainder % autoCount;

      for (int i = 0; i < notUpdatedIndices.length; i++) {
        int autoIdx = notUpdatedIndices[i];
        double finalShare = (i == 0)
            ? (share + leftover).floorToDouble()
            : share.floorToDouble();

        userContributions[autoIdx] =
            userContributions[autoIdx].copyWith(amount: finalShare);
      }
    } else {
      // If no auto-calculated users remain, that means all are locked => the user sets all manually
      // In that case, you might simply keep the remainder in the newly updated user,
      // or do nothing special. It's up to you.
    }

    // ----------------------------------------------------------------
    // 6) Update text fields
    // ----------------------------------------------------------------
    for (int i = 0; i < userContributions.length; i++) {
      double amt = userContributions[i].amount ?? 0.0;
      textEditingControllerList[i].text = amt.toStringAsFixed(0);
    }

    setState(() {});
  }

  void toggleUserSelection(int index) {
    bool isCurrentlySelected = userContributions[index].isSelected ?? false;
    int selectedCount = userContributions.where((u) => u.isSelected == true).length;

    if (isCurrentlySelected && selectedCount == 1) {
      return; 
    }

    bool newSelectionState = !isCurrentlySelected;
    userContributions[index] = userContributions[index].copyWith(
      isSelected: newSelectionState,
    );

    double totalAmount = double.tryParse(_amountController.text.trim()) ?? 0.0;
    int newSelectedCount = userContributions.where((u) => u.isSelected == true).length;

    if (newSelectedCount > 0) {
      double equalAmount = totalAmount / newSelectedCount;
      double remainder = totalAmount % newSelectedCount;

      int assignedCount = 0;
      for (int i = 0; i < userContributions.length; i++) {
        if (userContributions[i].isSelected == true) {
          double share = (assignedCount == 0)
              ? (equalAmount + remainder).floorToDouble()
              : equalAmount.floorToDouble();
          assignedCount++;

          userContributions[i] = userContributions[i].copyWith(amount: share);
          textEditingControllerList[i].text = share.toStringAsFixed(0);
        } else {
          userContributions[i] = userContributions[i].copyWith(amount: 0.0);
          textEditingControllerList[i].text = "0";
        }
      }
    }

    setState(() {});
  }

  void splitEqually() {
    double? totalAmount = double.tryParse(_amountController.text.trim());
    if (totalAmount != null && totalAmount > 0) {
      initializeContributions(totalAmount);
      setState(() {});
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBlack,
      body: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gapH32,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Add Split Expense',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            TextField(
              controller: _titleController,
              cursorColor: kWhite,
              enableInteractiveSelection: false,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[850],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              children: suggestions.map((suggestion) {
                return GestureDetector(
                  onTap: () {
                    _titleController.text = suggestion;
                  },
                  child: Chip(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    label: Text(
                      suggestion,
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: kBlack,
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _amountController,
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
              cursorColor: kWhite,
              enableInteractiveSelection: false,
              decoration: InputDecoration(
                labelText: 'Amount',
                labelStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[850],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (value) {
                double? amount = double.tryParse(value);
                if (amount != null && amount > 0) {
                  initializeContributions(amount);
                } else {
                  userContributions.clear();
                }
                setState(() {});
              },
            ),
            SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              cursorColor: kWhite,
              enableInteractiveSelection: false,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Description (Optional)',
                labelStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[850],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            if (userContributions.isNotEmpty) gapH16,
            if(userContributions.isNotEmpty)
              Row(
              children: [
                gapW8,
                Expanded(
                  child: Text(
                    '${userContributions.where((u) => u.isSelected ?? true).length}/${userContributions.length} Selected',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: kWhite),
                  ),
                ),
                GestureDetector(
                  onTap: splitEqually,
                  child: Row(
                    children: const [
                      Icon(Icons.refresh, size: 20, color: Colors.white),
                      SizedBox(width: 4),
                      Text('Split Equally', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                gapW8
              ],
            ),
            if (userContributions.isNotEmpty) gapH10,
            if (userContributions.isNotEmpty)
              SizedBox(
                height: 300,
                child: ListView.separated(
                  itemCount: userContributions.length,
                  separatorBuilder: (context, index) => gapH12, // Separator
                  itemBuilder: (context, index) {
                    UserContribution contribution = userContributions[index];

                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                        color: kBlack,
                        border: Border.all(color: kWhite),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Checkbox(
                            activeColor: kDodgerBlue,
                            value: contribution.isSelected ?? true,
                            onChanged: (_) => toggleUserSelection(index),
                          ),
                          SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              contribution.name ?? 'User',
                              style: TextStyle(color: kWhite, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 60,
                            child: TextField(
                              controller: textEditingControllerList[index],
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                double? newAmount = double.tryParse(value);
                                if (newAmount != null) {
                                  updateContributionWithDebounce(index, newAmount);
                                } else {
                                  updateContributionWithDebounce(index, 0);
                                }
                                setState(() {});
                              },
                              cursorColor: kWhite,
                              enableInteractiveSelection: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(borderSide: BorderSide.none),
                                hintText: '₹',
                                contentPadding: EdgeInsets.zero,
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                              style: TextStyle(color: kWhite),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            SizedBox(height: 16),
            Spacer(),
            BlocBuilder<ProfileDataBloc, ProfileBlocState>(
              builder: (context, profileState) {
                return BlocConsumer<AddSplitExpenseBloc, AddSplitExpenseBlocState>(
                  listener: (context, addSplitState) {
                    if(addSplitState is AddSplitExpenseBlocLoaded){
                      SplitFriendModel splitFriendModel = SplitFriendModel();
                      String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
                      splitFriendModel =  widget.splitFriendModel.copyWith(
                        totalAmount: widget.totalAmount + (addSplitState.data.amount ?? 0)
                      );
                      Logger.printError(splitFriendModel.toString());
                      context.read<AddSplitFriendBloc>().add(AddSplitFriend(splitFriendModel: splitFriendModel));
                      context.read<SplitFriendBloc>().add(SplitFriend(userId: userId));
                      context.read<SplitFriendDetailBloc>().add(SplitFriendDetail(splitFriendId: widget.splitFriendModel.splitId ?? ''));
                      Navigator.pop(context);
                    }
                  },
                  builder: (context, addTravelState) {
                    return InkWell(
                      onTap: () {
                        String title = _titleController.text.trim();
                        String description = _descriptionController.text.trim();
                        String amount = _amountController.text.trim();

                        if (title.isEmpty || amount.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Title and Amount are required!')),
                          );
                          return;
                        }

                        double? parsedAmount = double.tryParse(amount);
                        if (parsedAmount == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Please enter a valid numeric amount!')),
                          );
                          return;
                        }

                        String splitExpenseId = const Uuid().v4();

                        SplitFriendDetailModel newSplitDetail = SplitFriendDetailModel(
                          creatorId: profileState.profileData.userId,
                          splitId: widget.splitFriendModel.splitId,
                          userContribution: userContributions,
                          title: title,
                          currency: widget.splitFriendModel.currency,
                          createdAt: DateTime.now(),
                          updatedAt: DateTime.now(),
                          id: splitExpenseId,
                          day: widget.dateTime.day,
                          month: widget.dateTime.month,
                          year: widget.dateTime.year,
                          amount: parsedAmount,
                          description: description,
                        );
                        Logger.printSuccess(newSplitDetail.toString());
                        context.read<AddSplitExpenseBloc>().add(AddSplitExpense(splitFriendDetailModel: newSplitDetail));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: kWhite),
                          color: kBlack,
                        ),
                        child: Center(
                          child: addTravelState.isLoading ? SizedBox(height: 28, width: 28, child: CircularProgressIndicator(color: kWhite))
                          : Text(
                            'Save',
                            style: TextStyle(
                              color: kWhite,
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                            )
                          )
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(
              height: 16,
            )
          ],
        ),
      )
    );
  }
}