import 'dart:async';

import 'package:super_tooltip/super_tooltip.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:trackexpense/utils/app_sizes.dart';
import 'package:trackexpense/utils/colors.dart';
import 'package:trackexpense/utils/utils.dart';
import 'package:trackexpense/view/screen/dashboard/home/bloc/rupee_monthly_data_bloc.dart';
import 'package:trackexpense/view/screen/dashboard/profile/bloc/profileData/profile_data_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  DateTime focusedDate = DateTime.now(); 
  DateTime? selectedDate;
  

  Timer? _debounceTimer;

  void onPageChangedDebounced(DateTime focusedDay) {
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer?.cancel();
    }
    _debounceTimer = Timer(const Duration(seconds: 3), () {
      final month = focusedDay.month;
      final year = focusedDay.year;
      Logger.printSuccess('Month: $month, Year: $year');
    });
  }


  BannerAd bannerAd = BannerAd(
    adUnitId: 'ca-app-pub-5629444706077995/5531086361',
    size: AdSize.banner,
    request: const AdRequest(),
    listener: BannerAdListener(
      onAdLoaded: (Ad ad) => Logger.printError('BannerAd loaded.'),
      onAdFailedToLoad: (Ad ad, LoadAdError error) {
        ad.dispose();
        Logger.printError('BannerAd failed to load: $error');
      },
    ),
  );

  Future<double> getExpense(int month, int year) async {
    double totalAmount = context.read<RupeeMonthlyDataBloc>().state.newExpenseData
      .where((item) => item.year == year && item.month == month && item.type == 'Expense')
      .fold(0.0, (sum, item) => sum + (item.amount ?? 0.0));

    return totalAmount;
  }

  @override
  void initState() {
    super.initState();
    bannerAd.load();
  }

  @override
  void dispose() {
    bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBlack,
        body: Column(
          children: [
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: kBlack,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 33, 30, 30),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 3)
                  )
                ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      BlocBuilder<ProfileDataBloc, ProfileBlocState>(
                        builder: (context, state) {
                          if (state is ProfileBlocLoaded) {
                            return GestureDetector(
                              onTap: () {
                                Logger.printError(state.data.toString());
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                  state.data.imageUrl ?? '',
                                ),
                              ),
                            );
                          } else {
                            return CircleAvatar(
                              radius: 30,
                              child: Icon(Icons.person),
                            );
                          }
                        },
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BlocBuilder<ProfileDataBloc, ProfileBlocState>(
                            builder: (context, state) {
                              return Text(
                                'Hello, ${state.profileData.name ?? 'Rupee Mate'}',
                                style: GoogleFonts.baskervville(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Manage your expenses and stay on track.',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ),
            SizedBox(height: 24),
            Stack(
              children: [
                TableCalendar(
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.now(),
                  focusedDay: focusedDate,
                  selectedDayPredicate: (day) => isSameDay(selectedDate, day),
                  calendarStyle: CalendarStyle(
                    tablePadding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    selectedDecoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    todayDecoration: BoxDecoration(
                      color: Colors.blueAccent,
                      shape: BoxShape.circle,
                    ),
                    defaultTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    weekendTextStyle: const TextStyle(
                      color: Colors.redAccent,
                      fontSize: 16,
                    ),
                  ),
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                    weekendStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.redAccent,
                    ),
                  ),
                  headerStyle: HeaderStyle(
                    titleCentered: true,
                    formatButtonVisible: false,
                    titleTextStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    leftChevronVisible: false,
                    rightChevronVisible: false,
                    headerPadding: const EdgeInsets.symmetric(vertical: 8.0),
                  ),
                  onPageChanged: (focusedDay){
                    onPageChangedDebounced(focusedDay);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      selectedDate = selectedDay;
                      focusedDate = focusedDay; 
                    });
                    Logger.printSuccess('$selectedDay $focusedDay');
                    context.pushNamed(AppRoute.moneyDataScreen.name, extra: selectedDay);
                  },
                ),
                Positioned(
                  top: 12.0,
                  left: 16.0,
                  right: 16.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        child: SuperTooltip(
                          popupDirection: TooltipDirection.down,
                          borderColor: kWhite,
                          backgroundColor: Colors.grey[800],
                          shadowColor: Colors.black,
                          borderWidth: 1.0,
                          content: const Text(
                            'Tap on any date to add your money data for that day.',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          child: const Icon(
                            Icons.info_outline,
                            color: kWhite,
                            size: 24,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: kBlack, // Black background
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 80, 78, 78),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 3)
                  )
                ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Total Balance Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Balance',
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
                    '₹ 2,548.00',
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
                              Icon(Icons.arrow_downward, color: Colors.green, size: 20),
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
                            '₹ 1,840.00',
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
                              Icon(Icons.arrow_upward, color: Colors.red, size: 20),
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
                            '₹ 284.00',
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
            ),
            gapH16,
            SizedBox(
              height: 50,
              child: AdWidget(ad: bannerAd),
            ),
          ],
        ),
      ),
    );
  }
}