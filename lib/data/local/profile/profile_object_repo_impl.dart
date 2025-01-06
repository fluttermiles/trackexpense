import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/local/profile/profile_object_repo.dart';
import 'package:trackexpense/data/remote/profile/models/profile_model.dart';
import 'package:trackexpense/main.dart';
import 'package:trackexpense/objectbox.g.dart';
import 'package:trackexpense/profile_object_data_model.dart';
import 'package:trackexpense/utils/utils.dart';

class ProfileObjectRepositoryImpl implements ProfileObjectRepository {
  ProfileObjectRepositoryImpl();
  
  @override
  Future<DataState<ProfileModel>> getProfileFromObjectBox({required String userId}) async {
    final box = objectBox.profileBox;
    final query = box.query(ProfileObjectModel_.userId.equals(userId)).build();
    final profileObject = query.findFirst();
    query.close();

    if (profileObject == null) {
      return DataStateError<ProfileModel>(ex: 'Profile Data Not Found');
    }

    final profileModel = ProfileModel(
      userId: profileObject.userId,
      name: profileObject.name,
      emailId: profileObject.emailId,
      imageUrl: profileObject.imageUrl,
      phoneNumber: profileObject.phoneNumber,
      countryCode: profileObject.countryCode,
      age: int.tryParse(profileObject.age ?? '0'),
    );

    return DataStateSuccess<ProfileModel>(data: profileModel);
  }

  @override
  Future<void> removeProfileFromObjectBox(String userId) async {
    final box = objectBox.profileBox;
    final query = box.query(ProfileObjectModel_.userId.equals(userId)).build();
    final profileObject = query.findFirst();
    query.close();
    if (profileObject != null) {
      box.remove(profileObject.id);
      Logger.printSuccess("Profile with userId $userId removed successfully.");
    } else {
      Logger.printSuccess("No profile found with userId $userId.");
    }
  }

  @override
  Future<DataState<ProfileModel>> setProfileToObjectBox({required ProfileModel profileModel}) async {
    final profileObjectModel = ProfileObjectModel(
      userId: profileModel.userId ?? '',
      name: profileModel.name ?? '',
      emailId: profileModel.emailId ?? '',
      imageUrl: profileModel.imageUrl ?? '',
      phoneNumber: profileModel.phoneNumber ?? '',
      countryCode: profileModel.countryCode ?? '',
      age: (profileModel.age ?? 0).toString(),
      isSynced: true,
    );
    final box = objectBox.profileBox;
    box.put(profileObjectModel);
    Logger.printError(profileObjectModel.toJson().toString());
    return DataStateSuccess<ProfileModel>(data: profileModel);
  }
}