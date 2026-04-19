import 'package:get/get.dart';
import '../models/club_model.dart';

class ClubController extends GetxController {
  RxList<ClubModel> clubs = <ClubModel>[].obs;
  Rx<ClubModel?> selectedClub = Rx<ClubModel?>(null);
  RxBool isLoading = false.obs;
  RxString searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadClubs();
  }

  void loadClubs() {
    isLoading.value = true;

    clubs.assignAll([
      ClubModel(id: '1', name: 'IEEE', domain: 'Technical',
          isActive: true, memberCount: 45, eventCount: 8),
      ClubModel(id: '2', name: 'Culturals Club', domain: 'Cultural',
          isActive: true, memberCount: 32, eventCount: 5),
      ClubModel(id: '3', name: 'Coding Club', domain: 'Technical',
          isActive: true, memberCount: 28, eventCount: 6),
      ClubModel(id: '4', name: 'Sports Club', domain: 'Sports',
          isActive: false, memberCount: 20, eventCount: 3),
      ClubModel(id: '5', name: 'NSS', domain: 'Social',
          isActive: true, memberCount: 60, eventCount: 12),
    ]);

    isLoading.value = false;
  }

  void selectClub(ClubModel club) {
    selectedClub.value = club;
  }

  List<ClubModel> get filteredClubs {
    if (searchQuery.value.isEmpty) return clubs;
    return clubs.where((c) =>
    c.name.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
        c.domain.toLowerCase().contains(searchQuery.value.toLowerCase())
    ).toList();
  }

  int get totalActiveClubs => clubs.where((c) => c.isActive).length;
  int get totalMembers => clubs.fold(0, (sum, c) => sum + c.memberCount);
  int get totalEvents => clubs.fold(0, (sum, c) => sum + c.eventCount);
}