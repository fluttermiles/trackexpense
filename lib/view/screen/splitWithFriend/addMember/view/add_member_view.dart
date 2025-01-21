import 'package:firebase_auth/firebase_auth.dart';
import 'package:searchfield/searchfield.dart';
import 'package:trackexpense/data/remote/notification/models/notification_model.dart';
import 'package:trackexpense/data/remote/splitFriend/models/split_friend_model.dart';
import 'package:trackexpense/utils/colors.dart';
import 'package:trackexpense/utils/utils.dart';
import 'package:trackexpense/view/screen/dashboard/profile/bloc/profileData/profile_data_bloc.dart';
import 'package:trackexpense/view/screen/splitWithFriend/addMember/bloc/addUserSplitBloc/add_user_split_bloc.dart';
import 'package:trackexpense/view/screen/splitWithFriend/addMember/bloc/userSearchBloc/user_search_bloc.dart';
import 'package:trackexpense/view/screen/travelBudget/addTravelMate/bloc/add_travel_mate_bloc.dart';

class AddMemberBottomSheet extends StatefulWidget {
  final SplitFriendModel splitFriendModel;
  const AddMemberBottomSheet({super.key, required this.splitFriendModel});

  @override
  State<AddMemberBottomSheet> createState() => _AddMemberBottomSheetState();
}

class _AddMemberBottomSheetState extends State<AddMemberBottomSheet> {
  final TextEditingController searchController = TextEditingController();
  // Timer? debounce;

  @override
  void initState() {
    super.initState();
    // searchController.addListener(() {
    //   onSearchChanged(searchController.text);
    // });
  }

  // void onSearchChanged(String query) {
  //   if (debounce?.isActive ?? false) debounce?.cancel();
  //   debounce = Timer(const Duration(seconds: 3), () {
  //     if (query.isNotEmpty) {
  //       context.read<UserSearchBloc>().add(UserSearch(prefix: query));
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ADD MEMBER',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          BlocBuilder<UserSearchBloc, UserSearchBlocState>(
            builder: (context, state) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    color: kBlack,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 152, 148, 148),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(1, 0))
                    ]),
                child: SearchField<String>(
                  controller: searchController,
                  suggestionsDecoration: SuggestionDecoration(
                      borderRadius: BorderRadius.circular(12),
                      elevation: 40,
                      width: MediaQuery.of(context).size.width * 0.65,
                      color: kBlack,
                      border: Border.all(color: kWhite),
                      boxShadow: [
                        BoxShadow(
                            color: kWhite,
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: const Offset(0, 3))
                      ]),
                  suggestions: state.emailList
                      .map((e) => SearchFieldListItem<String>(e))
                      .toList(),
                  suggestionState: Suggestion.hidden,
                  hint: 'Email Address',
                  searchInputDecoration: SearchInputDecoration(
                    hintText: 'Email Address',
                    hintStyle: TextStyle(
                      color: kGrey,
                    ),
                    searchStyle: TextStyle(
                        color: kWhite,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    border: InputBorder.none,
                  ),
                  onSuggestionTap: (SearchFieldListItem<String> word) {
                    searchController.text = word.searchKey;
                    Logger.printError(word.searchKey.toString());
                  },
                  itemHeight: 50,
                  maxSuggestionsInViewPort: 5,
                  suggestionStyle: const TextStyle(
                    color: kWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 28),
          BlocBuilder<ProfileDataBloc, ProfileBlocState>(
            builder: (context, profileState) {
              return BlocConsumer<AddUserSplitBloc, AddUserSplitBlocState>(
                listener: (context, addUserState) {
                  if (addUserState is AddTravelMateBlocLoaded) {
                    Navigator.pop(context);
                  }
                },
                builder: (context, addUserState) {
                  return InkWell(
                    onTap: () {
                      String emailId = searchController.text.trim();
                      Logger.printError(emailId);
                      if (emailId.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Title and Amount are required!')),
                        );
                        return;
                      }

                      String notificationId = const Uuid().v4();
                      String userId = FirebaseAuth.instance.currentUser?.uid ??
                          'No user found';

                      final NotificationModel notificationModel =
                          NotificationModel(
                              notificationTitle: '${profileState.profileData.name} has rquested you to join ${widget.splitFriendModel.title}',
                              splitId: widget.splitFriendModel.splitId,
                              description: '',
                              senderId: userId,
                              recieverId: '',
                              createdAt: DateTime.now(),
                              updatedAt: DateTime.now(),
                              status: 'pending',
                              type: 'splitrequest',
                              id: notificationId);
                      Logger.printSuccess(notificationModel.toString());
                      context.read<AddUserSplitBloc>().add(AddUserSplit(notificationModel: notificationModel, emailId: emailId));
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
                          child: addUserState.isLoading
                              ? SizedBox(
                                  height: 28,
                                  width: 28,
                                  child:
                                      CircularProgressIndicator(color: kWhite))
                              : Text('Save',
                                  style: TextStyle(
                                      color: kWhite,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18))),
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
    );
  }
}
