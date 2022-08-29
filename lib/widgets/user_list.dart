// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_network/bloc/user_bloc.dart';
import 'package:flutter_network/bloc/user_state.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserEmptyState) {
          return Center(
            child: Text(
              'No data received Press button "load"',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        } else if (state is UserLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is UserLoadedState) {
          return ListView.builder(
            itemCount: state.loadedUser.length,
            // ignore: avoid_unnecessary_containers
            itemBuilder: (context, index) => Container(
              color: index % 2 == 0 ? Colors.white : Colors.blue,
              child: ListTile(
                leading: Text('ID: ${state.loadedUser[index].id}',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                title: Column(
                  children: [
                    Text('${state.loadedUser[index].name}',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Email: ${state.loadedUser[index].email}',
                            style: TextStyle(fontStyle: FontStyle.italic)),
                        Text('Phone: ${state.loadedUser[index].phone}',
                            style: TextStyle(fontStyle: FontStyle.italic)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        } else if (state is UserErrorState) {
          return Center(
            child: Text(
              'Error fetching users',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        } else {
          return Center(
            child: Text(
              'Error',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }
      },
    );
  }
}
