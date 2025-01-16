import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:trackexpense/data/remote/splitFriend/models/split_friend_model.dart';
import 'package:trackexpense/utils/app_sizes.dart';
import 'package:trackexpense/utils/box_shadow.dart';
import 'package:trackexpense/utils/colors.dart';
import 'package:trackexpense/utils/utils.dart';
import 'package:trackexpense/view/screen/travelBudget/addTravel/bloc/add_travel_bloc.dart';
import 'package:trackexpense/view/screen/travelBudget/travelView/bloc/trave_data_bloc.dart';

class AddSplitFriendView extends StatefulWidget {
  const AddSplitFriendView({super.key});

  @override
  State<AddSplitFriendView> createState() => _AddSplitFriendViewState();
}

class _AddSplitFriendViewState extends State<AddSplitFriendView> {
  final TextEditingController titleController = TextEditingController();

  DateTime? startDate;
  DateTime? endDate;
  bool isStart = false;
  bool isEnd = false;
  String currency = 'INR';
  final DateFormat dateFormat = DateFormat('dd MMM yyyy');

  Future<void> pickStartDate(BuildContext context) async {
    final today = DateTime.now().subtract(const Duration(days: 150));
    final initialDate = startDate ?? today.add(const Duration(days: 1));
    final firstDate = today;
    final lastDate = DateTime(2100);

    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate.isBefore(today) ? today : initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (ctx, child) {
        // Wrap in a dark theme
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: kWhite,
              onPrimary: kBlack,
              surface: kBlack,
              onSurface: kWhite,
            ),
            dialogBackgroundColor: kWhite,
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        isStart = false;
        startDate = picked;
        if (endDate != null && endDate!.isBefore(startDate!)) {
          endDate = null;
        }
      });
    }
  }

  void saveData() {
    if (titleController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please Enter a Title.")),
      );
      return;
    }

    if (startDate == null) {
      isStart = true;
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a start date.")),
      );
      return;
    }

    if (endDate == null) {
      isEnd = true;
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select an end date.")),
      );
      return;
    }

    String splitId = const Uuid().v4();
    String userId = FirebaseAuth.instance.currentUser?.uid ?? 'User Not Found';

    SplitFriendModel splitFriendModel = SplitFriendModel(
      creatorId: userId,
      splitId: splitId,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      startDate: startDate,
      endDate: endDate,
      userList: [userId],
      writerList: [],
      adminList: [userId],
      title: titleController.text.trim(),
      currency: currency
    );

    Logger.printSuccess(splitFriendModel.toString());
  }

  Future<void> pickEndDate(BuildContext context) async {
    if (startDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please pick a start date first.")),
      );
      return;
    }

    final initialDate = endDate ?? startDate!;
    final firstDate = startDate!;
    final lastDate = DateTime(2100);

    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate.isBefore(firstDate) ? firstDate : initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (ctx, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: kWhite,
              onPrimary: kBlack,
              surface: kBlack,
              onSurface: kWhite,
            ),
            dialogBackgroundColor: kWhite,
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        isStart = false;
        endDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBlack,
      appBar: AppBar(
        title: Text(
          'Add Split with Friends',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: kWhite),
        ),
        centerTitle: true,
        leading: Row(
          children: [
            const SizedBox(
              width: 16,
            ),
            GestureDetector(
              onTap: () {
                context.pop();
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: kBlack,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [customBoxShadow()]),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: kWhite,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: kBlack,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gapH32,
            Text(
              'Split Title',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            gapH8,
            TextField(
              controller: titleController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'January Food Split ....',
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[850],
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: kWhite)),
                border: OutlineInputBorder( borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            gapH32,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Start Date* :",
                  style: TextStyle(
                      color: kWhite, fontWeight: FontWeight.bold, fontSize: 18),
                ),
                GestureDetector(
                  onTap: () => pickStartDate(context),
                  child: Container(
                    width: size.width * 0.4,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: isStart ? redColor : kWhite),
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        startDate == null
                            ? "SELECT"
                            : dateFormat.format(startDate!),
                        style: TextStyle(
                            color: kWhite,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "End Date :",
                  style: TextStyle(
                      color: kWhite, fontWeight: FontWeight.bold, fontSize: 18),
                ),
                GestureDetector(
                  onTap: () => pickEndDate(context),
                  child: Container(
                    width: size.width * 0.4,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: isStart ? redColor : kWhite
                        ),
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        endDate == null
                            ? "SELECT"
                            : dateFormat.format(endDate!),
                        style: TextStyle(
                            color: kWhite,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Currency* :",
                  style: TextStyle(
                      color: kWhite, fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Container(
                  width: size.width * 0.4,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: kWhite),
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Text(
                      currency,
                      style: TextStyle(
                          color: kWhite,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            BlocConsumer<AddTravelBloc, AddTravelBlocState>(
              listener: (context, state) {
                if(state is AddTravelBlocLoaded) {
                  String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
                  context.read<TravelDataBloc>().add(TravelData(userId: userId));
                  context.pop();
                }
              },
              builder: (context, state) {
                return InkWell(
                  onTap: () {
                    saveData();
                  },
                  child: Container(
                    height: 50,
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                        border: Border.all(color: kWhite),
                        color: state.isLoading ? kBlack : kWhite,
                        borderRadius: BorderRadius.circular(12)),
                    child: state.isLoading
                        ? const Center(
                            child: SizedBox(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator(
                                  color: kWhite,
                                )))
                        : Center(
                            child: const Text(
                              "Save",
                              style: TextStyle(
                                  color: kBlack,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                  ),
                );
              },
            ),
            gapH32
          ],
        ),
      ),
    );
  }
}
