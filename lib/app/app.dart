import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../views/auth/login_screen.dart';
import '../views/dashboard/dashboard_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Club Hub',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
        home: const LoginScreen(), // change to DashboardScreen() to preview it
    );
  }
}