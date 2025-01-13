import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trackexpense/core/constants.dart';
import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/remote/travel/models/travel_model.dart';
import 'package:trackexpense/data/remote/travel/travel_repository.dart';

class TravelRepositoryImpl implements TravelRepository {

  TravelRepositoryImpl();

  @override
  Future<DataState<List<TravelModel>>> getTravelData({ required String userId }) async {
    try {
      Query query = FirebaseFirestore.instance
        .collection(AppConstants.travelCollection)
        .where('userList', arrayContains: userId);
      final querySnapshot = await query.get();
      final List<TravelModel> travelList = querySnapshot.docs
          .map((doc) {
            final data = doc.data();
            if (data is Map<String, dynamic>) {
              return TravelModel.fromJson(data);
            } else {
              throw Exception('Invalid data format');
            }
          })
          .toList();
      return DataStateSuccess<List<TravelModel>>(data: travelList);
    } catch (e) {
      return DataStateError<List<TravelModel>>(ex: e.toString());
    }
  }



  @override
  Future<DataState<TravelModel>> addNewTravelData({required TravelModel travelModel}) async {
    try {
      final docRef = FirebaseFirestore.instance.collection(AppConstants.travelCollection).doc(travelModel.travelId);
      await docRef.set(travelModel.toJson());
      return DataStateSuccess<TravelModel>(data: travelModel);
    } catch (e) {
      return DataStateError<TravelModel>(ex: e.toString());
    }
  }
}
