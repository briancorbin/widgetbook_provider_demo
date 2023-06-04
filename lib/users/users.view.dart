import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgetbook_provider_exploration/users/user.model.dart';
import 'package:widgetbook_provider_exploration/users/userRow/userRow.view.dart';
import 'package:widgetbook_provider_exploration/users/users.viewModel.dart';

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
