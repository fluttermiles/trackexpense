import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/remote/travelMate/models/travelmate_models.dart';
import 'package:trackexpense/data/remote/travelMate/travelmate_repository.dart';
import 'package:trackexpense/utils/utils.dart';

part 'travel_detail_event.dart';
part 'travel_detail_state.dart';

class TravelDetailBloc extends Bloc<TravelMateDataBlocEvent, TravelMateDataBlocState> {
  final TravelMateRepository travelMateRepository;
  TravelDetailBloc({required this.travelMateRepository}) : super(TravelMateDataBlocInitial()) {
    on<TravelMateData>((event, emit) async {
      emit(TravelMateDataBlocLoading());
      final response = await travelMateRepository.getTravelMateData(travelId: event.travelId);
      switch(response){
        case DataStateSuccess<List<TravelMateModel>>(data: var data):
          emit(TravelMateDataBlocLoaded(data: data));
        case DataStateError<List<TravelMateModel>>(ex: var ex):
          emit(TravelMateDataBlocError(ex: ex));
      }
    });
  }
}
