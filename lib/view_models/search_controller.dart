import 'package:get/get.dart';

class SearchControllerrr extends GetxController {

  var searchText = ''.obs;
  var searchResults = <String>[].obs;

  final List<String> allItems = [
    'Cleaning',
    'Repairing',
    'Painting',
    'Laundry',
    'Plumbing',
    'Shifting',
    'House Cleaning',
    'Floor Cleaning',
    'Washing Clothes',
    'Bathroom Cleaning',
  ];

  void searchItems(String query) {
    searchText.value = query;
    if (query.isEmpty) {
      searchResults.clear();
    } else {
      searchResults.value = allItems
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  void clearSearch() {
    searchText.value = '';
    searchResults.clear();
  }
}


