// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_network/bloc/user_bloc.dart';
import 'package:flutter_network/bloc/user_event.dart';

class ActionButtons extends StatelessWidget {
  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
            onPressed: () {
              userBloc.add(UserLoadEvent());
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.green)),
            child: Text('Load')),
        SizedBox(
          width: 8.0,
        ),
        ElevatedButton(
          onPressed: () {
            userBloc.add(UserClearEvent());
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
          child: Text('Clear'),
        ),
      ],
    );
  }
}
