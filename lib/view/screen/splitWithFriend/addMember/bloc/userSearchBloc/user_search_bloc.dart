import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/remote/profile/profile_repository.dart';
import 'package:trackexpense/utils/utils.dart';

part 'user_search_event.dart';
part 'user_search_state.dart';

class UserSearchBloc extends Bloc<UserSearchBlocEvent, UserSearchBlocState> {
  final ProfileRepository profileRepository;
  UserSearchBloc({required this.profileRepository}) : super(UserSearchBlocInitial()) {
    on<UserSearch>((event, emit) async {
      emit(UserSearchBlocLoading());
      final response = await profileRepository.searchEmails(prefix: event.prefix);
      switch(response){
        case DataStateSuccess<List<String>>(data: var data):
          emit(UserSearchBlocLoaded(data: data));
        case DataStateError<List<String>>(ex: var ex):
          emit(UserSearchBlocError(ex: ex));
      }
    });
  }
}
