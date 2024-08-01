import 'package:go_router/go_router.dart';

import '../../domain/model/task_model.dart';
import '../home/home_screen.dart';
import '../task_edit/task_screen.dart';

final router = GoRouter(
  initialLocation: HomeScreen.routeName(),
  routes: [
    GoRoute(
      name: HomeScreen.routeName(),
      path: HomeScreen.routeName(),
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: TaskScreen.routeName(),
      path: TaskScreen.routeName(),
      builder: (context, state) => TaskScreen(
        task: state.extra as Task?,
      ),
    ),
  ],
);
