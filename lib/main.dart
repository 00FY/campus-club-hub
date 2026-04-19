import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'models/club_model.dart';
import 'app/app.dart';
import 'controllers/auth_controller.dart';
import 'controllers/club_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Register controllers — permanent means they stay alive forever
  Get.put(AuthController(), permanent: true);
  Get.put(ClubController(), permanent: true);

  // Dart practice from Lab 1
  List<String> domains = ['Technical', 'Cultural', 'Sports', 'Social'];
  for (String domain in domains) {
    print('Domain: $domain');
  }

  ClubModel testClub = ClubModel(
    id: '001',
    name: 'IEEE',
    domain: 'Technical',
    isActive: true,
  );
  print(testClub.toString());
  print(testClub.getStatus());

  runApp(const MyApp());
}
