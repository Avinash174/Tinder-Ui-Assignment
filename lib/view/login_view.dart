import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/auth_controller.dart';
import 'user_view.dart'; // 👈 swipe cards

class LoginView extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login / Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: "Password"),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                authController.login(
                  emailController.text.trim(),
                  passwordController.text.trim(),
                );
              },
              child: Text("Login"),
            ),
            ElevatedButton(
              onPressed: () {
                authController.signUp(
                  emailController.text.trim(),
                  passwordController.text.trim(),
                );
              },
              child: Text("Sign Up"),
            ),

            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                authController.loginAsGuest();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text("Continue as Guest"),
            ),

            SizedBox(height: 20),
            Obx(() {
              if (authController.user.value != null) {
                return Column(
                  children: [
                    Text(
                      authController.user.value!.email != null
                          ? "Logged in as: ${authController.user.value!.email}"
                          : "Logged in as Guest",
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(() => UserView());
                      },
                      child: Text("Go to Profiles"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        authController.logout();
                      },
                      child: Text("Logout"),
                    ),
                  ],
                );
              } else {
                return Text("Not logged in");
              }
            }),
          ],
        ),
      ),
    );
  }
}
