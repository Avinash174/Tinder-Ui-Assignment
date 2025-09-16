import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tinder_ui_demo/models/auth_user.dart';


class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var user = Rxn<AuthUser>();

  @override
  void onInit() {
    super.onInit();
    _auth.authStateChanges().listen(_onAuthStateChanged);
  }

  /// Runs whenever Firebase user state changes
  void _onAuthStateChanged(User? firebaseUser) async {
    if (firebaseUser == null) {
      user.value = null;
    } else {
      user.value = AuthUser(uid: firebaseUser.uid, email: firebaseUser.email);

      // Save or update user in Firestore
      await _firestore.collection("users").doc(firebaseUser.uid).set({
        "uid": firebaseUser.uid,
        "email": firebaseUser.email ?? "guest",
        "isGuest": firebaseUser.isAnonymous,
        "createdAt": FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    }
  }

  /// Signup with Email
  Future<void> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar("Success", "Account created successfully");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  /// Login with Email
  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar("Success", "Logged in successfully");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  /// Login as Guest (Anonymous)
  Future<void> loginAsGuest() async {
    try {
      await _auth.signInAnonymously();
      Get.snackbar("Success", "Logged in as guest");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  /// Logout
  Future<void> logout() async {
    await _auth.signOut();
  }
}
