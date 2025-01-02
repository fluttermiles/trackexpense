import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/remote/rupeemate/models/rupeemate_model.dart';

abstract interface class RupeeMateRepository{
  Future<DataState<List<RupeeMateModel>>> getRupeeData({required String userId, int? month, int? year, int? day});
  Future<DataState<RupeeMateModel>> addNewRupeeData({required RupeeMateModel rupeeMateModel});
}