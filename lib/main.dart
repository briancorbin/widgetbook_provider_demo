import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgetbook_provider_exploration/users/users.view.dart';
import 'package:widgetbook_provider_exploration/users/users.viewModel.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

void main() {
  runApp(const MyApp());
}

@widgetbook.App()
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (context) => UsersViewModel(),
        child: const UsersView(),
      ),
    );
  }
}
