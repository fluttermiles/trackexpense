import 'package:firebase_auth/firebase_auth.dart';
import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/local/profile/profile_object_repo.dart';
import 'package:trackexpense/data/remote/profile/models/profile_model.dart';
import 'package:trackexpense/utils/utils.dart';
import 'package:trackexpense/view/screen/dashboard/profile/bloc/profileData/profile_data_bloc.dart';

part 'fetch_profile_data_event.dart';
part 'fetch_profile_data_state.dart';

class FetchProfileDataBloc extends Bloc<FetchProfileBlocEvent, FetchProfileBlocState> {
  final ProfileObjectRepository profileObjectRepository;
  final ProfileDataBloc profileDataBloc;

  FetchProfileDataBloc({required this.profileObjectRepository, required this.profileDataBloc}) : super(FetchProfileBlocInitial()) {
    on<FetchProfileData>((event, emit) async {
      String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
      if(userId.isNotEmpty){
        emit(FetchProfileBlocLoading());
        final response = await profileObjectRepository.getProfileFromObjectBox(userId: userId);
        switch(response) {
          case DataStateSuccess<ProfileModel>(data: var data):
            emit(FetchProfileBlocLoaded(data: data));
            profileDataBloc.add(ProfileData(profileModel: data));
            Logger.printSuccess(data.toString());
          case DataStateError<ProfileModel>(ex: var ex):
            emit(FetchProfileBlocError(ex: ex));
            Logger.printSuccess(ex.toString());
        }
      } else {
        emit(FetchProfileBlocError());
      }
    });
  }
}
