import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgetbook_provider_exploration/users/user.model.dart';
import 'package:widgetbook_provider_exploration/users/user.service.dart';
import 'package:widgetbook_provider_exploration/users/userRow/userRow.view.dart';
import 'package:widgetbook_provider_exploration/users/users.viewModel.dart';

class UsersViewInternal extends StatelessWidget {
  const UsersViewInternal({
    Key? key,
    this.isLoading = false,
    this.failure,
    this.users = const [],
    this.openAddUser,
    this.openUserDetails,
  }) : super(key: key);

  final bool isLoading;
  final Failure? failure;
  final List<UserModel> users;
  final VoidCallback? openAddUser;
  final void Function(BuildContext, UserModel)? openUserDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        actions: [
          IconButton(onPressed: openAddUser, icon: const Icon(Icons.add))
        ],
      ),
      body: Container(
        child: _ui(),
      ),
    );
  }

  _ui() {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (failure != null) {
      return Center(
        child: Text(failure!.errorResponse.toString()),
      );
    }

    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        UserModel user = users[index];
        return UserRow(
          name: user.name,
          email: user.email,
          onTap: () async {
            openUserDetails!(context, user);
          },
        );
      },
      itemCount: users.length,
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    UsersViewModel viewModel = context.watch<UsersViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        actions: [
          IconButton(
              onPressed: () async {
                viewModel.openAddUser(context);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Container(
        child: _ui(viewModel),
      ),
    );
  }

  _ui(UsersViewModel viewModel) {
    if (viewModel.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (viewModel.failure != null) {
      return Center(
        child: Text(viewModel.failure!.errorResponse.toString()),
      );
    }

    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        UserModel user = viewModel.users[index];
        return UserRow(
          name: user.name,
          email: user.email,
          onTap: () async {
            viewModel.openUserDetails(context, user);
          },
        );
      },
      itemCount: viewModel.users.length,
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}
