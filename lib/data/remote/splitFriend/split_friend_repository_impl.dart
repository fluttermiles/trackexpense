import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trackexpense/core/constants.dart';
import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/remote/splitFriend/models/split_friend_model.dart';
import 'package:trackexpense/data/remote/splitFriend/split_friend_repository.dart';
import 'package:trackexpense/utils/utils.dart';

class SplitFriendRepositoryImpl implements SplitFriendRepository {

  SplitFriendRepositoryImpl();

  @override
  Future<DataState<List<SplitFriendModel>>> getSplitFriendData({required String userId}) async {
    try {
      Query query = FirebaseFirestore.instance
        .collection(AppConstants.splitFriendCollection)
        .where('userList', arrayContains: userId);
      final querySnapshot = await query.get();
      final List<SplitFriendModel> splitList = querySnapshot.docs
          .map((doc) {
            final data = doc.data();
            if (data is Map<String, dynamic>) {
              return SplitFriendModel.fromJson(data);
            } else {
              throw Exception('Invalid data format');
            }
          })
          .toList();
      Logger.printSuccess(splitList.first.toJson().toString());
      return DataStateSuccess<List<SplitFriendModel>>(data: splitList);
    } catch (e) {
      return DataStateError<List<SplitFriendModel>>(ex: e.toString());
    }
  }

  @override
  Future<DataState<SplitFriendModel>> addSplitFriendData({required SplitFriendModel splitFriendModel}) async {
    try {
      final docRef = FirebaseFirestore.instance.collection(AppConstants.splitFriendCollection).doc(splitFriendModel.splitId);
      Logger.printSuccess(splitFriendModel.toString());
      await docRef.set(splitFriendModel.toJson());
      return DataStateSuccess<SplitFriendModel>(data: splitFriendModel);
    } catch (e) {
      return DataStateError<SplitFriendModel>(ex: e.toString());
    }
  }

  @override
  Future<String> addUserToSplitFriend({required String splitId, required UserList userData}) async {
    try {
      await FirebaseFirestore.instance.collection(AppConstants.splitFriendCollection) 
        .doc(splitId)
        .update({
          'userListDetail': FieldValue.arrayUnion([userData.toJson()]),
          'userList': FieldValue.arrayUnion([userData.userId]),
          'writerList': FieldValue.arrayUnion([userData.userId]),
        });
      Logger.printSuccess('User added to the userList successfully.');
      return 'User Added';
    } catch (e) {
      Logger.printError('Error adding user to the list: $e');
      return 'User Not Added';
    }
  }
}
