import 'package:intl/intl.dart';
import 'package:trackexpense/utils/app_sizes.dart';
import 'package:trackexpense/utils/box_shadow.dart';
import 'package:trackexpense/utils/capitalize.dart';
import 'package:trackexpense/utils/colors.dart';
import 'package:trackexpense/utils/utils.dart';
import 'package:trackexpense/view/screen/splitWithFriend/splitFriend/bloc/split_friend_bloc.dart';
class SplitFriendView extends StatefulWidget {
  const SplitFriendView({super.key});

  @override
  State<SplitFriendView> createState() => _SplitFriendViewState();
}

class _SplitFriendViewState extends State<SplitFriendView> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        backgroundColor: kBlack,
        title: Text(
          'Friendly Split',
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
      body: BlocBuilder<SplitFriendBloc, SplitFriendBlocState>(
        builder: (context, state) {
          return state.isLoading ? buildShimmerList(size)
            : state.splitFriendList.isEmpty ? SizedBox(
              height: size.height,
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width * 0.6,
                    child: Text(
                      'Add Your First Friendly Split',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white38,
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                    ),
                  ),
                ],
              ),
            )
            : ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 16),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.pushNamed(AppRoute.splitFriendDetailView.name, extra: state.splitFriendList[index]);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  width: size.width,
                  height: size.height * 0.2,
                  decoration: BoxDecoration(
                      color: kBlack,
                      boxShadow: [
                        BoxShadow(
                            color: const Color.fromARGB(255, 80, 78, 78),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 1))
                      ],
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/images/travel.png',
                          ),
                          fit: BoxFit.fill,
                          opacity: 0.1)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            capitalize(state.splitFriendList[index].title ?? ''),
                            style: TextStyle(
                                color: kWhite,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white24),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Total Amount',
                                      style: TextStyle(
                                          color: Colors.white60,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    gapW10,
                                    Text('₹', style: TextStyle(color: kGreen, fontWeight: FontWeight.bold, fontSize: 26),)
                                  ],
                                ),
                                Text(
                                  '₹ ${state.splitFriendList[index].totalAmount}',
                                  style: TextStyle(
                                      color: kWhite,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                              ],
                            ),
                          ),
                          // gapW12,
                          // Container(
                          //   padding: EdgeInsets.all(8),
                          //   decoration: BoxDecoration(
                          //     border: Border.all(color: Colors.white24),
                          //     borderRadius: BorderRadius.circular(8),
                          //   ),
                          //   child: Column(
                          //     children: [
                          //       Row(
                          //         children: [
                          //           Text(
                          //             'Actual Expenditure',
                          //             style: TextStyle(
                          //                 color: Colors.white60,
                          //                 fontWeight: FontWeight.bold,
                          //                 fontSize: 14),
                          //           ),
                          //           gapW10,
                          //           Text('=', style: TextStyle(color: kGreen, fontSize: 24),)
                          //         ],
                          //       ),
                          //       gapH4,
                          //       Text(
                          //         '₹ ${state.travelList[index].actualCost}',
                          //         style: TextStyle(
                          //             color: kWhite,
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 16),
                          //       ),
                          //     ],
                          //   ),
                          // )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '${DateFormat('dd MMM yyy').format(state.splitFriendList[index].startDate ?? DateTime.now())} to ${DateFormat('dd MMM yyy').format(state.splitFriendList[index].endDate ?? DateTime.now())}',
                            style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return gapH24;
            },
            itemCount: state.splitFriendList.length
          );
        },
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          context.pushNamed(AppRoute.addSplitFriend.name);
        },
        child: Container(
          height: 56,
          width: MediaQuery.of(context).size.width * 0.5,
          decoration: BoxDecoration(
              color: kBlack,
              border: Border.all(color: kBlack),
              borderRadius: BorderRadius.circular(16), // Radius of 16
              boxShadow: [
                BoxShadow(
                    color: const Color.fromARGB(255, 80, 78, 78),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 3))
              ]),
          child: const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Friendly Split',
                  style: TextStyle(
                      color: kWhite, fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.add_rounded,
                  color: kWhite,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget buildShimmerList(Size size) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemCount: 3,
      separatorBuilder: (context, index) => gapH24,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: const Color.fromARGB(150, 66, 66, 66),
          highlightColor: const Color.fromARGB(187, 97, 97, 97),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: size.width,
            height: size.height * 0.18,
            decoration: BoxDecoration(
              color: const Color.fromARGB(155, 66, 66, 66),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      },
    );
  }
}
