import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/app_theme.dart';
import '../views/auth/login_screen.dart';
import '../views/dashboard/dashboard_screen.dart';
import '../views/clubs/clubs_list_screen.dart';
import '../views/clubs/club_profile_screen.dart';
import '../views/members/member_form_screen.dart';
import '../views/events/event_list_screen.dart';
import '../utils/constants.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String initialRoute = AppRoutes.login;

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    setState(() {
      initialRoute =
      isLoggedIn ? AppRoutes.dashboard : AppRoutes.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Campus Club Hub',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: initialRoute,
      getPages: [
        GetPage(name: AppRoutes.login, page: () => const LoginScreen()),
        GetPage(name: AppRoutes.dashboard, page: () => const DashboardScreen()),
        GetPage(name: AppRoutes.clubList, page: () => const ClubsListScreen()),
        GetPage(name: AppRoutes.clubProfile, page: () => const ClubProfileScreen()),
        GetPage(name: AppRoutes.memberForm, page: () => const MemberFormScreen()),
        GetPage(name: AppRoutes.eventList, page: () => const EventListScreen()),
      ],
    );
  }
}