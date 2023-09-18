import 'package:get/get.dart';
import 'package:googlelogin/src/services/authentication_service.dart';

class RegisterController extends GetxController {
  final AuthenticationService authenticationService = AuthenticationService();
  final RxBool isLoading = false.obs;

  Future<void> registerWithGoogle() async {
    try {
      isLoading.value = true;
      await authenticationService.handleGoogleSignIn();
      Get.offNamed('/dashboard');
    } catch (error) {
      print('Error during Google Sign-In: $error');
    } finally {
      isLoading.value = false;
    }
  }
}
