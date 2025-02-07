import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/remote/splitFriendDetail/models/split_friend_detail_model.dart';

abstract interface class SplitFriendDetailRepository{
  Future<DataState<List<SplitFriendDetailModel>>> getSplitDetailData({required String splitFriendId});
  Future<DataState<SplitFriendDetailModel>> addNewSplitDetailData({required SplitFriendDetailModel splitFriendDetailModel});
}