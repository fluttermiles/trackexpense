import 'package:searchfield/searchfield.dart';
import 'package:trackexpense/utils/capitalize.dart';
import 'package:trackexpense/utils/colors.dart';
import 'package:trackexpense/utils/utils.dart';
import 'package:trackexpense/view/screen/dashboard/home/bloc/rupeeMonthlyDataBloc/rupee_monthly_data_bloc.dart';
import 'package:trackexpense/view/screen/dashboard/search/view/filter/bloc/filter_bloc_bloc.dart';
import 'package:trackexpense/view/screen/moneyMonthlyData/bloc/money_monthly_bloc.dart';

class CustomSearchField extends StatefulWidget {
  final List<String> suggestions;
  final ValueChanged<String?> onSuggestionSelected;

  const CustomSearchField({
    super.key,
    required this.suggestions,
    required this.onSuggestionSelected,
  });

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: kWhite,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: BlocBuilder<RupeeMonthlyDataBloc, RupeeMonthlyDataBlocState>(
          builder: (context, rupeeMonthlyState) {
            return BlocBuilder<FilterBlocBloc, FilterBlocState>(
              builder: (context, filterState) {
                return SearchField<String>(
                  controller: searchController,
                  suggestionsDecoration: SuggestionDecoration(
                      borderRadius: BorderRadius.circular(12),
                      elevation: 40,
                      // padding: EdgeInsets.symmetric(horizontal: 16),
                      width: MediaQuery.of(context).size.width * 0.65,
                      color: kBlack,
                      border: Border.all(color: kWhite),
                      boxShadow: [
                        BoxShadow(
                            color: kWhite,
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: const Offset(0, 3))
                      ]),
                  suggestions: widget.suggestions
                      .map((e) => SearchFieldListItem<String>(capitalize(e)))
                      .toList(),
                  suggestionState: Suggestion.hidden,
                  hint: 'Search ...',
                  searchInputDecoration: SearchInputDecoration(
                    hintText: 'Search ...',
                    hintStyle: TextStyle(
                      color: kGrey,
                    ),
                    searchStyle: TextStyle(
                        color: kWhite,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    border: InputBorder.none,
                  ),
                  onSuggestionTap: (SearchFieldListItem<String> word) {
                    searchController.text = word.searchKey;
                    if(word.searchKey == 'All') {
                      // context.read<MoneyMonthlyBloc>().add(MoneyMonthly(rupeeMateList: rupeeMonthlyState.allData.where((item) => item.year == filterState.year && item.month == filterState.month).toList()));
                      context.read<MoneyMonthlyBloc>().add(MoneyMonthly(title: '', year: filterState.year, month: filterState.month));
                    } else {
                      // context.read<MoneyMonthlyBloc>().add(MoneyMonthly(rupeeMateList: rupeeMonthlyState.allData.where((item) => item.title == word.searchKey.toLowerCase() && item.year == filterState.year && item.month == filterState.month).toList()));
                      context.read<MoneyMonthlyBloc>().add(MoneyMonthly(title: word.searchKey.toLowerCase(), year: filterState.year, month: filterState.month));
                    }
                    context.pushNamed(AppRoute.moneyMonthlyScreen.name);
                    Logger.printError(word.searchKey.toString());
                  },
                  itemHeight: 50,
                  maxSuggestionsInViewPort: 5,
                  suggestionStyle: const TextStyle(
                    color: kWhite,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
