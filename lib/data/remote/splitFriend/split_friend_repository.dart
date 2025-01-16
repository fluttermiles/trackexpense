import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/remote/splitFriend/models/split_friend_model.dart';

abstract interface class SplitFriendRepository{
  Future<DataState<List<SplitFriendModel>>> getSplitFriendData({required String userId});
  Future<DataState<SplitFriendModel>> addSplitFriendData({required SplitFriendModel splitFriendModel});
}