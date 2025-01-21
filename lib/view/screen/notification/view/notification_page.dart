import 'package:line_icons/line_icons.dart';
import 'package:trackexpense/data/remote/notification/models/notification_model.dart';
import 'package:trackexpense/data/remote/splitFriend/models/split_friend_model.dart';
import 'package:trackexpense/utils/app_sizes.dart';
import 'package:trackexpense/utils/box_shadow.dart';
import 'package:trackexpense/utils/capitalize.dart';
import 'package:trackexpense/utils/colors.dart';
import 'package:trackexpense/utils/utils.dart';
import 'package:trackexpense/view/screen/dashboard/profile/bloc/profileData/profile_data_bloc.dart';
import 'package:trackexpense/view/screen/notification/bloc/acceptRejectSplitBloc/accept_reject_split_bloc.dart';
import 'package:trackexpense/view/screen/notification/bloc/notificationBloc/notification_bloc.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  int tappedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        backgroundColor: kBlack,
        title: Text(
          'Notification',
          style: GoogleFonts.libreBaskerville(
            color: kWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
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
        centerTitle: true,
      ),
      body: BlocConsumer<NotificationBloc, NotificationBlocState>(
        listener: (context, notificationState) {},
        builder: (context, notificationState) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    width: size.width,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200),
                            border: Border.all(color: kWhite),
                          ),
                          child: Icon(
                            LineIcons.peopleCarry,
                            color: kWhite,
                            size: 24,
                          ),
                        ),
                        gapW10,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                notificationState.notificationList[index].notificationTitle ?? '',
                                style: TextStyle(
                                  color: kWhite,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            gapH24,
                            notificationState.notificationList[index].status == 'pending' ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                BlocConsumer<AcceptRejectSplitBloc, AcceptRejectSplitBlocState>(
                                  listener: (context, acceptRejectState) {
                                    if(acceptRejectState is AcceptRejectSplitBlocLoaded){
                                      List<NotificationModel> notificationList = notificationState.notificationList;
                                      notificationList[index] = notificationState.notificationList[index].copyWith(status: 'accepted');
                                      context.read<NotificationBloc>().add(FetchNotification(isEditNotification: true, userId: '', notificationList: notificationList));
                                    }
                                    if(acceptRejectState is AcceptRejectSplitBlocLoaded || acceptRejectState is AcceptRejectSplitBlocError){
                                      tappedIndex = -1;
                                    }
                                  },
                                  builder: (context, acceptRejectState) {
                                    return InkWell(
                                      onTap: () {
                                        final profileState = context.read<ProfileDataBloc>().state;
                                        UserList userList = UserList(
                                          name: profileState.profileData.name,
                                          userId: profileState.profileData.userId,
                                          emailId: profileState.profileData.emailId,
                                          amount: 0.0
                                        );
                                        NotificationModel acceptNotificationModel = notificationState.notificationList[index].copyWith(status: 'accepted');
                                        context.read<AcceptRejectSplitBloc>().add(AcceptRejectSplit(userList: userList, notificationModel: acceptNotificationModel));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 4),
                                        width: size.width * 0.18,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(color: kWhite),
                                          color: kBlack,
                                        ),
                                        child: Center(
                                          child: acceptRejectState.isLoading && tappedIndex == index
                                          ? SizedBox(
                                              height: 28,
                                              width: 28,
                                              child: CircularProgressIndicator(color: kWhite))
                                          : Text(
                                            'Accept',
                                            style: TextStyle(
                                              color: kWhite,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                gapW4,
                                InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.cancel_outlined,
                                    color: kWhite,
                                  ),
                                ),
                              ],
                            ) : Container(
                              padding: EdgeInsets.symmetric(vertical: 4),
                              width: size.width * 0.18,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(8),
                                border: Border.all(color: kWhite),
                                color: kBlack,
                              ),
                              child: Center(
                                child:Text(
                                  capitalize(notificationState.notificationList[index].status ?? 'Error'),
                                  style: TextStyle(
                                    color: kWhite,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return gapH16;
                },
                itemCount: notificationState.notificationList.length),
          );
        },
      ),
      // body: SizedBox(
      //   height: MediaQuery.of(context).size.height,
      //   width: MediaQuery.of(context).size.width,
      //   child: Center(
      //     child: Lottie.asset(AnimationConstant.comingsoon),
      //   ),
      // ),
    );
  }
}
