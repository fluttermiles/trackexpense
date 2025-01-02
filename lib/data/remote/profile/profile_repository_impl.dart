import 'package:trackexpense/core/constants.dart';
import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/remote/profile/models/profile_model.dart';
import 'package:trackexpense/data/remote/profile/profile_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl();
  
  @override
  Future<DataState<ProfileModel>> getProfileData({required String userId}) async {
    try {
      final docRef = FirebaseFirestore.instance.collection(AppConstants.userCollection).doc(userId);
      final docSnapshot = await docRef.get();
      if (docSnapshot.exists) {
        return DataStateSuccess<ProfileModel>(data: ProfileModel.fromJson(docSnapshot.data() ?? {}));
      } else {
        return DataStateError<ProfileModel>(ex: 'User with ID $userId not found.');
      }
    } catch (e) {
      return DataStateError<ProfileModel>(ex: e.toString());
    }
  }

  @override
  Future<DataState<ProfileModel>> setProfileData({required ProfileModel profileModel}) async {
    try {
      final docRef = FirebaseFirestore.instance.collection(AppConstants.userCollection).doc(profileModel.userId);
      await docRef.set(profileModel.toJson());
      return DataStateSuccess<ProfileModel>(data: profileModel);
    } catch (e) {
      return DataStateError<ProfileModel>(ex: e.toString());
    }
  }
}