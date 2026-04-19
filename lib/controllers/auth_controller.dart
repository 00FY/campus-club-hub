import 'package:get/get.dart';

class AuthController extends GetxController {
  // Reactive variables — .obs means GetX watches these
  RxString userEmail = ''.obs;
  RxString userRole = ''.obs;
  RxBool isLoggedIn = false.obs;
  RxBool isLoading = false.obs;

  // Called automatically when controller is created
  @override
  void onInit() {
    super.onInit();
    print('AuthController initialized');
  }

  // Simulate login — no Firebase yet
  Future<void> login(String email, String role) async {
    isLoading.value = true;

    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    userEmail.value = email;
    userRole.value = role;
    isLoggedIn.value = true;
    isLoading.value = false;

    Get.offAllNamed('/dashboard');
  }

  void logout() {
    userEmail.value = '';
    userRole.value = '';
    isLoggedIn.value = false;
    Get.offAllNamed('/login');
  }

  bool get isTeacher => userRole.value == 'Teacher';
  bool get isChairperson => userRole.value == 'Chairperson';
}