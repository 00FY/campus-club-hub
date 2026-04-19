import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/club_controller.dart';
import '../../theme/app_colors.dart';

class ClubListScreen extends StatelessWidget {
  const ClubListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ClubController controller = Get.find<ClubController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Clubs'),
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search clubs...',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                controller.searchQuery.value = value;
              },
            ),
          ),

          // Club list — Obx rebuilds when clubs list changes
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              final clubs = controller.filteredClubs;

              if (clubs.isEmpty) {
                return const Center(child: Text('No clubs found'));
              }

              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: clubs.length,
                itemBuilder: (context, index) {
                  final club = clubs[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppColors.primary.withOpacity(0.1),
                        child: Text(
                          club.name[0],
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        club.name,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                          '${club.domain} • ${club.memberCount} members'),
                      trailing: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: club.isActive
                              ? AppColors.success.withOpacity(0.1)
                              : Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          club.isActive ? 'Active' : 'Inactive',
                          style: TextStyle(
                            color: club.isActive
                                ? AppColors.success : Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      onTap: () {
                        controller.selectClub(club);
                        Get.toNamed('/club-profile',
                            arguments: club.name);
                      },
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}