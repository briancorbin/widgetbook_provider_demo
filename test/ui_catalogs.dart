import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_provider_exploration/main.dart';

void main() {
  runApp(const HotReload());
}

class HotReload extends StatelessWidget {
  const HotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(addons: [], directories: [
      WidgetbookCategory(name: 'Components', children: [
        WidgetbookComponent(name: 'HomePage', useCases: [
          WidgetbookUseCase(
            name: 'one',
            builder: (context) => ChangeNotifierProvider(
                create: (context2) => HomePageViewModel(
                    counter: 1,
                    title: context.knobs
                        .text(label: 'title', initialValue: 'Flutter Demo')),
                child: const Center(
                  child: HomePageUsingProvider(),
                )),
          ),
        ])
      ])
    ]);
  }
}
