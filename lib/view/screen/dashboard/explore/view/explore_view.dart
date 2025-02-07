import 'package:firebase_auth/firebase_auth.dart';
import 'package:line_icons/line_icons.dart';
import 'package:trackexpense/utils/app_sizes.dart';
import 'package:trackexpense/utils/colors.dart';
import 'package:trackexpense/utils/utils.dart';
import 'package:trackexpense/view/screen/authenticate/view/signin.dart';
import 'package:trackexpense/view/screen/splitWithFriend/splitFriend/bloc/split_friend_bloc.dart';
import 'package:trackexpense/view/screen/travelBudget/travelView/bloc/trave_data_bloc.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {

  Future<void> getSignIn() async {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      builder: (context) {
        return SignInPage();
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        backgroundColor: kBlack,
        title: Text(
          'Explore', 
          style: GoogleFonts.libreBaskerville(
            color: kWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          gapH16,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
                  if(userId.isEmpty){
                    getSignIn();
                  } else {
                    context.read<TravelDataBloc>().add(TravelData(userId: userId));
                    context.pushNamed(AppRoute.travelView.name);
                  }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: MediaQuery.of(context).size.width * 0.42,
                  height: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                    // border: Border.all(color: kWhite),
                    color: kBlack,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                        BoxShadow(
                            color: const Color.fromARGB(255, 80, 78, 78),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: const Offset(0, 3))
                      ]
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(LineIcons.plane, color: kWhite, size: 40,),
                        gapH12,
                        Text(
                          'Travel Budget',
                          style: TextStyle(color: kWhite, fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              gapW24,
              GestureDetector(
                onTap: () {
                  String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
                  if(userId.isEmpty){
                    getSignIn();
                  } else {
                    context.read<SplitFriendBloc>().add(SplitFriend(userId: userId));
                    context.pushNamed(AppRoute.splitFriendView.name);
                  }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: MediaQuery.of(context).size.width * 0.42,
                  height: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                    // border: Border.all(color: kWhite),
                    color: kBlack,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                        BoxShadow(
                            color: const Color.fromARGB(255, 80, 78, 78),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: const Offset(0, 3))
                      ]
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(LineIcons.peopleCarry, color: kWhite, size: 40,),
                        gapH12,
                        Text(
                          'Friendly Split',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: kWhite, fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}