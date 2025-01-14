import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/remote/travelMate/models/travelmate_models.dart';
import 'package:trackexpense/data/remote/travelMate/travelmate_repository.dart';
import 'package:trackexpense/utils/utils.dart';

part 'add_travel_mate_event.dart';
part 'add_travel_mate_state.dart';

class AddTravelMateBloc extends Bloc<AddTravelMateBlocEvent, AddTravelMateBlocState> {
  final TravelMateRepository travelMateRepository;
  AddTravelMateBloc({required this.travelMateRepository}) : super(AddTravelMateBlocInitial()) {
    on<AddTravelMate>((event, emit) async {
      emit(AddTravelMateBlocLoading());
      final response = await travelMateRepository.addNewTravelMateData(travelMateModel: event.travelMateModel);
      switch(response){
        case DataStateSuccess<TravelMateModel>(data: var data):
          emit(AddTravelMateBlocLoaded(data: data));
        case DataStateError<TravelMateModel>(ex: var ex):
          emit(AddTravelMateBlocError(ex: ex));
      }
    });
  }
}
