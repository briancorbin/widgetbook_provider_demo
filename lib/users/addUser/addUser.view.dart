import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'addUser.viewModel.dart';

class AddUserView extends StatelessWidget {
  const AddUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddUserViewModel viewModel = context.watch<AddUserViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
        actions: [
          IconButton(
              onPressed: () => {viewModel.saveUser()},
              icon: const Icon(Icons.save))
        ],
      ),
      body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                  decoration: const InputDecoration(hintText: 'Name'),
                  onChanged: viewModel.onNameChanged),
              const SizedBox(height: 20.0),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Email'),
                onChanged: viewModel.onEmailChanged,
              ),
            ],
          )),
    );
  }
}
