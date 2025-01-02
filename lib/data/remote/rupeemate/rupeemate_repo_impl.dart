import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trackexpense/core/constants.dart';
import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/remote/rupeemate/models/rupeemate_model.dart';
import 'package:trackexpense/data/remote/rupeemate/rupeemate_repo.dart';

class RupeeMateRepositoryImpl implements RupeeMateRepository {

  RupeeMateRepositoryImpl();

  @override
  Future<DataState<List<RupeeMateModel>>> getRupeeData({
    required String userId,
    int? month,
    int? year,
    int? day,
  }) async {
    try {
      Query query = FirebaseFirestore.instance
          .collection(AppConstants.userCollection)
          .doc(userId)
          .collection(AppConstants.userPaymentDataSubcollection);
      if (year != null) {
        query = query.where('year', isEqualTo: year);
      }
      if (month != null) {
        query = query.where('month', isEqualTo: month);
      }
      if (day != null) {
        query = query.where('day', isEqualTo: day);
      }
      final querySnapshot = await query.get();
      final List<RupeeMateModel> rupeeMateList = querySnapshot.docs
          .map((doc) {
            final data = doc.data();
            if (data is Map<String, dynamic>) {
              return RupeeMateModel.fromJson(data);
            } else {
              throw Exception('Invalid data format');
            }
          })
          .toList();
      return DataStateSuccess<List<RupeeMateModel>>(data: rupeeMateList);
    } catch (e) {
      return DataStateError<List<RupeeMateModel>>(ex: e.toString());
    }
  }



  @override
  Future<DataState<RupeeMateModel>> addNewRupeeData({required RupeeMateModel rupeeMateModel}) async {
    try {
      final docRef = FirebaseFirestore.instance.collection(AppConstants.userCollection).doc(rupeeMateModel.userId).collection(AppConstants.userPaymentDataSubcollection).doc(rupeeMateModel.id);
      await docRef.set(rupeeMateModel.toJson());
      return DataStateSuccess<RupeeMateModel>(data: rupeeMateModel);
    } catch (e) {
      return DataStateError<RupeeMateModel>(ex: e.toString());
    }
  }
}
