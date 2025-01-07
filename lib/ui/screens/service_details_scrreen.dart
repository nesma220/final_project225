import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceDetailsPage extends StatelessWidget {
  final Map<String, dynamic> serviceData;

  const ServiceDetailsPage({super.key, required this.serviceData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_outline, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      serviceData['image'] ?? '',
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    serviceData['name'] ?? 'Service Name',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.location_on, color: Colors.grey),
                      Text(
                        serviceData['location'] ?? 'Unknown Location',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '\$${serviceData['price'] ?? '0'}',
              style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple),
            ),
            const SizedBox(height: 16),
            const Text(
              'About me',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              serviceData['description'] ?? 'No description available.',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            const Text(
              'Photos & Videos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: (serviceData['gallery'] as List<dynamic>? ?? []).length,
              itemBuilder: (context, index) {
                final serviceGallery =
                    serviceData['gallery'] as List<dynamic>? ?? [];
                final imageUrl = serviceGallery[index] as String? ?? '';

                return GestureDetector(
                  onTap: () {
                    Get.to(() => FullScreenImagePage(imageUrl: imageUrl));
                  },
                  child: Hero(
                    tag: imageUrl,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: imageUrl.isNotEmpty
                          ? Image.asset(imageUrl, fit: BoxFit.cover)
                          : const Icon(Icons.image_not_supported, size: 100),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'Reviews',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildReviewsList(),
            const SizedBox(height: 16),
            Row(
              children: [
               
             
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Message',
                      style: TextStyle(fontSize: 18, color: Colors.purple),
                    ),
                  ),
                ),
   const SizedBox(width: 16),

                 Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Book Now',
                      
                      style: TextStyle(fontSize: 18,color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewsList() {
    final reviews = serviceData['userReviews'] ?? [];
    if (reviews.isEmpty) {
      return const Text('No reviews yet.');
    }
    return Column(
      children: reviews.map<Widget>((review) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      review['username'] ?? 'Anonymous',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Row(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          index < (review['rating'] ?? 0)
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.amber,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(review['comment'] ?? 'No comment'),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class FullScreenImagePage extends StatelessWidget {
  final String imageUrl;

  const FullScreenImagePage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: imageUrl.isNotEmpty
            ? Image.asset(
                imageUrl,
                fit: BoxFit.contain,
              )
            : const Icon(Icons.image_not_supported, size: 100),
      ),
    );
  }
}
