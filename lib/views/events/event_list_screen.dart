import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/app_colors.dart';
import 'package:app20/services/api_services.dart';

class EventModel {
  final String id;
  final String name;
  final String clubName;
  final String date;
  final int attendance;
  final bool isCompleted;

  EventModel({
    required this.id,
    required this.name,
    required this.clubName,
    required this.date,
    required this.attendance,
    required this.isCompleted,
  });
}

class EventListScreen extends StatelessWidget {
  const EventListScreen({super.key});

  // ✅ API fetch function
  Future<List<EventModel>> fetchEvents() async {
    final data = await ApiService.fetchEvents();
    final clubs = ["IEEE", "CSI", "ACM", "Cultural Club", "Sports Club"];

    return data.take(10).toList().asMap().entries.map((entry) {
      final index = entry.key;
      final item = entry.value;

      return EventModel(
        id: item['id'].toString(),
        name: "Event ${item['id']}",
        clubName: clubs[index % clubs.length],
        date: '2025',
        attendance: 0,
        isCompleted: true,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
      ),
      body: FutureBuilder<List<EventModel>>(
        future: fetchEvents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final events = snapshot.data!;

          return Column(
            children: [
              // Summary cards
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: _MiniStatCard(
                        label: 'Total',
                        value: events.length.toString(),
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _MiniStatCard(
                        label: 'Completed',
                        value: events.length.toString(),
                        color: AppColors.success,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _MiniStatCard(
                        label: 'Upcoming',
                        value: '0',
                        color: AppColors.warning,
                      ),
                    ),
                  ],
                ),
              ),

              // Header
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'All Events',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // Event list
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    return EventCard(event: events[index]);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// ✅ FULL EventCard (your original styled version)
class EventCard extends StatelessWidget {
  final EventModel event;

  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColors.cardBorder),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 4,
              height: 60,
              decoration: BoxDecoration(
                color: event.isCompleted
                    ? AppColors.success
                    : AppColors.warning,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    event.clubName,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today,
                          size: 12, color: AppColors.textSecondary),
                      const SizedBox(width: 4),
                      Text(
                        event.date,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      if (event.isCompleted) ...[
                        const SizedBox(width: 12),
                        const Icon(Icons.people,
                            size: 12, color: AppColors.textSecondary),
                        const SizedBox(width: 4),
                        Text(
                          '${event.attendance} attended',
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: event.isCompleted
                    ? AppColors.success.withOpacity(0.1)
                    : AppColors.warning.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                event.isCompleted ? 'Done' : 'Upcoming',
                style: TextStyle(
                  color: event.isCompleted
                      ? AppColors.success
                      : AppColors.warning,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ✅ Mini stat card
class _MiniStatCard extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _MiniStatCard({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}