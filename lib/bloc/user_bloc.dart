// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_network/bloc/user_state.dart';
import '../models/user.dart';
import '../services/user_repository.dart';
import 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UsersRepository usersRepository;
  // ignore: unnecessary_null_comparison
  UserBloc({required this.usersRepository}) : super(UserEmptyState()) {
    on<UserLoadEvent>(_onClickLoadEvent);
    on<UserClearEvent>(_onClickClearEvent);
  }
  _onClickLoadEvent(UserLoadEvent event, Emitter<UserState> emit) async {
    try {
      emit(UserLoadingState());
      final List<User> loadedUserList = await usersRepository.getAllUsers();
      emit(UserLoadedState(loadedUser: loadedUserList));
    } catch (_) {
      emit(UserErrorState());
    }
  }

  _onClickClearEvent(UserClearEvent event, Emitter<UserState> emit) {
    emit(UserEmptyState());
  }

  // Stream<UserState> mapEventToState(UserEvent event) async* {
  //   if (event is UserLoadEvent) {
  //     yield UserLoadingState();
  //     try {
  //       final List<User> loadedUserList = await usersRepository.getAllUsers();
  //       yield UserLoadedState(loadedUser: loadedUserList);
  //     } catch (_) {
  //       yield UserErrorState();
  //     }
  //   } else if (event is UserClearEvent) {
  //     yield UserEmptyState();
  //   }
  // }
}
