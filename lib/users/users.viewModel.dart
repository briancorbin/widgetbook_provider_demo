import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'addUser/addUser.view.dart';
import 'addUser/addUser.viewModel.dart';
import 'user.model.dart';
import 'user.service.dart';
import 'userDetails.view.dart';

class UsersViewModel extends ChangeNotifier {
  bool _loading = false;
  List<UserModel> _users = [];
  Failure? _failure;
  UserModel? _selectedUser;

  bool get loading => _loading;
  List<UserModel> get users => _users;
  Failure? get failure => _failure;
  UserModel? get selectedUser => _selectedUser;

  UsersViewModel() {
    getUsers();
  }

  setLoading(bool value) async {
    _loading = value;
    notifyListeners();
  }

  setUsers(List<UserModel> value) {
    _users = value;
    notifyListeners();
  }

  setFailure(Failure value) {
    _failure = value;
    notifyListeners();
  }

  setSelectedUser(UserModel value) {
    _selectedUser = value;
    notifyListeners();
  }

  getUsers() async {
    setLoading(true);
    var response = await UserService.getUsers();
    if (response is Success) {
      setUsers(response.response as List<UserModel>);
    }

    if (response is Failure) {
      setFailure(response);
    }

    setLoading(false);
  }

  bool addUser(String name, String email) {
    if (!userIsValid(name, email)) {
      return false;
    }
    _users.add(UserModel(name: name, email: email));
    notifyListeners();
    return true;
  }

  userIsValid(String name, String email) {
    return name.isNotEmpty && email.isNotEmpty;
  }

  openUserDetails(BuildContext context, UserModel user) async {
    setSelectedUser(user);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                UserDetailsView(email: user.email, name: user.name)));
  }

  openAddUser(BuildContext context) async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                create: (context) => AddUserViewModel(onSave: (name, email) {
                      if (addUser(name, email)) {
                        Navigator.pop(context);
                      }
                    }),
                child: const AddUserView())));
  }
}
