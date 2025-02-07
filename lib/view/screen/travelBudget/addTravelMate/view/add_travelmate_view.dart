import 'package:firebase_auth/firebase_auth.dart';
import 'package:trackexpense/data/remote/travel/models/travel_model.dart';
import 'package:trackexpense/data/remote/travelMate/models/travelmate_models.dart';
import 'package:trackexpense/utils/colors.dart';
import 'package:trackexpense/utils/utils.dart';
import 'package:trackexpense/view/screen/dashboard/profile/bloc/profileData/profile_data_bloc.dart';
import 'package:trackexpense/view/screen/travelBudget/addTravel/bloc/add_travel_bloc.dart';
import 'package:trackexpense/view/screen/travelBudget/addTravelMate/bloc/add_travel_mate_bloc.dart';
import 'package:trackexpense/view/screen/travelBudget/travelDetailView/bloc/travel_detail_bloc.dart';
import 'package:trackexpense/view/screen/travelBudget/travelView/bloc/trave_data_bloc.dart';

class AddTravelMateBottomSheet extends StatefulWidget {
  final String type;
  final DateTime dateTime;
  final TravelModel travelModel;
  final double totalAmount;
  const AddTravelMateBottomSheet({
      super.key, 
      required this.type, 
      required this.dateTime, 
      required this.travelModel,
      required this.totalAmount
    }
  );

  @override
  State<AddTravelMateBottomSheet> createState() => _AddTravelMateBottomSheetState();
}

class _AddTravelMateBottomSheetState extends State<AddTravelMateBottomSheet> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  final List<String> suggestions = [
    "Hotel",
    "Food",
    "Breakfast",
    "Lunch",
    "Dinner",
    "Snacks",
    "Transport"
  ];

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
              labelText: 'Title',
              labelStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.grey[850],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(height: 8),
          Wrap(
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
          BlocBuilder<ProfileDataBloc, ProfileBlocState>(
            builder: (context, profileState) {
              return BlocConsumer<AddTravelMateBloc, AddTravelMateBlocState>(
                listener: (context, addTravelState) {
                  if(addTravelState is AddTravelMateBlocLoaded){
                    TravelModel travelModel = TravelModel();
                    if(widget.type == 'Estimated Expense') {
                      travelModel =  widget.travelModel.copyWith( approxCost: widget.totalAmount + (addTravelState.data.amount ?? 0));
                    } else {
                      travelModel =  widget.travelModel.copyWith( actualCost: widget.totalAmount + (addTravelState.data.amount ?? 0));
                    }
                    context.read<AddTravelBloc>().add(AddTravel(travelModel: travelModel));
                    context.read<TravelDataBloc>().add(TravelData(userId: FirebaseAuth.instance.currentUser?.uid ?? ''));
                    context.read<TravelDetailBloc>().add(TravelMateData(travelId: widget.travelModel.travelId ?? ''));
                    Navigator.pop(context);
                  }
                },
                builder: (context, addTravelState) {
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

                      String travelMateId = const Uuid().v4();

                      final TravelMateModel travelMateModel = TravelMateModel(
                          title: title.toLowerCase(),
                          travelId: widget.travelModel.travelId,
                          description: description,
                          amount: parsedAmount,
                          date: DateTime.now(),
                          day: widget.dateTime.day,
                          month: widget.dateTime.month,
                          year: widget.dateTime.year,
                          type: widget.type,
                          id: travelMateId,
                          userId: profileState.profileData.userId);
                      Logger.printSuccess(travelMateModel.toString());
                      context.read<AddTravelMateBloc>().add(AddTravelMate(travelMateModel: travelMateModel));
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
                        child: addTravelState.isLoading ? SizedBox(height: 28, width: 28, child: CircularProgressIndicator(color: kWhite))
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
