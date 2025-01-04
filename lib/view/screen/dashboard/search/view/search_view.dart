import 'package:trackexpense/utils/app_sizes.dart';
import 'package:trackexpense/utils/colors.dart';
import 'package:trackexpense/utils/utils.dart';
import 'package:trackexpense/view/screen/dashboard/home/bloc/expenseCreditBloc/expense_credit_bloc.dart';
import 'package:trackexpense/view/screen/dashboard/home/bloc/rupeeMonthlyDataBloc/rupee_monthly_data_bloc.dart';
import 'package:trackexpense/view/screen/dashboard/search/view/filter/filter_bottomsheet.dart';
import 'package:trackexpense/view/screen/dashboard/search/widget/custom_search_widget.dart';
import 'package:trackexpense/view/screen/dashboard/search/widget/monthly_line_chart.dart';
import 'package:trackexpense/view/screen/dashboard/search/widget/monthly_pie_chart.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        backgroundColor: kBlack,
        title: Text(
          'Search',
          style: GoogleFonts.libreBaskerville(
            color: kWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      BlocBuilder<RupeeMonthlyDataBloc, RupeeMonthlyDataBlocState>(
                        builder: (context, state) {
                          return CustomSearchField(
                            suggestions: state.uniqueTitles,
                            onSuggestionSelected: (String? value) {},
                          );
                        },
                      ),
                      gapW8,
                      InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              backgroundColor: kBlack,
                              context: context,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16)),
                              ),
                              isScrollControlled: true,
                              builder: (context) => FilterBottomSheet(),
                            );
                          },
                          child: Icon(
                            Icons.tune,
                            color: kWhite,
                            size: 34,
                          ))
                    ],
                  )),
            ),
            gapH24,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Current Month Chart',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            gapH32,
            BlocBuilder<RupeeMonthlyDataBloc, RupeeMonthlyDataBlocState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: MonthlyLineChart(data: state.newExpenseData)),
                );
              },
            ),
            gapH16,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Current Month Pie Chart',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            BlocBuilder<ExpenseCreditBloc, ExpenseCreditBlocState>(
              builder: (context, state) {
                return MonthlyPieChart(
                  credit: state.credit,
                  expense: state.expense,
                  lend: state.lend,
                  debt: state.debt,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
