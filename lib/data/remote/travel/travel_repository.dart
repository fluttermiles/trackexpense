import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/remote/travel/models/travel_model.dart';

abstract interface class TravelRepository{
  Future<DataState<List<TravelModel>>> getTravelData({required String userId});
  Future<DataState<TravelModel>> addNewTravelData({required TravelModel travelModel});
}