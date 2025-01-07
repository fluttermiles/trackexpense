import 'package:firebase_auth/firebase_auth.dart';
import 'package:trackexpense/utils/app_sizes.dart';
import 'package:trackexpense/utils/colors.dart';
import 'package:trackexpense/utils/utils.dart';
import 'package:trackexpense/view/screen/authenticate/view/signin.dart';
import 'package:trackexpense/view/screen/dashboard/home/bloc/expenseCreditBloc/expense_credit_bloc.dart';
import 'package:trackexpense/view/screen/dashboard/home/bloc/rupeeMonthlyDataBloc/rupee_monthly_data_bloc.dart';
import 'package:trackexpense/view/screen/dashboard/profile/bloc/logout/logout_bloc.dart';
import 'package:trackexpense/view/screen/dashboard/profile/bloc/profileData/profile_data_bloc.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String selectedDay = 'We';
  String userId = '';
  List<Map<String, dynamic>> tileNames = [
    {
      "icon": Icons.privacy_tip_outlined,
      "title": "Privacy Policy",
    },
    {
      "icon": Icons.article_outlined,
      "title": "Terms & Condition",
    },
    {
      "icon": Icons.delete,
      "title": "Remove All Data",
    },
    {
      "icon": Icons.question_mark_outlined,
      "title": "FAQs",
    },
    {
      "icon": Icons.logout,
      "title": "Log out",
    },
  ];

  Future<void> getSignIn() async {
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        builder: (context) {
          return SignInPage();
        });
  }

  @override
  void initState() {
    super.initState();
    userId = FirebaseAuth.instance.currentUser?.uid ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        backgroundColor: kBlack,
        title: Text(
          'Profile',
          style: GoogleFonts.libreBaskerville(
            color: kWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocListener<LogoutBloc, LogoutBlocState>(
        listener: (context, state) {
          if (state is LogoutBlocLoaded) {
            context.read<RupeeMonthlyDataBloc>().add(RupeeMonthlyData(isLogOut: true));
            userId = '';
            context.pop();
            setState(() {});
            // context.pushReplacementNamed(AppRoute.signInPage.name);
          }
        },
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      boxShadow: [
                        BoxShadow(
                            color: const Color.fromARGB(255, 80, 78, 78),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: const Offset(0, 3))
                      ],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 32),
                        BlocConsumer<ProfileDataBloc, ProfileBlocState>(
                          listener: (context, state) {
                            if(state is ProfileBlocLoaded){
                              userId = FirebaseAuth.instance.currentUser?.uid ?? '';
                              setState(() {});
                            }
                          },
                          builder: (context, state) {
                            if(state is ProfileBlocLoaded){
                              return GestureDetector(
                                onTap: () {
                                  Logger.printError(state.data.toString());
                                },
                                child: (state.data.imageUrl?.isNotEmpty ?? false)
                                  ? CircleAvatar(
                                      radius: 40.r,
                                      backgroundColor: kWhite,
                                      child: ClipOval(
                                        child: CachedNetworkImage(
                                          imageUrl: state.data.imageUrl ?? '',
                                          fit: BoxFit.cover,
                                          width: 80.r,
                                          height: 80.r,
                                          placeholder: (context, url) => Center(
                                            child: Icon(
                                              Icons.person,
                                              size: 56,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          errorWidget: (context, url, error) => Icon(
                                            Icons.person,
                                            size: 56,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ) : CircleAvatar(
                                    backgroundColor: kWhite,
                                    radius: 40.r,
                                    child: Icon(
                                      Icons.person,
                                      size: 56,
                                    ),
                                  ),
                                );
                              } else {
                              return CircleAvatar(
                                backgroundColor: kWhite,
                                radius: 40.r,
                                child: Icon(Icons.person, size: 56,),
                              );
                            }
                          },
                        ),
                        SizedBox(height: 8),
                        BlocBuilder<ProfileDataBloc, ProfileBlocState>(
                          builder: (context, state) {
                            return Text(
                              state.profileData.name ?? 'Rupee Mate',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.18),
                  ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    itemCount: tileNames.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return index == 2 && userId.isNotEmpty
                          ? SizedBox()
                          : gapH12;
                    },
                    itemBuilder: (context, index) {
                      return index == 2 && userId.isNotEmpty
                          ? SizedBox()
                          : InkWell(
                              onTap: () async {
                                if (index == 0) {
                                  context
                                      .pushNamed(AppRoute.privacyPolicy.name);
                                }
                                if (index == 1) {
                                  context
                                      .pushNamed(AppRoute.termsCondition.name);
                                }
                                if (index == 4) {
                                  if (userId.isEmpty) {
                                    getSignIn();
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          shadowColor: kGrey,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          backgroundColor: kBlack,
                                          title: const Text(
                                            "Logout",
                                            style: TextStyle(
                                              color: kWhite,
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          content: const Text(
                                            "Are you sure you want Logout? ",
                                            style: TextStyle(color: kGrey),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                "No",
                                                style: TextStyle(color: kWhite),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () async {
                                                context
                                                    .read<LogoutBloc>()
                                                    .add(LogoutEvent());
                                              },
                                              child: const Text(
                                                "Yes",
                                                style:
                                                    TextStyle(color: redColor),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                }
                              },
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  color: kWhite,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    gapW10,
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: kBlack, width: 2)),
                                      child: Icon(index == 4 && userId.isEmpty
                                          ? Icons.login
                                          : tileNames[index]['icon']),
                                    ),
                                    gapW16,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          index == 4 && userId.isEmpty
                                              ? 'Log In'
                                              : tileNames[index]['title'],
                                          style: GoogleFonts.poppins(
                                              fontSize: 20,
                                              color: kBlack,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                    },
                  ),
                  SizedBox(
                    height: 24,
                  )
                ],
              ),
              Positioned(
                  top: 180,
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05,
                  child: BlocBuilder<ExpenseCreditBloc, ExpenseCreditBlocState>(
                    builder: (context, state) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: kBlack, // Black background
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                  color: const Color.fromARGB(255, 80, 78, 78),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: const Offset(0, 3))
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Total Balance Section
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Current Month Balance',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(Icons.more_vert, color: Colors.white),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              '₹ ${(state.credit + state.lend - state.expense - state.debt).toStringAsFixed(2)}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 16),
                            // Income and Expense Section
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Income
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.arrow_downward,
                                            color: Colors.green, size: 20),
                                        SizedBox(width: 4),
                                        Text(
                                          'Credit',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      '₹ ${state.credit}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                // Expense
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.arrow_upward,
                                            color: Colors.red, size: 20),
                                        SizedBox(width: 4),
                                        Text(
                                          'Expenses',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      '₹ ${state.expense}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
