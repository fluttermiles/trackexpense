import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/remote/notification/models/notification_model.dart';

abstract interface class NotificationRepository{
  Future<DataState<List<NotificationModel>>> getNotificationData({required String userId});
  Future<DataState<NotificationModel>> addNewNotificationData({required NotificationModel notificationModel, required String emailId});
}