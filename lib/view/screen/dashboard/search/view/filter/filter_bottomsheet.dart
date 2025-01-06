import 'package:trackexpense/utils/app_sizes.dart';
import 'package:trackexpense/utils/colors.dart';
import 'package:trackexpense/utils/utils.dart';
import 'package:trackexpense/view/screen/dashboard/search/view/filter/bloc/filter_bloc_bloc.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  bool selectedMonth = true;
  bool selectedYear = false;
  List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  final List<int> years =
      List.generate(DateTime.now().year - 2010 + 1, (index) => 2010 + index)
          .reversed
          .toList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBlocBloc, FilterBlocState>(
      builder: (context, state) {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select Month Year',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.cancel_outlined, color: kWhite,)
                  )
                ],
              ),
              gapH32,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      selectedYear = false;
                      selectedMonth = true;
                      setState(() {});
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: 70,
                      decoration: BoxDecoration(
                          border: Border.all(color: kWhite),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              bottomLeft: Radius.circular(24))),
                      child: Center(
                        child: Text(
                          state.month.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: kWhite,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      selectedYear = true;
                      selectedMonth = false;
                      setState(() {});
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: 70,
                      decoration: BoxDecoration(
                          color: kWhite,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(24),
                              bottomRight: Radius.circular(24))),
                      child: Center(
                        child: Text(
                          state.year.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: kBlack,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              gapH32,
              selectedMonth
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                context
                                    .read<FilterBlocBloc>()
                                    .add(Filter(month: index + 1, year: state.year));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    months[index],
                                    style: TextStyle(
                                      fontSize: (state.month - 1) == index ? 28 : 20,
                                      fontWeight: FontWeight.bold,
                                      color: kWhite,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Center(
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 16),
                                height: 1,
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                    color: Colors.white30,
                                    boxShadow: [
                                      BoxShadow(
                                          color: const Color.fromARGB(
                                              255, 80, 78, 78),
                                          spreadRadius: 1,
                                          blurRadius: 10,
                                          offset: const Offset(0, 3))
                                    ]),
                              ),
                            );
                          },
                          itemCount: months.length),
                    )
                  : SizedBox(),
              selectedYear
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                context
                                    .read<FilterBlocBloc>()
                                    .add(Filter(month: state.month, year: years[index]));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    years[index].toString(),
                                    style: TextStyle(
                                      fontSize: state.year == years[index] ? 28 : 20,
                                      fontWeight: FontWeight.bold,
                                      color: kWhite,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Center(
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 16),
                                height: 1,
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                    color: Colors.white30,
                                    boxShadow: [
                                      BoxShadow(
                                          color: const Color.fromARGB(
                                              255, 80, 78, 78),
                                          spreadRadius: 1,
                                          blurRadius: 10,
                                          offset: const Offset(0, 3))
                                    ]),
                              ),
                            );
                          },
                          itemCount: years.length),
                    )
                  : SizedBox(),
              const SizedBox(
                height: 16,
              )
            ],
          ),
        );
      },
    );
  }
}
