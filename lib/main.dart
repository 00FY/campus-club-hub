import 'package:flutter/material.dart';
import 'models/club_model.dart';  // ← add this line
import 'app/app.dart';

void main() {
  // Dart practice
  String appName = 'Campus Club Hub';
  int totalClubs = 5;
  bool isRunning = true;

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
