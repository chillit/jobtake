/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobtake/main.dart';

class UserPage extends StatelessWidget {
  final User user;

  const UserPage({
    Key? key,
    required this.user
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(user.fio),
    ),
    body:Center(
      child: Column(
        children: <Widget>[
          Text(
            user.fio,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    )
  );
}