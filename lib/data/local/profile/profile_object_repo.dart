import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/remote/profile/models/profile_model.dart';

abstract interface class ProfileObjectRepository{
  Future<DataState<ProfileModel>> getProfileFromObjectBox({required String userId});
  Future<DataState<ProfileModel>> setProfileToObjectBox({required ProfileModel profileModel});
}