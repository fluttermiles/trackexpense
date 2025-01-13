import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/remote/travelMate/models/travelmate_models.dart';

abstract interface class TravelMateRepository{
  Future<DataState<List<TravelMateModel>>> getTravelMateData({required String travelId});
  Future<DataState<TravelMateModel>> addNewTravelMateData({required TravelMateModel travelMateModel});
}