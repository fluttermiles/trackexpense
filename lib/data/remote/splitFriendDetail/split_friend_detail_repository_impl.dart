import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trackexpense/core/constants.dart';
import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/remote/splitFriendDetail/models/split_friend_detail_model.dart';
import 'package:trackexpense/data/remote/splitFriendDetail/split_friend_detail_repository.dart';

class SplitFriendDetailRepositoryImpl implements SplitFriendDetailRepository {

  SplitFriendDetailRepositoryImpl();

  @override
  Future<DataState<List<SplitFriendDetailModel>>> getSplitDetailData({ required String splitFriendId }) async {
    try {
      Query query = FirebaseFirestore.instance
        .collection(AppConstants.splitFriendCollection)
        .doc(splitFriendId)
        .collection(AppConstants.splitPaymentDataSubcollection);
      final querySnapshot = await query.get();
      final List<SplitFriendDetailModel> splitFriendDetailList = querySnapshot.docs
          .map((doc) {
            final data = doc.data();
            if (data is Map<String, dynamic>) {
              return SplitFriendDetailModel.fromJson(data);
            } else {
              throw Exception('Invalid data format');
            }
          })
          .toList();
      return DataStateSuccess<List<SplitFriendDetailModel>>(data: splitFriendDetailList);
    } catch (e) {
      return DataStateError<List<SplitFriendDetailModel>>(ex: e.toString());
    }
  }

  @override
  Future<DataState<SplitFriendDetailModel>> addNewSplitDetailData({required SplitFriendDetailModel splitFriendDetailModel}) async {
    try {
      final docRef = FirebaseFirestore.instance
        .collection(AppConstants.splitFriendCollection)
        .doc(splitFriendDetailModel.splitId)
        .collection(AppConstants.splitPaymentDataSubcollection)
        .doc(splitFriendDetailModel.id);
      await docRef.set(splitFriendDetailModel.toJson());
      return DataStateSuccess<SplitFriendDetailModel>(data: splitFriendDetailModel);
    } catch (e) {
      return DataStateError<SplitFriendDetailModel>(ex: e.toString());
    }
  }
}
