import 'package:trackexpense/data/remote/profile/models/profile_model.dart';
import 'package:trackexpense/utils/utils.dart';

part 'profile_data_event.dart';
part 'profile_data_state.dart';

class ProfileDataBloc extends Bloc<ProfileBlocEvent, ProfileBlocState> {
  ProfileDataBloc() : super(ProfileBlocInitial()) {
    on<ProfileData>((event, emit) {
      emit(ProfileBlocLoading());
      Logger.printError(event.profileModel.toString());
      emit(ProfileBlocLoaded(data: event.profileModel));
    });
  }
}
