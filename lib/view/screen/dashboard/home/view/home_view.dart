import 'dart:async';

import 'package:super_tooltip/super_tooltip.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:trackexpense/utils/app_sizes.dart';
import 'package:trackexpense/utils/colors.dart';
import 'package:trackexpense/utils/utils.dart';
import 'package:trackexpense/view/screen/dashboard/home/bloc/expenseCreditBloc/expense_credit_bloc.dart';
import 'package:trackexpense/view/screen/dashboard/home/bloc/rupeeMonthlyBloc/rupee_monthly_bloc.dart';
import 'package:trackexpense/view/screen/dashboard/home/bloc/rupeeMonthlyDataBloc/rupee_monthly_data_bloc.dart';
import 'package:trackexpense/view/screen/dashboard/home/widgets/monthly_balance_widget.dart';
import 'package:trackexpense/view/screen/dashboard/profile/bloc/profileData/profile_data_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  DateTime focusedDate = DateTime.now();
  DateTime? selectedDate;
  DateTime currentPage = DateTime.now();

  Timer? _debounceTimer;

  void onPageChangedDebounced(DateTime focusedDay, String userId) {
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer?.cancel();
    }
    _debounceTimer = Timer(const Duration(seconds: 1), () {
      focusedDate = focusedDay;
      final month = focusedDay.month;
      final year = focusedDay.year;
      currentPage = focusedDay;
      if(focusedDay.month == DateTime.now().month && focusedDay.year == DateTime.now().year) {
        Logger.printError('Focused Day is equal to current Date');
      } else {
        context.read<RupeeMonthlyBloc>().add(RupeeMonthly(month: month, year: year, userId: userId));
      }
      setState(() {});
      Logger.printSuccess('Month: $month, Year: $year');
    });
  }

  // id: ca-app-pub-5629444706077995/5531086361

  BannerAd bannerAd = BannerAd(
    adUnitId: 'ca-app-pub-3940256099942544/9214589741',
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
        body: SingleChildScrollView(
          child: Column(
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
                          offset: const Offset(0, 3))
                    ]),
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
                                  fontWeight: FontWeight.w600),
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
              BlocBuilder<ProfileDataBloc, ProfileBlocState>(
                builder: (context, state) {
                  return Stack(
                    children: [
                      TableCalendar(
                        firstDay: DateTime.utc(2010, 10, 16),
                        lastDay: DateTime.now(),
                        focusedDay: focusedDate,
                        selectedDayPredicate: (day) =>
                            isSameDay(selectedDate, day),
                        calendarStyle: CalendarStyle(
                          tablePadding:
                              const EdgeInsets.only(top: 8.0, bottom: 8.0),
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
                          headerPadding:
                              const EdgeInsets.symmetric(vertical: 8.0),
                        ),
                        onPageChanged: (focusedDay) {
                          onPageChangedDebounced(
                              focusedDay, state.profileData.userId ?? '');
                        },
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            selectedDate = selectedDay;
                            focusedDate = focusedDay;
                          });
                          Logger.printSuccess('$selectedDay $focusedDay');
                          context.pushNamed(AppRoute.moneyDataScreen.name, extra: selectedDay).then((value){
                            context.read<RupeeMonthlyDataBloc>().add(RupeeMonthlyData(month: DateTime.now().month, year: DateTime.now().year, userId: state.profileData.userId ?? ''));
                          });
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
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
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
                  );
                },
              ),
              (currentPage.month == DateTime.now().month &&
                currentPage.year == DateTime.now().year)
                ? const SizedBox()
                : BlocBuilder<RupeeMonthlyBloc, RupeeMonthlyBlocState>(
                builder: (context, state) {
                  return BalanceWidget(
                    selectedDate: currentPage,
                    credit: state.credit,
                    lend: state.lend,
                    expense: state.expense,
                    debt: state.debt
                  );
                },
              ),
              BlocBuilder<ExpenseCreditBloc, ExpenseCreditBlocState>(
                builder: (context, state) {
                  return Container(
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
                                  '₹ ${state.credit.toStringAsFixed(2)}',
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
                                  '₹ ${state.expense.toStringAsFixed(2)}',
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
              ),
              gapH16,
              SizedBox(
                height: 50,
                child: AdWidget(ad: bannerAd),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
