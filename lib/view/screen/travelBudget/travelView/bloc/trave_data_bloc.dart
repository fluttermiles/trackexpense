import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/remote/travel/models/travel_model.dart';
import 'package:trackexpense/data/remote/travel/travel_repository.dart';
import 'package:trackexpense/utils/utils.dart';

part 'trave_data_event.dart';
part 'trave_data_state.dart';

class TravelDataBloc extends Bloc<TravelDataBlocEvent, TravelDataBlocState> {
  final TravelRepository travelRepository;
  TravelDataBloc({required this.travelRepository}) : super(TravelDataBlocInitial()) {
    on<TravelData>((event, emit) async {
      emit(TravelDataBlocLoading());
      final response = await travelRepository.getTravelData(userId: event.userId);
      switch(response){
        case DataStateSuccess<List<TravelModel>>(data: var data):
          emit(TravelDataBlocLoaded(data: data));
        case DataStateError<List<TravelModel>>(ex: var ex):
          emit(TravelDataBlocError(ex: ex));
      }
    });
  }
}
