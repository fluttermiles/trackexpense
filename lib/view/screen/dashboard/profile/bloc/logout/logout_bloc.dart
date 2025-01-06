import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:trackexpense/data/local/profile/profile_object_repo.dart';
import 'package:trackexpense/data/local/rupeeMate/rupeemate_object_repo.dart';
import 'package:trackexpense/data/remote/profile/models/profile_model.dart';
import 'package:trackexpense/utils/utils.dart';
import 'package:trackexpense/view/screen/dashboard/profile/bloc/profileData/profile_data_bloc.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutBlocEvent, LogoutBlocState> {
  final ProfileDataBloc profileDataBloc;
  final RupeeObjectRepository rupeeObjectRepository;
  final ProfileObjectRepository profileObjectRepository;
  LogoutBloc({required this.profileDataBloc, required this.profileObjectRepository, required this.rupeeObjectRepository}) : super(LogoutBlocInitial()) {
    on<LogoutEvent>((event, emit) async {
      await FirebaseAuth.instance.signOut();
      Logger.printInfo('Firebase sign-out successful.');
      final GoogleSignIn googleSignIn = GoogleSignIn();
      if (await googleSignIn.isSignedIn()) {
        Logger.printInfo('Google account detected. Signing out from Google...');
        await googleSignIn.signOut();
        try {
          Logger.printInfo('Attempting to disconnect Google account...');
          await googleSignIn.disconnect();
          Logger.printSuccess('Google account successfully disconnected.');
        } catch (disconnectError) {
          Logger.printError('Failed to disconnect Google account: $disconnectError');
        }
      } else {
        Logger.printInfo('No Google account signed in.');
      }
      await profileObjectRepository.removeProfileFromObjectBox(profileDataBloc.state.profileData.userId ?? '');
      await rupeeObjectRepository.removeAllRupeeFromObjectBox();
      profileDataBloc.add(ProfileData(profileModel: ProfileModel()));
      emit(LogoutBlocLoaded());
      Logger.printSuccess('User successfully logged out.');
    });
  }
}
