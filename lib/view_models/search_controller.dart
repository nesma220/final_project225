import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchControllerrr extends GetxController {

  RxList<Map<String, dynamic>> services = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> filteredServices = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadServices();
  }

  void loadServices() {
    // Load all services into `services` (from API, local storage, etc.)
    services.value = [
      {'id': 1, 'name': 'Cleaning', 'price': '50\$', 'rating': 4.5, 'reviews': '20', 'image': 'assets/cleaning.jpg'},
      {'id': 2, 'name': 'Plumbing', 'price': '30\$', 'rating': 4.0, 'reviews': '10', 'image': 'assets/plumbing.jpg'},
      // More services
    ];
    filteredServices.value = services;
  }

  void filterServices(String query) {
    if (query.isEmpty) {
      filteredServices.value = services;
    } else {
      filteredServices.value = services
          .where((service) =>
              service['name'].toString().toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
