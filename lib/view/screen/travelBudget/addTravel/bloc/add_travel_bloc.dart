
import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/remote/travel/models/travel_model.dart';
import 'package:trackexpense/data/remote/travel/travel_repository.dart';
import 'package:trackexpense/utils/utils.dart';

part 'add_travel_event.dart';
part 'add_travel_state.dart';

class AddTravelBloc extends Bloc<AddTravelBlocEvent, AddTravelBlocState> {
  final TravelRepository travelRepository;
  AddTravelBloc({required this.travelRepository}) : super(AddTravelBlocInitial()) {
    on<AddTravel>((event, emit) async {
      emit(AddTravelBlocLoading());
      final response =  await travelRepository.addNewTravelData(travelModel: event.travelModel);
      switch(response){
          case DataStateSuccess<TravelModel>(data: var data):
            emit(AddTravelBlocLoaded(data: data));
          case DataStateError<TravelModel>():
            emit(AddTravelBlocError());
      }
    });
  }
}
