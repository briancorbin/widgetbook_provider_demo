import 'package:flutter/material.dart';

class UserDetailsView extends StatelessWidget {
  final String name;
  final String email;

  const UserDetailsView({Key? key, required this.name, required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('User Details')),
        body: Center(
          child: Column(children: [Text(name), Text(email)]),
        ));
  }
}
