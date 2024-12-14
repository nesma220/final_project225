import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_project/ui/screens/allservices_screen%20.dart';
import 'package:final_project/ui/widget/build_services.dart';
import 'package:final_project/ui/widget/container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Good Morning 👋\nAndrew Ainsley',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  const SizedBox(width: 100),
                  IconButton(
                    icon: const Icon(Icons.notifications_none,
                        color: Colors.black),
                    onPressed: () {
                      Get.toNamed("/notificationScreen");
                    },
                  ),
                  IconButton(
                      icon: const Icon(Icons.bookmark_outline,
                          color: Colors.black),
                      onPressed: () {
                        Get.toNamed("/bookmarkScreen");
                      }),
                ],
              ),
              const SizedBox(height: 26),
              // Special Offers Carousel

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Special Offers',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {
                      Get.toNamed("/");
                    },
                    child: const Text('See More..',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.purple,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),

              const SizedBox(height: 10),
              CarouselSlider(
                options: CarouselOptions(
                  height: 150.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                ),
                items: [
                  SpecialOfferCard(
                    title: "30% Today's Special!",
                    subtitle:
                        "Get discount for every order, only valid for today",
                    backgroundColor: Colors.purple.shade50,
                    titleColor: Colors.purple,
                    subtitleColor: Colors.purple.shade700,
                  ),
                  SpecialOfferCard(
                    title: "50% Off!",
                    subtitle:
                        "Hurry up! Offer valid till midnight, only valid for today",
                    backgroundColor: Colors.blue.shade50,
                    titleColor: Colors.blue,
                    subtitleColor: Colors.blue.shade700,
                  ),
                  SpecialOfferCard(
                    title: "88% Today's Special!",
                    subtitle:
                        "Get discount for every order, only valid for today",
                    backgroundColor: const Color.fromARGB(255, 253, 223, 237),
                    titleColor: Colors.purple,
                    subtitleColor: Colors.purple.shade800,
                  ),
                ],
              ),

              const SizedBox(height: 22),
              // Services Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Services',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {
                      Get.to(() => AllServicesScreen());
                    },
                    child: const Text('See All',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.purple,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  buildServiceItem(Icons.cleaning_services, 'Cleaning'),
                  buildServiceItem(Icons.build, 'Repairing'),
                  buildServiceItem(Icons.brush, 'Painting'),
                  buildServiceItem(Icons.local_laundry_service, 'Laundry'),
                  buildServiceItem(Icons.kitchen, 'Appliance'),
                  buildServiceItem(Icons.plumbing, 'Plumbing'),
                  buildServiceItem(Icons.local_shipping, 'Shifting'),
                  buildServiceItem(Icons.more_horiz, 'More'),
                ],
              ),
              const SizedBox(height: 16),
              // Most Popular Services Section
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Most Popular Services',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('See All',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.purple,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 10),
              _buildPopularServiceItem('House Cleaning', 25, 4.8, 8289,
                  'assets/images/image_home1.PNG'),
              const SizedBox(height: 6),
              _buildPopularServiceItem('Floor Cleaning', 20, 4.5, 6453,
                  'assets/images/image_home2.PNG'),
              const SizedBox(height: 6),
              _buildPopularServiceItem('Washing Clothes', 22, 4.7, 7038,
                  'assets/images/image_home3.PNG'),
              const SizedBox(height: 6),
              _buildPopularServiceItem('Bathroom Cleaning', 24, 4.6, 5921,
                  'assets/images/image_home4.PNG'),
              const SizedBox(height: 6),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPopularServiceItem(
      String title, int price, double rating, int reviews, String imageUrl) {
    return Card(
      color: Colors.purple[50],
      child: ListTile(
        leading: Image.asset(imageUrl, width: 40),
        title: Text(title),
        subtitle: Row(
          children: [
            Text('\$$price'),
            const SizedBox(width: 8),
            const Icon(Icons.star, color: Colors.yellow, size: 16),
            Text('$rating | $reviews reviews'),
          ],
        ),
        trailing: const Icon(Icons.bookmark_border),
      ),
    );
  }
}
