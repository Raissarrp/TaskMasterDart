import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'screens/calendar/calendar_screen.dart';
import 'screens/focus/focus_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/new_task/new_task_screen.dart';
import 'screens/notification/notification_screen.dart';
import 'screens/splash/splash_screen.dart';
import 'theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('pt_BR', null);
  runApp(const TaskMaster());
}

class TaskMaster extends StatelessWidget {
  const TaskMaster({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: '/splash',
      routes: {
        '/splash': (_) => const SplashScreen(),
        '/home': (_) => const HomeScreen(),
        '/calendar': (_) => const CalendarScreen(),
        '/focus': (_) => const FocusScreen(),
        '/notification': (_) => const NotificationScreen(),
        '/new-task': (_) => const NewTaskScreen(),
      },
    );
  }
}