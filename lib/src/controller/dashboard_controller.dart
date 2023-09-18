import 'package:get/get.dart';
import 'package:googlelogin/src/services/authentication_service.dart';

class DashboardController extends GetxController {
  final AuthenticationService authenticationService = AuthenticationService();

  Future<void> signOut() async {
    try {
      await authenticationService.handleSignOut();
      Get.offNamed('/');
    } catch (error) {
      print('Error during sign out: $error');
    }
  }
}
