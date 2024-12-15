import 'package:final_project/view_models/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  final SearchControllerrr searchController = Get.find<SearchControllerrr>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextField(
          autofocus: true,
          onChanged: (query) => searchController.searchItems(query),
          decoration: InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            suffixIcon: IconButton(
              icon: Icon(Icons.clear, color: Colors.grey),
              onPressed: () {
                searchController.clearSearch();
              },
            ),
          ),
        ),
      ),
      body: Obx(() {
        if (searchController.searchResults.isEmpty &&
            searchController.searchText.isNotEmpty) {
          return _buildNotFound();
        } else {
          return ListView.builder(
            itemCount: searchController.searchResults.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(searchController.searchResults[index]),
                leading: Icon(Icons.search),
              );
            },
          );
        }
      }),
    );
  }

  Widget _buildNotFound() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 80, color: Colors.grey),
          SizedBox(height: 10),
          Text("No Results Found",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text("Please try another search."),
        ],
      ),
    );
  }
}
