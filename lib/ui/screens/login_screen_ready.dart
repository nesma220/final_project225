import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view_models/login_controller.dart';
import 'create_account_screen.dart';

class LoginScreenReady extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  LoginScreenReady({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // const SizedBox(height: 50),
              // Back arrow icon
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              const SizedBox(height: 20),
              // Title
              const Text(
                "Login to your Account",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              // Subtitle
              const Text(
                "Welcome back! Please login to continue.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),
              // Email TextField
              TextField(
                onChanged: (value) {
                  controller.emaillogin.value = value;
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email_outlined),
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              ),
              const SizedBox(height: 20),
              // Password TextField
              Obx(() => TextField(
                obscureText: !controller.isPasswordVisiblelogin.value,
                onChanged: (value) {
                  controller.passwordlogin.value = value;
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isPasswordVisiblelogin.value
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: controller.togglePasswordVisibility,
                  ),
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              )),
              const SizedBox(height: 20),
              // Remember me and Forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => Row(
                    children: [
                      Checkbox(
                        value: controller.rememberMelogin.value,
                        onChanged: (value) {
                          controller.toggleRememberMe(value);
                        },
                        activeColor: const Color(0xFF7210FF),
                      ),
                      const Text("Remember me"),
                    ],
                  )),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Forgot password?",
                      style: TextStyle(
                        color: Color(0xFF7210FF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Sign in button
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: controller.loginAccount,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: const Color(0xFF7210FF),
                  ),
                  child: const Text(
                    "Sign in",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Divider with "or continue with"
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey[300])),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("or continue with"),
                  ),
                  Expanded(child: Divider(color: Colors.grey[300])),
                ],
              ),
              const SizedBox(height: 20),
              // Social media buttons
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SocialMediaButton(icon: Icons.facebook, color: Colors.blue),
                  SocialMediaButton(icon: Icons.g_mobiledata, color: Colors.red),
                  SocialMediaButton(icon: Icons.apple, color: Colors.black),
                ],
              ),
              const SizedBox(height: 30),
              // Sign up text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  GestureDetector(
                    onTap: () => Get.to(CreateAccountScreen()),
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                        color: Color(0xFF7210FF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialMediaButton extends StatelessWidget {
  final IconData icon;
  final Color color;

  const SocialMediaButton({required this.icon, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: color.withOpacity(0.1),
      child: Icon(icon, color: color),
    );
  }
}
