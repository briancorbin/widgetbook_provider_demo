import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_provider_exploration/users/users.view.dart';
import 'package:widgetbook_provider_exploration/users/users.viewModel.dart';

void main() {
  runApp(const HotReload());
}

class HotReload extends StatelessWidget {
  const HotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(addons: [], directories: [
      WidgetbookCategory(name: 'Components', children: [
        WidgetbookComponent(
          name: 'Users View',
          useCases: [
            WidgetbookUseCase(
                name: 'one',
                builder: (context) => ChangeNotifierProvider(
                    create: (context) => UsersViewModel(),
                    child: const UsersView())),
          ],
        )
      ])
    ]);
  }
}
