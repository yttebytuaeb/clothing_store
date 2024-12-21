import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import '../services/image_service.dart';

class ProductGridScreen extends StatelessWidget {
  final String category;

  const ProductGridScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Generate products based on category
    final List<Product> products = List.generate(
      20,
      (index) => Product(
        id: 'product_$index',
        name: 'Product ${index + 1}',
        brand: 'Brand ${String.fromCharCode(65 + (index % 26))}',
        description: 'Description of Product ${index + 1}',
        price: (19.99 + index).toDouble(),
        imageUrl: ImageService.getProductImage(
            category.toLowerCase(), 'product_${index + 1}.jpg'),
        categoryImage: ImageService.getProductImage(
            category.toLowerCase(), 'product_${index + 1}.jpg'),
        rating: 4 + (index % 10) / 10,
        reviews: 50 + index * 2,
        isAvailable: true,
        category: category,
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        title: Text(
          category,
          style: const TextStyle(color: AppColors.textPrimary),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(product: products[index]);
        },
      ),
    );
  }
}
