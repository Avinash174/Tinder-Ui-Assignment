import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../models/profile.dart';

class HomeController extends GetxController {
  var profiles = <Profile>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProfiles();
  }

  Future<void> fetchProfiles() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('profiles').limit(25).get();

    profiles.value =
        snapshot.docs.map((doc) => Profile.fromMap(doc.id, doc.data())).toList();
  }
}
