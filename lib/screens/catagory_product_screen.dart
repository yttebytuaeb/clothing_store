import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/product_card.dart';
import '../models/product.dart';
import '../services/image_service.dart';

class CategoryProductsScreen extends StatelessWidget {
  final String category;

  const CategoryProductsScreen({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkNavy,
      appBar: AppBar(
        backgroundColor: AppColors.deepBlue,
        title: Text(
          category,
          style: const TextStyle(
              color: AppColors.lightBlue, fontFamily: 'Pacifico', fontSize: 24),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemCount: 10, // Replace with actual product count
        itemBuilder: (context, index) {
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

          return ProductCard(product: product);
        },
      ),
    );
  }
}
