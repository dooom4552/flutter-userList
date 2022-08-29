abstract class UserState {}

class UserEmptyState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  List<dynamic> loadedUser;
  // ignore: unnecessary_null_comparison
  UserLoadedState({required this.loadedUser}) : assert(loadedUser != null);
}

class UserErrorState extends UserState {}
