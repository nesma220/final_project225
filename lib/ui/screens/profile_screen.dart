import 'package:final_project/view_models/fill_profile_controller.dart';
import 'package:final_project/ui/widget/custom_test_filed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FillProfileScreen extends StatelessWidget {
  const FillProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final FillProfileController controller = Get.put(FillProfileController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                "Fill Your Profile",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),

              // Profile Picture
              Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[200],
                    child:
                        const Icon(Icons.person, size: 50, color: Colors.grey),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF7210FF),
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(6),
                      child:
                          const Icon(Icons.edit, color: Colors.white, size: 18),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Full Name Field
              CustomTextField(
                hintText: "Full Name",
                icon: null,
                type: TextInputType.name,
                onchanged: controller.updateFullName,
              ),
              const SizedBox(height: 10),

              // Nickname Field
              CustomTextField(
                hintText: "Nickname",
                icon: null,
                type: TextInputType.name,
                onchanged: controller.updateNickname,
              ),
              const SizedBox(height: 10),

              // Date of Birth Field
              CustomTextField(
                hintText: "Date of Birth",
                type: TextInputType.datetime,
                icon: Icons.calendar_today_outlined,
                onchanged: controller.updateDateOfBirth,
              ),
              const SizedBox(height: 10),

              // Email Field
              CustomTextField(
                hintText: "Email",
                icon: Icons.email_outlined,
                type: TextInputType.emailAddress,
                onchanged: controller.updateEmail,
              ),
              const SizedBox(height: 10),

              // Phone Number Field
              Row(
                children: [
                  Container(
                    width: 80,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.flag, size: 16),
                        SizedBox(width: 5),
                        Text(
                          "+1",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomTextField(
                      hintText: "Phone Number",
                      type: TextInputType.number,
                      icon: null,
                      onchanged: controller.updatePhoneNumber,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Address Field
              CustomTextField(
                hintText: "Address",
                icon: Icons.location_on_outlined,
                type: TextInputType.streetAddress,
                onchanged: controller.updateAddress,
              ),
              const SizedBox(height: 10),

              // Continue Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    controller.submitProfile(); // الاستدعاء مع التحقق
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7210FF),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
