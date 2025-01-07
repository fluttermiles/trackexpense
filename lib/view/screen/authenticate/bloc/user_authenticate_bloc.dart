import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:trackexpense/core/constants.dart';
import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/local/profile/profile_object_repo.dart';
import 'package:trackexpense/data/local/rupeeMate/rupeemate_object_repo.dart';
import 'package:trackexpense/data/remote/profile/models/profile_model.dart';
import 'package:trackexpense/data/remote/profile/profile_repository.dart';
import 'package:trackexpense/utils/logger.dart';
import 'package:trackexpense/view/screen/dashboard/profile/bloc/profileData/profile_data_bloc.dart';

part 'user_authenticate_event.dart';
part 'user_authenticate_state.dart';

class UserAuthenticateBloc extends Bloc<UserAuthenticateBlocEvent, UserAuthenticateBlocState> {
  final ProfileRepository profileRepository;
  final ProfileObjectRepository profileObjectRepository;
  final RupeeObjectRepository rupeeObjectRepository;
  final ProfileDataBloc profileDataBloc;
  UserAuthenticateBloc({required this.profileRepository, required this.rupeeObjectRepository, required this.profileDataBloc, required this.profileObjectRepository}) : super(UserAuthenticateBlocInitial()) {
    on<UserAuthenticate>((event, emit) async {
      emit(UserAuthenticateBlocLoading());
      try {
        final GoogleSignInAccount? account = await GoogleSignIn().signIn();
        if (account != null) {
          final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
          if (googleUser == null) {
            emit(UserAuthenticateBlocError(ex: 'User isn\'t selected google account'));
            return;
          }
          final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
          final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );
          // await rupeeObjectRepository.removeAllRupeeFromObjectBox();
          await FirebaseAuth.instance.signInWithCredential(credential).whenComplete(() async {
            User user = FirebaseAuth.instance.currentUser!;
            Logger.printSuccess(googleUser.id);
            Logger.printSuccess(FirebaseAuth.instance.currentUser?.uid ?? '');
            Logger.printSuccess(user.toString());

            final docRef = await FirebaseFirestore.instance.collection(AppConstants.userCollection).doc(user.uid).get();
            if(!docRef.exists) {
              ProfileModel profileModel = ProfileModel(
                name: user.displayName,
                emailId: user.email,
                imageUrl: user.photoURL,
                phoneNumber: '',
                userId: user.uid,
                countryCode: '',
                age: 0,
              );
              final response = await profileRepository.setProfileData(profileModel: profileModel);
              switch(response) {
                case DataStateSuccess<ProfileModel>(data: var data):
                  emit(UserAuthenticateBlocLoaded(data: data));
                  final objectResponse = await profileObjectRepository.setProfileToObjectBox(profileModel: data);
                  if(objectResponse is DataStateSuccess<ProfileModel>) {
                    profileDataBloc.add(ProfileData(profileModel: objectResponse.data));
                  }
                  Logger.printSuccess(data.toString());
                case DataStateError<ProfileModel>(ex: var ex):
                  emit(UserAuthenticateBlocError(ex: ex));
                  Logger.printSuccess(ex.toString());
              }
            } else {
              final response = await profileRepository.getProfileData(userId: user.uid);
              switch(response) {
                case DataStateSuccess<ProfileModel>(data: var data):
                  emit(UserAuthenticateBlocLoaded(data: data));
                  final objectResponse = await profileObjectRepository.setProfileToObjectBox(profileModel: data);
                  if(objectResponse is DataStateSuccess<ProfileModel>) {
                    profileDataBloc.add(ProfileData(profileModel: objectResponse.data));
                  }
                  Logger.printSuccess(data.toString());
                case DataStateError<ProfileModel>(ex: var ex):
                  emit(UserAuthenticateBlocError(ex: ex));
                  Logger.printSuccess(ex.toString());
              }
            }
          });
        }
      } catch (e) {
        emit(UserAuthenticateBlocError(ex: 'User isn\'t selected google account'));
        if (e is PlatformException && e.code == 'network_error') {
          Logger.printError("Network error occurred. Please check your internet connection.");
        } else {
          Logger.printError("An unexpected error occurred: $e");
        }
      }
    });
  }
}
