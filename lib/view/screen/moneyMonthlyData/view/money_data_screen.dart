import 'package:trackexpense/data/remote/rupeemate/models/rupeemate_model.dart';
import 'package:trackexpense/utils/box_shadow.dart';
import 'package:trackexpense/utils/capitalize.dart';
import 'package:trackexpense/utils/colors.dart';
import 'package:trackexpense/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:trackexpense/view/screen/dashboard/search/view/filter/bloc/filter_bloc_bloc.dart';
import 'package:trackexpense/view/screen/moneyData/view/widgets/rupee_detail_view.dart';
import 'package:trackexpense/view/screen/moneyData/view/widgets/shimmer_data.dart';
import 'package:trackexpense/view/screen/moneyMonthlyData/bloc/money_monthly_bloc.dart';

class MoneyMonthlyScreen extends StatefulWidget {
  const MoneyMonthlyScreen({super.key});

  @override
  State<MoneyMonthlyScreen> createState() => _MoneyMonthlyScreenState();
}

class _MoneyMonthlyScreenState extends State<MoneyMonthlyScreen> {
  @override
  void initState() {
    super.initState();
    // context.read<RupeeDataBloc>().add(RupeeData(selectedDate: , userId: context.read<ProfileDataBloc>().state.profileData.userId ?? ''));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        title: BlocBuilder<FilterBlocBloc, FilterBlocState>(
          builder: (context, state) {
            return Text(
              DateFormat('MMMM yyyy').format(DateTime(state.year, state.month)),
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: kWhite),
            );
          },
        ),
        centerTitle: true,
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
        backgroundColor: kBlack,
      ),
      body: BlocBuilder<MoneyMonthlyBloc, MoneyMonthlyBlocState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                state.isLoading
                    ? buildSectionShimmer()
                    : buildSection(
                        title: 'Expense',
                        totalAmount: state.expense,
                        items: state.newExpenseData
                            .where((item) => item.type == 'Expense')
                            .toList(),
                      ),
                SizedBox(height: 16),
                state.isLoading
                    ? buildSectionShimmer()
                    : buildSection(
                        title: 'Credit',
                        totalAmount: state.credit,
                        items: state.newExpenseData
                            .where((item) => item.type == 'Credit')
                            .toList(),
                      ),
                SizedBox(height: 16),
                state.isLoading
                    ? buildSectionShimmer()
                    : buildSection(
                        title: 'Lend',
                        totalAmount: state.lend,
                        items: state.newExpenseData
                            .where((item) => item.type == 'Lend')
                            .toList(),
                      ),
                SizedBox(height: 16),
                buildSection(
                  title: 'Debt',
                  totalAmount: state.debt,
                  items: state.newExpenseData
                      .where((item) => item.type == 'Debt')
                      .toList(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildSection(
      {required String title, required List<RupeeMateModel> items, required double totalAmount}) {
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
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: kWhite),
              ),
            ],
          ),
          Divider(
            color: kWhite,
            thickness: 0.3,
          ),
          if (items.isEmpty)
            Center(
              child: Text('No Data Found for $title',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: kWhite)),
            ),
          ...items.map((item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: GestureDetector(
                  onTap: () => showCustomBottomSheet(context, item),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(capitalize(item.title ?? ''),
                          style: TextStyle(fontSize: 16, color: kWhite)),
                      Text('${item.amount ?? 0.0}',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: kWhite)),
                    ],
                  ),
                ),
              )),
          items.isNotEmpty ? Divider(
            color: kWhite,
            thickness: 0.3,
          ) : SizedBox(),
          items.isNotEmpty ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total',
                  style: TextStyle(fontSize: 16, color: kWhite)),
              Text('$totalAmount',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: kWhite)),
            ],
          ) : SizedBox()
        ],
      ),
    );
  }
}
