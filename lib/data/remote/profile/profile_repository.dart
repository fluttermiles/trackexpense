import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/remote/profile/models/profile_model.dart';

abstract interface class ProfileRepository{
  Future<DataState<ProfileModel>> getProfileData({required String userId});
  Future<DataState<ProfileModel>> setProfileData({required ProfileModel profileModel});
}