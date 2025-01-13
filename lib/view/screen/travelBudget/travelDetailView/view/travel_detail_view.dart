import 'package:intl/intl.dart';
import 'package:trackexpense/data/remote/travel/models/travel_model.dart';
import 'package:trackexpense/utils/app_sizes.dart';
import 'package:trackexpense/utils/box_shadow.dart';
import 'package:trackexpense/utils/colors.dart';
import 'package:trackexpense/utils/utils.dart';

class TravelDetailView extends StatefulWidget {
  final TravelModel travelModel;
  const TravelDetailView({super.key, required this.travelModel});

  @override
  State<TravelDetailView> createState() => _TravelDetailViewState();
}

class _TravelDetailViewState extends State<TravelDetailView> {

  late DateTime startDate;
  late DateTime endDate;

  late DateTime selectedDate;
  List<DateTime> _getDateRange(DateTime start, DateTime end) {
    List<DateTime> days = [];
    DateTime current = start;
    if(end.year != 2024) {
      while (current.isBefore(end.add(const Duration(days: 1)))) {
        days.add(current);
        current = current.add(const Duration(days: 1));
      }
    }else {
      days.add(startDate);
    }
    return days;
  }
  
  @override
  void initState() {
    super.initState();
    startDate = widget.travelModel.startDate ?? DateTime.now();
    endDate =  widget.travelModel.endDate ?? DateTime(2024);
    selectedDate = startDate;
  }

  @override
  Widget build(BuildContext context) {
    final dates = _getDateRange(startDate, endDate);
    final dateFormat = DateFormat('EEE');
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBlack,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: size.width,
                decoration: BoxDecoration(
                  border: BorderDirectional(bottom: BorderSide(color: kWhite))
                ),
                child: Image.asset('assets/images/travel.png', fit: BoxFit.fill),
              ),
              Positioned(
                bottom: 8,
                child: SizedBox(
                  width: size.width,
                  child: Center(child: Text(widget.travelModel.place ?? 'Travel Budget', style: TextStyle(color: kWhite, fontWeight: FontWeight.bold, fontSize: 28),))
                ),
              ),
              Positioned(
                bottom: 16,
                right: 16,
                child: GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: kBlack,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [customBoxShadow()]
                    ),
                    child: const Icon(Icons.cancel_outlined, color: kWhite,),
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kWhite),
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
                          dateFormat.format(date), // e.g. Thu
                          style: TextStyle(
                            color: kWhite,
                          ),
                        ),
                        Text(
                          date.day.toString(), // e.g. 28
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kWhite,
                            fontSize: 18
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: buildSection(title: 'Estimated Expense'),
          ),
          gapH16,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: buildSection(title: 'Actual Expenditure'),
          )
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: (){
          // context.pushNamed(AppRoute.travelView.name);
        },
        child: Container(
          height: 56,
          width: MediaQuery.of(context).size.width * 0.35,
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
            ]
          ),
          child: const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_rounded,
                  color: kWhite,
                ),
                SizedBox(width: 10,),
                Text('ADD', style: TextStyle(color: kWhite, fontWeight: FontWeight.bold, fontSize: 18),),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget buildSection({required String title}) {
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
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kWhite),
              ),
            ],
          ),
          Divider(color: kWhite, thickness: 0.3,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Food', style: TextStyle(fontSize: 16, color: kWhite)),
              Text('300.0', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: kWhite)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Travel', style: TextStyle(fontSize: 16, color: kWhite)),
              Text('2000.0', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: kWhite)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Hotel', style: TextStyle(fontSize: 16, color: kWhite)),
              Text('3000.0', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: kWhite)),
            ],
          ),
        ],
      ),
    );
  }
}