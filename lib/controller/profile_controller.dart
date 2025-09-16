import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tinder_ui_demo/models/profile.dart';


class ProfileController extends GetxController {
  var profiles = <Profile>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProfiles();
  }

  void fetchProfiles() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection("profiles").limit(25).get();

      profiles.value = snapshot.docs
          .map((doc) => Profile.fromMap(doc.id, doc.data()))
          .toList();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}

