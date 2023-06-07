import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_provider_exploration/users/user.model.dart';
import 'package:widgetbook_provider_exploration/users/users.view.dart';

@widgetbook.UseCase(name: 'default', type: UsersViewInternal)
UsersViewInternal defaultView(BuildContext context) {
  return UsersViewInternal(
      isLoading: context.knobs.boolean(label: 'isLoading', initialValue: false),
      failure: null,
      users: [
        UserModel(name: 'John Doe', email: 'johndoe@email.com'),
        UserModel(name: 'Mary Jane', email: 'mj@email.com'),
        UserModel(name: 'Brian Corbin', email: 'brian@mobilecoin.com'),
        UserModel(name: 'Hello World', email: 'hello.world@gmail.com'),
      ]);
}

@widgetbook.UseCase(name: 'loading', type: UsersViewInternal)
UsersViewInternal loadingView(BuildContext context) {
  return UsersViewInternal(
      isLoading: context.knobs.boolean(label: 'isLoading', initialValue: true),
      failure: null,
      users: [
        UserModel(name: 'John Doe', email: 'johndoe@email.com'),
        UserModel(name: 'Mary Jane', email: 'mj@email.com'),
        UserModel(name: 'Brian Corbin', email: 'brian@mobilecoin.com'),
        UserModel(name: 'Hello World', email: 'hello.world@gmail.com'),
      ]);
}
