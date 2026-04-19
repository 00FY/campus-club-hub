import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class ClubListScreen extends StatelessWidget {
  const ClubListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final clubs = [
      {'name': 'IEEE', 'domain': 'Technical', 'active': true},
      {'name': 'Culturals Club', 'domain': 'Cultural', 'active': true},
      {'name': 'Coding Club', 'domain': 'Technical', 'active': true},
      {'name': 'Sports Club', 'domain': 'Sports', 'active': false},
      {'name': 'NSS', 'domain': 'Social', 'active': true},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Clubs'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: clubs.length,
        itemBuilder: (context, index) {
          final club = clubs[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColors.primary.withOpacity(0.1),
                child: Text(
                  (club['name'] as String)[0],
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                club['name'] as String,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(club['domain'] as String),
              trailing: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: (club['active'] as bool)
                      ? AppColors.success.withOpacity(0.1)
                      : Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  (club['active'] as bool) ? 'Active' : 'Inactive',
                  style: TextStyle(
                    color: (club['active'] as bool)
                        ? AppColors.success
                        : Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/club-profile',
                  arguments: club['name'],
                );
              },
            ),
          );
        },
      ),
    );
  }
}