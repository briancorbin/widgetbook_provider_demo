import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_provider_exploration/users/user.model.dart';
import 'package:widgetbook_provider_exploration/users/users.view.dart';
import 'package:widgetbook_provider_exploration/users/users.viewModel.dart';

import 'fakes/fake.users.viewModel.dart';

void main() {
  runApp(const HotReload());
}

class HotReload extends StatelessWidget {
  const HotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      addons: [],
      directories: [
        WidgetbookCategory(
          name: 'Components',
          children: [
            WidgetbookComponent(
              name: 'Users View',
              useCases: [
                WidgetbookUseCase(
                  name: 'With View Model',
                  builder: (wbContext) =>
                      ChangeNotifierProvider<UsersViewModel>(
                    create: (context) => FakeUsersViewModel(
                      users: [
                        UserModel(
                            name: wbContext.knobs.string(
                              label: 'Name',
                              initialValue: 'John Doe',
                            ),
                            email: wbContext.knobs.string(
                              label: 'Email',
                              initialValue: '',
                            )),
                      ],
                    ),
                    child: const UsersView(),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'With View Model 2',
                  builder: (wbContext) =>
                      ChangeNotifierProvider<UsersViewModel>(
                    create: (context) => FakeUsersViewModel(
                      users: [
                        UserModel(
                            name: wbContext.knobs.string(
                              label: 'Name',
                              initialValue: 'Mary Jane',
                            ),
                            email: wbContext.knobs.string(
                              label: 'Email',
                              initialValue: 'mary@email.com',
                            )),
                      ],
                    ),
                    child: const UsersView(),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Without View Model',
                  builder: (context) => UsersViewInternal(
                    users: [
                      UserModel(
                        name: context.knobs.string(
                          label: 'Name',
                          initialValue: 'John Doe',
                        ),
                        email: context.knobs.string(
                          label: 'Email',
                          initialValue: 'johndoe@gmail.com',
                        ),
                      ),
                    ],
                    openAddUser: () => {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
