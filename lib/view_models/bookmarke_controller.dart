import 'package:get/get.dart';

class BookmarkController extends GetxController {
  var selectedCategory = 'All'.obs;

  final categories = ['All', 'Cleaning', 'Repairing', 'Painting'];
  var services = [
    {
      'id': 1,
      'name': 'House Cleaning',
      'price': '\$24',
      'rating': '4.8',
      'reviews': '2,829',
      'image': 'assets/images/house_cleaning.png'
    },
    {
      'id': 2,
      'name': 'AC Repairing',
      'price': '\$26',
      'rating': '4.7',
      'reviews': '1,182',
      'image': 'assets/images/ac_repairing.png'
    },
    {
      'id': 3,
      'name': 'Laundry Services',
      'price': '\$19',
      'rating': '4.7',
      'reviews': '7,824',
      'image': 'assets/images/laundry_service.png'
    },
    {
      'id': 4,
      'name': 'Motorcycle Repairing',
      'price': '\$23',
      'rating': '4.9',
      'reviews': '1,092',
      'image': 'assets/images/motorcycle_repairing.png'
    },
  ].obs;

  // List of bookmarked service IDs
  var bookmarkedServices = <int>[].obs;

  // Method to remove service by ID
  void removeService(int id) {
    services.removeWhere((service) => service['id'] == id);
    bookmarkedServices
        .remove(id); // Remove the service ID from the bookmarked list
  }

  // Method to add a service to bookmarks
  void addBookmark(int serviceId) {
    bookmarkedServices.add(serviceId);
  }
}
