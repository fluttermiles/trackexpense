import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/remote/rupeemate/models/rupeemate_model.dart';

abstract interface class RupeeObjectRepository{
  Future<DataState<List<RupeeMateModel>>> getRupeeFromObjectBox();
  Future<DataState<List<RupeeMateModel>>> getRupeeDataByFilters({ required int year, int? month, int? day, String? title});
  Future<DataState<List<RupeeMateModel>>> setMultipeRupeeToObjectBox({required List<RupeeMateModel> rupeeMateList});
  Future<void> setRupeeToObjectBox({required RupeeMateModel rupeeMateModel, required bool isSynced});
  Future<void> removeRupeeFromObjectBox(String rupeeId);
  Future<void> removeAllRupeeFromObjectBox();
}