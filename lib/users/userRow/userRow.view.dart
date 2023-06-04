import 'package:flutter/material.dart';

class UserRow extends StatelessWidget {
  final String name;
  final String email;
  final Function()? onTap;

  const UserRow({
    super.key,
    required this.name,
    required this.email,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        title: Text(name),
        subtitle: Text(email),
      ),
    );
  }
}
