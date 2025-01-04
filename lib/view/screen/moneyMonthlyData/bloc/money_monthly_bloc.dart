
import 'package:trackexpense/data/remote/rupeemate/models/rupeemate_model.dart';
import 'package:trackexpense/utils/utils.dart';

part 'money_monthly_event.dart';
part 'money_monthly_state.dart';

class MoneyMonthlyBloc extends Bloc<MoneyMonthlyBlocEvent, MoneyMonthlyBlocState> {
  MoneyMonthlyBloc() : super(MoneyMonthlyBlocInitial()) {
    on<MoneyMonthly>((event, emit) {
      emit(MoneyMonthlyBlocLoaded(data: event.rupeeMateList));
    });
  }
}
