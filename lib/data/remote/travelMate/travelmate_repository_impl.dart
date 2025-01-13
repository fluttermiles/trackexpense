import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trackexpense/core/constants.dart';
import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/remote/travelMate/models/travelmate_models.dart';
import 'package:trackexpense/data/remote/travelMate/travelmate_repository.dart';

class TravelMateRepositoryImpl implements TravelMateRepository {

  TravelMateRepositoryImpl();

  @override
  Future<DataState<List<TravelMateModel>>> getTravelMateData({ required String travelId }) async {
    try {
      Query query = FirebaseFirestore.instance
        .collection(AppConstants.travelCollection);
      final querySnapshot = await query.get();
      final List<TravelMateModel> travelList = querySnapshot.docs
          .map((doc) {
            final data = doc.data();
            if (data is Map<String, dynamic>) {
              return TravelMateModel.fromJson(data);
            } else {
              throw Exception('Invalid data format');
            }
          })
          .toList();
      return DataStateSuccess<List<TravelMateModel>>(data: travelList);
    } catch (e) {
      return DataStateError<List<TravelMateModel>>(ex: e.toString());
    }
  }

  @override
  Future<DataState<TravelMateModel>> addNewTravelMateData({required TravelMateModel travelMateModel}) async {
    try {
      final docRef = FirebaseFirestore.instance
        .collection(AppConstants.travelCollection)
        .doc(travelMateModel.travelId)
        .collection(AppConstants.travelPaymentDataSubcollection)
        .doc(travelMateModel.id);
      await docRef.set(travelMateModel.toJson());
      return DataStateSuccess<TravelMateModel>(data: travelMateModel);
    } catch (e) {
      return DataStateError<TravelMateModel>(ex: e.toString());
    }
  }
}
