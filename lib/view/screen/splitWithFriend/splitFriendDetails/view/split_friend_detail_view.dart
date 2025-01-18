import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trackexpense/data/remote/splitFriend/models/split_friend_model.dart';
import 'package:trackexpense/data/remote/travelMate/models/travelmate_models.dart';
import 'package:trackexpense/utils/app_sizes.dart';
import 'package:trackexpense/utils/box_shadow.dart';
import 'package:trackexpense/utils/capitalize.dart';
import 'package:trackexpense/utils/colors.dart';
import 'package:trackexpense/utils/utils.dart';
import 'package:trackexpense/view/screen/splitWithFriend/addMember/view/add_member_view.dart';
import 'package:trackexpense/view/screen/splitWithFriend/splitFriend/bloc/split_friend_bloc.dart';

class SplitFriendDetailView extends StatefulWidget {
  final SplitFriendModel splitFriendModel;
  const SplitFriendDetailView({super.key, required this.splitFriendModel});

  @override
  State<SplitFriendDetailView> createState() => _SplitFriendDetailViewState();
}

class _SplitFriendDetailViewState extends State<SplitFriendDetailView> {
  late DateTime startDate;
  late DateTime endDate;

  late DateTime selectedDate;
  List<DateTime> _getDateRange(DateTime start, DateTime end) {
    List<DateTime> days = [];
    DateTime current = start;
    if (end.year != 2024) {
      while (current.isBefore(end.add(const Duration(days: 1)))) {
        days.add(current);
        current = current.add(const Duration(days: 1));
      }
    } else {
      days.add(startDate);
    }
    return days;
  }

  @override
  void initState() {
    super.initState();
    // context.read<TravelDetailBloc>().add(TravelMateData(travelId: widget.travelModel.travelId ?? ''));
    startDate = widget.splitFriendModel.startDate ?? DateTime.now();
    endDate = widget.splitFriendModel.endDate ?? DateTime(2024);
    selectedDate = startDate;
  }

  @override
  Widget build(BuildContext context) {
    final dates = _getDateRange(startDate, endDate);
    final dateFormat = DateFormat('EEE');
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBlack,
        body: BlocBuilder<SplitFriendBloc, SplitFriendBlocState>(
          builder: (context, state) {
            return Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: size.width,
                      height: 60,
                      decoration: BoxDecoration(
                          border: BorderDirectional(bottom: BorderSide(color: kWhite))),
                    ),
                    Positioned(
                      bottom: 16,
                      child: SizedBox(
                          width: size.width,
                          child: Center(
                              child: Text(
                            widget.splitFriendModel.title ?? 'Split Friend',
                            style: TextStyle(
                                color: kWhite,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ))),
                    ),
                    Positioned(
                      bottom: 16,
                      right: 8,
                      child: GestureDetector(
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
                            Icons.cancel_outlined,
                            color: kWhite,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                gapH8,
                GestureDetector(
                  onTap: () {
                    Logger.printSuccess(dates.toString());
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          DateFormat('MMMM yyyy').format(selectedDate),
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: kWhite),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8),
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dates.length,
                    itemBuilder: (context, index) {
                      final date = dates[index];
                      final isSelected = date.year == selectedDate.year &&
                          date.month == selectedDate.month &&
                          date.day == selectedDate.day;
      
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDate = date;
                          });
                        },
                        child: Container(
                          width: 60,
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: kBlack,
                            border: isSelected ? Border.all(color: kWhite) : null,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                dateFormat.format(date),
                                style: TextStyle(
                                  color: kWhite,
                                ),
                              ),
                              Text(
                                date.day.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: kWhite,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor: kBlack,
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(16)),
                          ),
                          isScrollControlled: true,
                          builder: (context) => AddMemberBottomSheet(
                            splitFriendModel: widget.splitFriendModel,
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        width: size.width * 0.4,
                        decoration: BoxDecoration(color: kBlack,
                          border: Border.all(color: kBlack),
                          borderRadius: BorderRadius.circular(8), // Radius of 16
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 152, 148, 148),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: const Offset(0, 3))
                        ]),
                        child: Center(
                          child: Text('ADD MEMBER', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kWhite),),
                        ),
                      ),
                    ),
                    gapW16
                  ],
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                //   child: state.isLoading ? buildTravelDetailShimmer(context)
                //   : buildSection(title: 'Estimated Expense', travelMateList: state.estimatedTravelMateList.where((item) => item.type == 'Estimated Expense' && item.day == selectedDate.day && item.month == selectedDate.month && item.year == selectedDate.year).toList()),
                // ),
                gapH16,
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                //   child: state.isLoading ? buildTravelDetailShimmer(context)
                //   : buildSection(title: 'Actual Expenditure', travelMateList: state.actualTravelMateList.where((item) => item.type == 'Actual Expenditure').toList()),
                // )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildSection({required String title, required List<TravelMateModel> travelMateList}) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: kGrey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Logger.printError(travelMateList.toString());
                },
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold, color: kWhite),
                ),
              ),
              GestureDetector(
                  onTap: () {
                    // showModalBottomSheet(
                    //   backgroundColor: kBlack,
                    //   context: context,
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius:
                    //         BorderRadius.vertical(top: Radius.circular(16)),
                    //   ),
                    //   isScrollControlled: true,
                    //   builder: (context) => AddTravelMateBottomSheet(
                    //     type: title,
                    //     dateTime: selectedDate,
                    //     travelModel: widget.splitFriendModel,
                    //   ),
                    // );
                  },
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: kBlack,
                        border: Border.all(color: kBlack),
                        borderRadius: BorderRadius.circular(8), // Radius of 16
                        boxShadow: [
                          BoxShadow(
                              color: const Color.fromARGB(255, 111, 109, 109),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: const Offset(0, 3))
                        ]),
                    child: Text(
                      'ADD +',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kWhite),
                    ),
                  ))
            ],
          ),
          Divider(
            color: kWhite,
            thickness: 0.3,
          ),
          if(travelMateList.isEmpty) Center(
            child: Text('Start by Adding Your First $title', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: kWhite)),
          ),
          ...travelMateList.map((item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: InkWell(
                // onTap: () => showCustomBottomSheet(context, item),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(capitalize(item.title ?? ''), style: TextStyle(fontSize: 16, color: kWhite)),
                    Text('${item.amount ?? 0.0}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: kWhite)),
                  ],
                ),
              ),
            )),
          travelMateList.length < 2 ? const SizedBox() : Divider(color: kWhite, thickness: 0.3,),
          travelMateList.length < 2 ? const SizedBox() : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(capitalize('total'), style: TextStyle(fontSize: 16, color: kWhite)),
              Text(travelMateList.where((item) => item.type == title).fold(0.0, (sum, item) => sum + (item.amount ?? 0.0)).toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: kWhite))
            ],
          )
        ],
      ),
    );
  }
}
