// Import required packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // Example state variable
  var selectedService = ''.obs;

 void selectService(String service) {
   selectedService.value = service;
 }
}

class HomePage extends StatelessWidget {

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Service'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Text(
                'Welcome to Home Services',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Find the best services for your home needs.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),

              SizedBox(height: 20),

              // Icons Grid
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildServiceCard(Icons.cleaning_services, 'Cleaning'),
                  _buildServiceCard(Icons.plumbing, 'Plumbing'),
                  _buildServiceCard(Icons.electrical_services, 'Electrical'),
                  _buildServiceCard(Icons.build, 'Carpentry'),
                ],
              ),

              SizedBox(height: 20),

              // Featured Section
              Text(
                'Featured Services',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage('https://via.placeholder.com/300'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Contact Section
              Text(
                'Need Help?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.phone),
                label: Text('Contact Us'),
              ),

              SizedBox(height: 20),

              Obx(() => Text(
                    'Selected Service: ${controller.selectedService.value}',
                    style: TextStyle(fontSize: 18, color: Colors.blue),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceCard(IconData icon, String label) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          controller.selectService(label);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            SizedBox(height: 10),
            Text(label, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}