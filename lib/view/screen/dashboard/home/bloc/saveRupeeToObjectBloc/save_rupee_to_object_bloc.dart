import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/local/rupeeMate/rupeemate_object_repo.dart';
import 'package:trackexpense/data/remote/rupeemate/models/rupeemate_model.dart';
import 'package:trackexpense/data/remote/rupeemate/rupeemate_repo.dart';
import 'package:trackexpense/utils/utils.dart';
import 'package:trackexpense/view/screen/dashboard/home/bloc/rupeeMonthlyDataBloc/rupee_monthly_data_bloc.dart';

part 'save_rupee_to_object_event.dart';
part 'save_rupee_to_object_state.dart';

class SaveRupeeToObjectBloc extends Bloc<SaveRupeeToObjectEvent, SaveRupeeToObjectState> {
  final RupeeMateRepository rupeeMateRepository;
  final RupeeObjectRepository rupeeObjectRepository;
  final RupeeMonthlyDataBloc rupeeMonthlyDataBloc;
  SaveRupeeToObjectBloc({required this.rupeeMateRepository, required this.rupeeObjectRepository, required this.rupeeMonthlyDataBloc}) : super(SaveRupeeToObjectInitial()) {
    on<SaveRupeeToObject>((event, emit) async {
      emit(SaveRupeeToObjectLoading());
      final response = await rupeeMateRepository.getRupeeData(userId: event.userId);
      switch(response) {
        case DataStateSuccess<List<RupeeMateModel>>(data: var data):
          Logger.printSuccess(data.toString());
          await rupeeObjectRepository.setMultipeRupeeToObjectBox(rupeeMateList: data);
          rupeeMonthlyDataBloc.add(RupeeMonthlyData());
          emit(SaveRupeeToObjectLoaded(data: data));
        case DataStateError<List<RupeeMateModel>>(ex: var ex):
          Logger.printError(ex.toString());
          emit(SaveRupeeToObjectError(ex: ex));
      }
    });
  }
}
