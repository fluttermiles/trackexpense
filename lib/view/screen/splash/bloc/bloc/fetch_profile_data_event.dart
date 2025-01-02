part of 'fetch_profile_data_bloc.dart';

@immutable
sealed class FetchProfileBlocEvent {}

class FetchProfileData extends FetchProfileBlocEvent {
  FetchProfileData();
}