// widgetbook.dart

import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

// Import the generated directories variable
import 'package:widgetbook_provider_exploration/main.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      // Use the generated directories variable
      directories: directories,
      addons: [],
      appBuilder: (context, child) {
        return child;
      },
    );
  }
}
// class HotReload extends StatelessWidget {
//   const HotReload({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Widgetbook.material(
//       addons: [],
//       directories: [
//         WidgetbookCategory(
//           name: 'Components',
//           children: [
//             WidgetbookComponent(
//               name: 'Users View',
//               useCases: [
//                 WidgetbookUseCase(
//                   name: 'With View Model',
//                   builder: (wbContext) =>
//                       ChangeNotifierProvider<UsersViewModel>(
//                     key: const ValueKey('view1'),
//                     create: (context) => FakeUsersViewModel(
//                       users: [
//                         UserModel(
//                             name: wbContext.knobs.string(
//                               label: 'Name',
//                               initialValue: 'John Doe',
//                             ),
//                             email: wbContext.knobs.string(
//                               label: 'Email',
//                               initialValue: '',
//                             )),
//                       ],
//                     ),
//                     child: const UsersView(),
//                   ),
//                 ),
//                 WidgetbookUseCase(
//                   name: 'With View Model 2',
//                   builder: (wbContext) =>
//                       ChangeNotifierProvider<UsersViewModel>(
//                     key: const ValueKey('view2'),
//                     create: (context) => FakeUsersViewModel(
//                       users: [
//                         UserModel(
//                             name: wbContext.knobs.string(
//                               label: 'Name',
//                               initialValue: 'Mary Jane',
//                             ),
//                             email: wbContext.knobs.string(
//                               label: 'Email',
//                               initialValue: 'mary@email.com',
//                             )),
//                       ],
//                     ),
//                     child: const UsersView(),
//                   ),
//                 ),
//                 WidgetbookUseCase(
//                   name: 'Without View Model',
//                   builder: (context) => UsersViewInternal(
//                     users: [
//                       UserModel(
//                         name: context.knobs.string(
//                           label: 'Name',
//                           initialValue: 'John Doe',
//                         ),
//                         email: context.knobs.string(
//                           label: 'Email',
//                           initialValue: 'johndoe@gmail.com',
//                         ),
//                       ),
//                     ],
//                     openAddUser: () => {},
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
