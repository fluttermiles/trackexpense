import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:trackexpense/data/remote/travel/models/travel_model.dart';
import 'package:trackexpense/utils/app_sizes.dart';
import 'package:trackexpense/utils/box_shadow.dart';
import 'package:trackexpense/utils/colors.dart';
import 'package:trackexpense/utils/utils.dart';
import 'package:trackexpense/view/screen/travelBudget/addTravel/bloc/add_travel_bloc.dart';
import 'package:trackexpense/view/screen/travelBudget/addTravel/widgets/currency_code.dart';
import 'package:trackexpense/view/screen/travelBudget/addTravel/widgets/currency_search_modal.dart';
import 'package:trackexpense/view/screen/travelBudget/travelView/bloc/trave_data_bloc.dart';

class AddTravelView extends StatefulWidget {
  const AddTravelView({super.key});

  @override
  State<AddTravelView> createState() => _AddTravelViewState();
}

class _AddTravelViewState extends State<AddTravelView> {
  final TextEditingController travelPlaceController = TextEditingController();

  DateTime? startDate;
  DateTime? endDate;
  bool isStart = false;
  bool isCurrency = false;
  String currency = 'INR';
  String conversionCurrency = 'SELECT';
  final DateFormat dateFormat = DateFormat('dd MMM yyyy');

  void openCurrencyPicker(BuildContext context) {
    showModalBottomSheet<String>(
      context: context, 
      isScrollControlled: true,
      backgroundColor: Colors.black,
      builder: (ctx) {
        return CurrencySearchModal(
          currencyCountryMap: currencyCountryMap,
        );
      },
    ).then((selectedCode) {
      if (selectedCode != null) {
        currency = selectedCode;
        setState(() {});
      }
    });
  }

  void openConversionCurrencyPicker(BuildContext context) {
    showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.black,
      builder: (ctx) {
        return CurrencySearchModal(
          currencyCountryMap: currencyCountryMap,
        );
      },
    ).then((selectedCode) {
      if (selectedCode != null) {
        conversionCurrency = selectedCode;
        setState(() {});
      }
    });
  }

  Future<void> pickStartDate(BuildContext context) async {
    final today = DateTime.now();
    final initialDate = startDate ?? today.add(const Duration(days: 1));
    final firstDate = today;
    final lastDate = DateTime(2100);

    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate.isBefore(today) ? today : initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (ctx, child) {
        // Wrap in a dark theme
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: kWhite,
              onPrimary: kBlack,
              surface: kBlack,
              onSurface: kWhite,
            ),
            dialogBackgroundColor: kWhite,
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        isStart = false;
        startDate = picked;
        if (endDate != null && endDate!.isBefore(startDate!)) {
          endDate = null;
        }
      });
    }
  }

  void saveData() {
    if (travelPlaceController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a place.")),
      );
      return;
    }

    if (startDate == null) {
      isStart = true;
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a start date.")),
      );
      return;
    }

    // if (endDate == null) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(content: Text("Please select an end date.")),
    //   );
    //   return;
    // }

    if (currency == 'SELECT') {
      isCurrency = true;
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a currency.")),
      );
      return;
    }

    String travelId = const Uuid().v4();
    String userId = FirebaseAuth.instance.currentUser?.uid ?? 'User Not Found';

    TravelModel travelModel = TravelModel(
        creatorId: userId,
        travelId: travelId,
        userList: [userId],
        readerList: [],
        writerList: [],
        adminList: [userId],
        startDate: startDate,
        endDate: endDate,
        date: DateTime.now(),
        actualCost: 0.0,
        approxCost: 0.0,
        place: travelPlaceController.text,
        currency: currency,
        conversionCurrency:
            conversionCurrency == 'SELECT' ? '' : conversionCurrency);

    context.read<AddTravelBloc>().add(AddTravel(travelModel: travelModel));
  }

  Future<void> pickEndDate(BuildContext context) async {
    if (startDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please pick a start date first.")),
      );
      return;
    }

    final initialDate = endDate ?? startDate!;
    final firstDate = startDate!;
    final lastDate = DateTime(2100);

    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate.isBefore(firstDate) ? firstDate : initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (ctx, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: kWhite,
              onPrimary: kBlack,
              surface: kBlack,
              onSurface: kWhite,
            ),
            dialogBackgroundColor: kWhite,
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        endDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBlack,
      appBar: AppBar(
        title: Text(
          'Add Travel Details',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: kWhite),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gapH32,
            Text(
              'Travel Place',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            gapH8,
            TextField(
              controller: travelPlaceController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Travel Place like Dubai or Manali',
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[850],
                focusedBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: kWhite)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            gapH32,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Start Date* :",
                  style: TextStyle(
                      color: kWhite, fontWeight: FontWeight.bold, fontSize: 18),
                ),
                GestureDetector(
                  onTap: () => pickStartDate(context),
                  child: Container(
                    width: size.width * 0.4,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: isStart ? redColor : kWhite),
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        startDate == null
                            ? "SELECT"
                            : dateFormat.format(startDate!),
                        style: TextStyle(
                            color: kWhite,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "End Date :",
                  style: TextStyle(
                      color: kWhite, fontWeight: FontWeight.bold, fontSize: 18),
                ),
                GestureDetector(
                  onTap: () => pickEndDate(context),
                  child: Container(
                    width: size.width * 0.4,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: kWhite,
                        ),
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        endDate == null
                            ? "SELECT"
                            : dateFormat.format(endDate!),
                        style: TextStyle(
                            color: kWhite,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Currency* :",
                  style: TextStyle(
                      color: kWhite, fontWeight: FontWeight.bold, fontSize: 18),
                ),
                GestureDetector(
                  onTap: () => openCurrencyPicker(context),
                  child: Container(
                    width: size.width * 0.4,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: isCurrency ? redColor : kWhite),
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        currency,
                        style: TextStyle(
                            color: kWhite,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            gapH16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Conversion Currency :",
                  style: TextStyle(
                      color: kWhite, fontWeight: FontWeight.bold, fontSize: 18),
                ),
                GestureDetector(
                  onTap: () => openConversionCurrencyPicker(context),
                  child: Container(
                    width: size.width * 0.4,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: kWhite),
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        conversionCurrency,
                        style: TextStyle(
                            color: kWhite,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            BlocConsumer<AddTravelBloc, AddTravelBlocState>(
              listener: (context, state) {
                if(state is AddTravelBlocLoaded) {
                  String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
                  context.read<TravelDataBloc>().add(TravelData(userId: userId));
                  context.pop();
                }
              },
              builder: (context, state) {
                return InkWell(
                  onTap: () {
                    saveData();
                  },
                  child: Container(
                    height: 50,
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                        border: Border.all(color: kWhite),
                        color: state.isLoading ? kBlack : kWhite,
                        borderRadius: BorderRadius.circular(12)),
                    child: state.isLoading
                        ? const Center(
                            child: SizedBox(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator(
                                  color: kWhite,
                                )))
                        : Center(
                            child: const Text(
                              "Save",
                              style: TextStyle(
                                  color: kBlack,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                  ),
                );
              },
            ),
            gapH32
          ],
        ),
      ),
    );
  }
}
