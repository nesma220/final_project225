import 'package:final_project/view_models/bookmarke_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBookmarkScreen extends StatelessWidget {
  final BookmarkController controller = Get.put(BookmarkController());

  MyBookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
 final bookmarkedServices = controller.services
    .where((service) => controller.bookmarkedServices.contains(service['id']))
    .toList();


    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bookmark', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // شريط تصفية الفئات
          Obx(() => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: controller.categories
                      .map(
                        (category) => GestureDetector(
                          onTap: () =>
                              controller.selectedCategory.value = category,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color:
                                  controller.selectedCategory.value == category
                                      ? Colors.purple
                                      : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.purple),
                            ),
                            child: Text(
                              category,
                              style: TextStyle(
                                color: controller.selectedCategory.value ==
                                        category
                                    ? Colors.white
                                    : Colors.purple,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              )),
          // عرض قائمة الخدمات المحفوظة
          Expanded(
            child: bookmarkedServices.isEmpty
                ? const Center(
                    child: Text(
                      'No bookmarked services yet!',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: bookmarkedServices.length,
                    itemBuilder: (context, index) {
                      final service = bookmarkedServices[index];
                      return GestureDetector(
                        onTap: () =>
                            showRemoveDialog(context, service, controller),
                        child: Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(15), // لتدوير الحواف
                          ),
                          elevation: 4, // لإضافة ظل خفيف
                          child: Container(
                            padding: const EdgeInsets.all(
                                12), // لتكبير الحشوات الداخلية
                            height: 120, // ارتفاع مخصص للعنصر
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // الصورة
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    service['image'] as String,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover, // لملء الصورة داخل الحجم
                                  ),
                                ),
                                const SizedBox(
                                    width: 16), // مسافة بين الصورة والنص
                                // النصوص
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        service['name'] as String,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18, // تكبير حجم النص
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        '${service['rating']} ★ | ${service['reviews']} reviews',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        service['price'] as String,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.purple,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // أيقونة Bookmark
                                const Icon(
                                  Icons.bookmark,
                                  color: Colors.purple,
                                  size: 28,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

void showRemoveDialog(BuildContext context, Map<String, dynamic> service,
    BookmarkController controller) {
  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Remove from Bookmark?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 16),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(service['image']),
              ),
              title: Text(service['name'],
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(service['price']),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () => Get.back(),
                  child: const Text("Cancel",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold)),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    controller.removeService(service['id']);
                    Get.back();
                  },
                  child: const Text(
                    "Yes, Remove",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
