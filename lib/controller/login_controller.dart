import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../routes/app_routes.dart';

class LoginController extends GetxController {
  final email = ''.obs;
  final password = ''.obs;
  final isLoading = false.obs;

  final auth = FirebaseAuth.instance;

  Future<void> login() async {
    try {
      isLoading.value = true;
      await auth.signInWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );
      Get.offAllNamed(Routes.HOME, arguments: false);
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message ?? "Login failed");
    } finally {
      isLoading.value = false;
    }
  }
}
