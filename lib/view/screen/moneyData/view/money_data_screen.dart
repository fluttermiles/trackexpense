import 'package:trackexpense/data/remote/rupeemate/models/rupeemate_model.dart';
import 'package:trackexpense/utils/box_shadow.dart';
import 'package:trackexpense/utils/capitalize.dart';
import 'package:trackexpense/utils/colors.dart';
import 'package:trackexpense/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:trackexpense/view/screen/dashboard/profile/bloc/profileData/profile_data_bloc.dart';
import 'package:trackexpense/view/screen/moneyData/bloc/rupee_data_bloc.dart';
import 'package:trackexpense/view/screen/moneyData/view/addData/add_data_screen.dart';
import 'package:trackexpense/view/screen/moneyData/view/widgets/rupee_detail_view.dart';
import 'package:trackexpense/view/screen/moneyData/view/widgets/shimmer_data.dart';

class MoneyDataScreen extends StatefulWidget {
  final DateTime selectedDate;
  const MoneyDataScreen({super.key, required this.selectedDate});

  @override
  State<MoneyDataScreen> createState() => _MoneyDataScreenState();
}

class _MoneyDataScreenState extends State<MoneyDataScreen> {

  @override
  void initState() {
    super.initState();
    context.read<RupeeDataBloc>().add(RupeeData(selectedDate: widget.selectedDate, userId: context.read<ProfileDataBloc>().state.profileData.userId ?? ''));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        title: Text(DateFormat('dd MMMM yyyy').format(widget.selectedDate), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kWhite),),
        centerTitle: true,
        leading: Row(
          children: [
            const SizedBox(width: 16,),
            GestureDetector(
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
                child: const Icon(Icons.arrow_back_ios, color: kWhite,),
              ),
            ),
          ],
        ),
        backgroundColor: kBlack,
      ),
      body: BlocBuilder<RupeeDataBloc, RupeeDataBlocState>(
        builder: (context, state) {
          return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  state.isLoading ? buildSectionShimmer()
                  : buildSection(
                    title: 'Expense',
                    dateTime: widget.selectedDate,
                    items: state.newExpenseData.where((item) => item.type == 'Expense').toList(),
                  ),
                  SizedBox(height: 16),
                  state.isLoading ? buildSectionShimmer()
                  : buildSection(
                    title: 'Credit',
                    dateTime: widget.selectedDate,
                    items: state.newExpenseData.where((item) => item.type == 'Credit').toList(),
                  ),
                  SizedBox(height: 16),
                  state.isLoading ? buildSectionShimmer()
                  : buildSection(
                    title: 'Lend',
                    dateTime: widget.selectedDate,
                    items: state.newExpenseData.where((item) => item.type == 'Lend').toList(),
                  ),
                  SizedBox(height: 16),
                  buildSection(
                    title: 'Debt',
                    dateTime: widget.selectedDate,
                    items: state.newExpenseData.where((item) => item.type == 'Debt').toList(),
                  ),
                ],
              ),
            );
        },
      ),
    );
  }

  Widget buildSection({required String title, required DateTime dateTime, required List<RupeeMateModel> items}) {
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
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: kBlack,
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                    ),
                    isScrollControlled: true,
                    builder: (context) => AddDataBottomSheet(type: title, dateTime: dateTime,),
                  );
                },
                child: const Icon(
                  Icons.add_rounded,
                  color: kWhite,
                  size: 24,
                ),
              ),
            ],
          ),
          Divider(color: kWhite, thickness: 0.3,),

          if(items.isEmpty) Center(
            child: Text('Start by Adding Your First $title', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: kWhite)),
          ),
          ...items.map((item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: GestureDetector(
                onTap: () => showCustomBottomSheet(context, item),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(capitalize(item.title ?? ''), style: TextStyle(fontSize: 16, color: kWhite)),
                    Text('${item.amount ?? 0.0}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: kWhite)),
                  ],
                ),
              ),
            )),
          // items.length < 5 ? const SizedBox() : Divider(color: kWhite, thickness: 0.3,),
          // items.length < 5 ? const SizedBox() : Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text('View More', style: TextStyle(fontSize: 14, color: kWhite))
          //   ],
          // )
        ],
      ),
    );
  }
}