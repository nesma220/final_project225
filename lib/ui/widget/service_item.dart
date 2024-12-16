import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
   final String title;
  final String price;
  final double rating;
  final String reviews;
  final String image;
  final bool isBookmarked;
  final VoidCallback onBookmarkPressed;
  final VoidCallback?  ontap;
  const ServiceItem({
    Key? key,
    required this.title,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.image,
    required this.isBookmarked,
   required  this.onBookmarkPressed ,
         this.ontap,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
   onTap: ontap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // الصورة
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(image, width: 80, height: 80, fit: BoxFit.cover),
              ),
              const SizedBox(width: 16),
              // النصوص
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text('\$$price',
                        style: const TextStyle(
                            color: Colors.purple, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.yellow, size: 16),
                        Text('$rating | $reviews reviews',
                            style: const TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ),
              // زر العلامة
              IconButton(
                icon: Icon(
                  isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  color: Colors.purple,
                ),
                onPressed: onBookmarkPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
