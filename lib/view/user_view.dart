import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import '../controller/home_controller.dart';
import '../models/profile.dart';

class UserView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  final CardSwiperController swiperController = CardSwiperController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Discover Profiles"),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.profiles.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return CardSwiper(
          controller: swiperController,
          cardsCount: controller.profiles.length,
          numberOfCardsDisplayed: 3,
          backCardOffset: const Offset(0, 20),
          padding: const EdgeInsets.all(16),
          cardBuilder: (context, index, percentX, percentY) {
            final Profile profile = controller.profiles[index];
            return buildProfileCard(profile);
          },
          onSwipe: (previousIndex, currentIndex, direction) {
            debugPrint(
                'Swiped $direction | Previous: $previousIndex | Current: $currentIndex');
            return true;
          },
          onEnd: () {
            Get.snackbar("Info", "No more profiles");
          },
        );
      }),
    );
  }

  /// Profile Card UI
  Widget buildProfileCard(Profile profile) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(profile.photoUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [Colors.black.withOpacity(0.6), Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${profile.name}, ${profile.age}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  profile.location,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
