import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../views/auth/login_screen.dart';
import '../views/dashboard/dashboard_screen.dart';
import '../views/clubs/clubs_list_screen.dart';
import '../views/clubs/club_profile_screen.dart';
import '../views/members/member_form_screen.dart';
import '../views/events/event_list_screen.dart';
import '../utils/constants.dart';

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
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.dashboard: (context) => const DashboardScreen(),
        AppRoutes.clubList: (context) => const ClubListScreen(),
        AppRoutes.clubProfile: (context) => const ClubProfileScreen(),
        AppRoutes.memberForm: (context) => const MemberFormScreen(),
        AppRoutes.eventList: (context) => const EventListScreen(),
      },
    );
  }
}