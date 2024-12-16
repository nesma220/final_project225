import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

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

  @override
  void onInit() {
    super.onInit();
    loadBookmarks(); // تحميل العلامات المحفوظة
  }

  // تحميل العلامات المحفوظة من SharedPreferences
  void loadBookmarks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedBookmarks = prefs.getStringList('bookmarks');
    if (savedBookmarks != null) {
      bookmarkedServices.assignAll(savedBookmarks.map(int.parse).toList());
    }
  }









  // إضافة إلى bookmarks
  void addBookmark(int serviceId) async {
    if (!bookmarkedServices.contains(serviceId)) {
      bookmarkedServices.add(serviceId);
      saveBookmarks();
    }
  }

  // إزالة من bookmarks
  void removeService(int id) async {
    bookmarkedServices.remove(id); // إزالة العلامة فقط
    saveBookmarks();
  }

  // حفظ العلامات في SharedPreferences
  void saveBookmarks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
        'bookmarks', bookmarkedServices.map((e) => e.toString()).toList());
  }
}
