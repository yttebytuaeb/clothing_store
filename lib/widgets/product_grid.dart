import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../models/product.dart';
import '../screens/product_detail_screen.dart';
import '../services/image_service.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemCount: 10, // Replace with actual product list length
      itemBuilder: (context, index) {
        final String category = 'Category'; // Added category variable
        // Replace with actual product data
        final product = Product(
          id: 'product_$index',
          name: 'Product ${index + 1}',
          brand: 'Brand',
          description: 'Product description',
          price: 99.99,
          imageUrl: ImageService.getProductImage(
              category, 'product_${index + 1}.jpg'),
          categoryImage: ImageService.getProductImage(
              category, 'product_${index + 1}.jpg'),
          rating: 4.5,
          reviews: 100,
          isAvailable: true,
          category: category,
        );

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailScreen(product: product),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.darkNavy,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Hero(
                      tag: product.id,
                      child: Image.network(
                        product.imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.brand,
                        style: const TextStyle(
                            color: AppColors.lightBlue, fontSize: 12),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        product.name,
                        style: const TextStyle(
                            color: AppColors.lightBlue,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                            color: AppColors.lightBlue, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
