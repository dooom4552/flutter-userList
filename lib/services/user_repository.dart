import 'package:flutter_network/services/user_api_provider.dart';

import '../models/user.dart';

class UsersRepository {
  final UserProvider _usersProvider = UserProvider();
  Future<List<User>> getAllUsers() => _usersProvider.getUser();
}
