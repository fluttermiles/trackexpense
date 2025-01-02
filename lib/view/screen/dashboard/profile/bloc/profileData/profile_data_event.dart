part of 'profile_data_bloc.dart';

@immutable
sealed class ProfileBlocEvent {}

class ProfileData extends ProfileBlocEvent {
  final ProfileModel profileModel;
  ProfileData({required this.profileModel});
}