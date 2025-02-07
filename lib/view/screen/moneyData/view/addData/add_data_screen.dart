import 'package:trackexpense/data/remote/rupeemate/models/rupeemate_model.dart';
import 'package:trackexpense/utils/colors.dart';
import 'package:trackexpense/utils/utils.dart';
import 'package:trackexpense/view/screen/dashboard/profile/bloc/profileData/profile_data_bloc.dart';
import 'package:trackexpense/view/screen/moneyData/bloc/rupee_data_bloc.dart';
import 'package:trackexpense/view/screen/moneyData/view/addData/bloc/add_expense_bloc_bloc.dart';

class AddDataBottomSheet extends StatefulWidget {
  final String type;
  final DateTime dateTime;
  const AddDataBottomSheet(
      {super.key, required this.type, required this.dateTime});

  @override
  State<AddDataBottomSheet> createState() => _AddDataBottomSheetState();
}

class _AddDataBottomSheetState extends State<AddDataBottomSheet> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  final TextEditingController _amountController = TextEditingController();

  final List<String> suggestions = [
    "Lunch",
    "Dinner",
    "Snacks",
    "Groceries",
    "Transport"
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          Text(
            'Add ${widget.type}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          TextField(
            controller: _titleController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: (widget.type == 'Expense' || widget.type == 'Credit')
                  ? 'Title'
                  : 'Name',
              labelStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.grey[850],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(height: widget.type == 'Expense' ? 8 : 0),
          widget.type == 'Expense'
              ? Wrap(
                  spacing: 8.0,
                  children: suggestions.map((suggestion) {
                    return GestureDetector(
                      onTap: () {
                        _titleController.text = suggestion;
                      },
                      child: Chip(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24)),
                        label: Text(
                          suggestion,
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: kBlack,
                      ),
                    );
                  }).toList(),
                )
              : const SizedBox(),
          SizedBox(height: 16),
          TextField(
            controller: _descriptionController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Description (Optional)',
              labelStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.grey[850],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Amount',
              labelStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.grey[850],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(height: 16),
          BlocBuilder<ProfileDataBloc, ProfileBlocState>(
            builder: (context, profileState) {
              return BlocConsumer<AddExpenseBlocBloc, AddExpenseBlocState>(
                listener: (context, addExpenseState) {
                  if(addExpenseState is AddExpenseBlocLoaded){
                    context.read<RupeeDataBloc>().add(RupeeData(selectedDate: widget.dateTime, userId: profileState.profileData.userId ?? ''));
                    Navigator.pop(context);
                  }
                },
                builder: (context, addExpenseState) {
                  return InkWell(
                    onTap: () {
                      String title = _titleController.text.trim();
                      String description = _descriptionController.text.trim();
                      String amount = _amountController.text.trim();

                      if (title.isEmpty || amount.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Title and Amount are required!')),
                        );
                        return;
                      }

                      double? parsedAmount = double.tryParse(amount);
                      if (parsedAmount == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please enter a valid numeric amount!')),
                        );
                        return;
                      }

                      String rupeeId = const Uuid().v4();

                      final RupeeMateModel rupeeMateModel = RupeeMateModel(
                          title: title.toLowerCase(),
                          description: description,
                          amount: parsedAmount,
                          date: DateTime.now(),
                          day: widget.dateTime.day,
                          month: widget.dateTime.month,
                          year: widget.dateTime.year,
                          type: widget.type,
                          id: rupeeId,
                          userId: profileState.profileData.userId);
                      Logger.printSuccess(rupeeMateModel.toString());
                      context.read<AddExpenseBlocBloc>().add(AddExpense(expenseModel: rupeeMateModel));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: kWhite),
                        color: kBlack,
                      ),
                      child: Center(
                        child: addExpenseState.isLoading ? SizedBox(height: 28, width: 28, child: CircularProgressIndicator(color: kWhite))
                        : Text(
                          'Save',
                          style: TextStyle(
                            color: kWhite,
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                          )
                        )
                      ),
                    ),
                  );
                },
              );
            },
          ),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
