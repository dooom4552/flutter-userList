// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_network/bloc/user_bloc.dart';

import '../services/user_repository.dart';
import '../widgets/action_buttons.dart';
import '../widgets/user_list.dart';

class HomePage extends StatelessWidget {
  final UsersRepository usersRepository = UsersRepository();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) => UserBloc(usersRepository: usersRepository),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Users LIst'),
          centerTitle: true,
        ),
        body: Column(
          children: [ActionButtons(), Expanded(child: UserList())],
        ),
      ),
    );
  }
}
