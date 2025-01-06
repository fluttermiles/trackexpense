import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/local/rupeeMate/rupeemate_object_repo.dart';
import 'package:trackexpense/data/remote/rupeemate/models/rupeemate_model.dart';
import 'package:trackexpense/main.dart';
import 'package:trackexpense/objectbox.g.dart';
import 'package:trackexpense/rupee_object_data_model.dart';
import 'package:trackexpense/utils/utils.dart';

class RupeeObjectRepositoryImpl implements RupeeObjectRepository {
  RupeeObjectRepositoryImpl();
  
  @override
  Future<DataState<List<RupeeMateModel>>> getRupeeFromObjectBox() async {
    final box = objectBox.rupeeBox;
    final rupeeObjectDataList = box.getAll();

    final rupeeMateList = rupeeObjectDataList.map((rupeeObject) {
      return RupeeMateModel(
        id: rupeeObject.rupeeId,
        userId: rupeeObject.userId,
        title: rupeeObject.title,
        description: rupeeObject.description,
        amount: rupeeObject.amount,
        date: rupeeObject.date,
        day: rupeeObject.day,
        month: rupeeObject.month,
        year: rupeeObject.year,
        type: rupeeObject.type,
      );
    }).toList();

    return DataStateSuccess<List<RupeeMateModel>>(data: rupeeMateList);
  }

  @override
  Future<DataState<List<RupeeMateModel>>> getRupeeDataByFilters({
    required int year,
    int? month,
    int? day,
    String? title,
  }) async {
    final box = objectBox.rupeeBox;
    QueryBuilder<RupeeObjectDataModel> queryBuilder;

    if(month != null && title != null && day != null) {
      queryBuilder = box.query(RupeeObjectDataModel_.title.contains(title) & RupeeObjectDataModel_.month.equals(month) & RupeeObjectDataModel_.year.equals(year) & RupeeObjectDataModel_.day.equals(day));
    } else if(month != null && title != null) {
      queryBuilder = box.query(RupeeObjectDataModel_.title.contains(title) & RupeeObjectDataModel_.month.equals(month) & RupeeObjectDataModel_.year.equals(year));
    } else if(month != null &&  day != null) {
      queryBuilder = box.query(RupeeObjectDataModel_.month.equals(month) & RupeeObjectDataModel_.day.equals(day) & RupeeObjectDataModel_.year.equals(year));
    } else {
      queryBuilder = box.query(RupeeObjectDataModel_.year.equals(year));
    }

    final query = queryBuilder.build();
    final rupeeObjectDataList = query.find();
    query.close();

    final rupeeMateList = rupeeObjectDataList.map((rupeeObject) {
      return RupeeMateModel(
        id: rupeeObject.rupeeId,
        userId: rupeeObject.userId,
        title: rupeeObject.title,
        description: rupeeObject.description,
        amount: rupeeObject.amount,
        date: rupeeObject.date,
        day: rupeeObject.day,
        month: rupeeObject.month,
        year: rupeeObject.year,
        type: rupeeObject.type,
      );
    }).toList();

    Logger.printError(rupeeMateList.toString());
    return DataStateSuccess<List<RupeeMateModel>>(data: rupeeMateList);
  }

  @override
  Future<DataState<List<RupeeMateModel>>> setMultipeRupeeToObjectBox({required List<RupeeMateModel> rupeeMateList}) async {
    final box = objectBox.rupeeBox;

    final rupeeObjectDataList = rupeeMateList.map((rupeeMate) {
      return RupeeObjectDataModel(
        rupeeId: rupeeMate.id,
        userId: rupeeMate.userId,
        title: rupeeMate.title,
        description: rupeeMate.description,
        date: rupeeMate.date,
        amount: rupeeMate.amount,
        day: rupeeMate.day,
        month: rupeeMate.month,
        year: rupeeMate.year,
        type: rupeeMate.type,
        isSynced: true,
      );
    }).toList();
    box.putMany(rupeeObjectDataList);
    return DataStateSuccess<List<RupeeMateModel>>(data: rupeeMateList);
  }

  @override
  Future<void> setRupeeToObjectBox({required RupeeMateModel rupeeMateModel, required bool isSynced}) async {
    final box = objectBox.rupeeBox;

    final rupeeObjectDataModel = RupeeObjectDataModel(
      rupeeId: rupeeMateModel.id,
      userId: rupeeMateModel.userId,
      title: rupeeMateModel.title,
      description: rupeeMateModel.description,
      date: rupeeMateModel.date,
      amount: rupeeMateModel.amount,
      day: rupeeMateModel.day,
      month: rupeeMateModel.month,
      year: rupeeMateModel.year,
      type: rupeeMateModel.type,
      isSynced: isSynced,
    );

    box.put(rupeeObjectDataModel);
    Logger.printSuccess("RupeeMateModel saved to ObjectBox successfully with isSynced = $isSynced.");
  }

  @override
  Future<void> removeRupeeFromObjectBox(String rupeeId) async {
    final box = objectBox.rupeeBox;

    final query = box.query(RupeeObjectDataModel_.rupeeId.equals(rupeeId)).build();
    final rupeeObject = query.findFirst();
    query.close();
    if (rupeeObject != null) {
      box.remove(rupeeObject.id);
      Logger.printSuccess("RupeeObjectDataModel with rupeeId $rupeeId removed successfully.");
    } else {
      Logger.printSuccess("No record found with rupeeId $rupeeId.");
    }
  }

  @override
  Future<void> removeAllRupeeFromObjectBox() async {
  final box = objectBox.rupeeBox;
  box.removeAll();

  Logger.printSuccess("All RupeeObjectDataModel records removed successfully from ObjectBox.");
}
}