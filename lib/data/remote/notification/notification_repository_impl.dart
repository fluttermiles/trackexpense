import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trackexpense/core/constants.dart';
import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/remote/notification/models/notification_model.dart';
import 'package:trackexpense/data/remote/notification/notification_repository.dart';
import 'package:trackexpense/utils/utils.dart';

class NotificationRepositoryImpl implements NotificationRepository {

  NotificationRepositoryImpl();

  @override
  Future<DataState<List<NotificationModel>>> getNotificationData({ required String userId }) async {
    try {
      Query query = FirebaseFirestore.instance
        .collection(AppConstants.notificationCollection)
        .where('recieverId', isEqualTo: userId);
      final querySnapshot = await query.get();
      final List<NotificationModel> travelList = querySnapshot.docs
          .map((doc) {
            final data = doc.data();
            if (data is Map<String, dynamic>) {
              return NotificationModel.fromJson(data);
            } else {
              throw Exception('Invalid data format');
            }
          })
          .toList();
      return DataStateSuccess<List<NotificationModel>>(data: travelList);
    } catch (e) {
      return DataStateError<List<NotificationModel>>(ex: e.toString());
    }
  }

  @override
  Future<DataState<NotificationModel>> addNewNotificationData({required NotificationModel notificationModel, required String emailId}) async {
    try {
      final String isEmailExists = await checkEmailExistence(emailId);
      Logger.printError(isEmailExists);
      if(isEmailExists == 'Not Found') {
        return DataStateError<NotificationModel>(ex: 'Email Address not found');
      } else if (isEmailExists == 'Try Again') {
        return DataStateError<NotificationModel>(ex: 'Try Again');
      } else {
        NotificationModel notificationModels = notificationModel.copyWith(recieverId: isEmailExists);
        Logger.printError(notificationModels.toString());
        final docRef = FirebaseFirestore.instance.collection(AppConstants.notificationCollection).doc(notificationModel.id);
        await docRef.set(notificationModels.toJson());
        return DataStateSuccess<NotificationModel>(data: notificationModel);
      }
    } catch (e) {
      return DataStateError<NotificationModel>(ex: e.toString());
    }
  }

  Future<String> checkEmailExistence(String email) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection(AppConstants.userCollection)
          .where('emailId', isEqualTo: email)
          .get();

      if (querySnapshot.docs.isEmpty) {
        return 'Not Found';
      } else {
        return querySnapshot.docs.first['userId'];
      }
    } catch (e) {
      return 'Try Again';
    }
  }
}
