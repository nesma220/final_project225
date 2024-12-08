import 'package:final_project/view_models/forgot_password_controller.dart';
import 'package:final_project/ui/widget/btn.dart';
import 'package:final_project/ui/widget/custom_test_filed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX package
// Import your controller

class ForgotPasswordScreen extends StatelessWidget {
  // Initialize the controller
  final ForgotPasswordController controller =
      Get.put(ForgotPasswordController());

  ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 7),
                  const Text(
                    "Forgot Password",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              )

              // Illustration
              ,
              Center(
                child: Image.asset(
                  'assets/images/loginImage1.PNG', // Replace with your image
                  width: 250,
                  height: 200,
                ),
              ),
              const SizedBox(height: 20),
              // Description Text
              const Text(
                "Select which contact details should we use to reset your password",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 40),
              // SMS Option
              GestureDetector(
                onTap: () => controller.updateSelectedOption("sms"),
                child: Obx(() => CustomTextField(
                      hintText: "via SMS: +1 111 *****99",
                      icon: Icons.sms_rounded,
                      borderColor: controller.selectedOption.value == "sms"
                          ? Colors.purple
                          : Colors.grey[200],
                    )),
              ),
              const SizedBox(height: 15),
              // Email Option
              GestureDetector(
                onTap: () => controller.updateSelectedOption("email"),
                child: Obx(() => CustomTextField(
                      hintText: "via Email: and***ley@yourdomain.com",
                      icon: Icons.email,
                      borderColor: controller.selectedOption.value == "email"
                          ? Colors.purple
                          : Colors.grey[200],
                    )),
              ),
              const SizedBox(height: 30),
              Center(
                child: SignInButton(
                  text: "Continue    ",
                  color: Colors.purple,
                  Textcolor: Colors.white,
                  onPressed: () {
                    if (controller.selectedOption.value.isEmpty) {
                      Get.snackbar("Error", "Please select an option",
                          backgroundColor: Colors.red.withOpacity(0.5),
                          colorText: Colors.white);
                    } else {
                      // Handle "Continue" button logic
                      print(
                          "Selected Option: ${controller.selectedOption.value}");
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
