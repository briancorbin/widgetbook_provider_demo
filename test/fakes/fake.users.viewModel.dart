import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widgetbook_provider_exploration/users/user.model.dart';
import 'package:widgetbook_provider_exploration/users/user.service.dart';
import 'package:widgetbook_provider_exploration/users/users.viewModel.dart';

class FakeUsersViewModel extends ChangeNotifier
    with Fake
    implements UsersViewModel {
  @override
  bool loading;

  @override
  List<UserModel> users;

  @override
  Failure? failure;

  @override
  UserModel? selectedUser;

  FakeUsersViewModel({
    this.loading = false,
    this.users = const [],
    this.failure,
    this.selectedUser,
  });
}
