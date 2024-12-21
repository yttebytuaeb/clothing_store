import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import '../services/image_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<Product> products = List.generate(
    10,
    (index) => Product(
      id: 'product_$index',
      name: 'Product ${index + 1}',
      brand: 'Brand ${String.fromCharCode(65 + (index % 26))}',
      description: 'This is a description for Product ${index + 1}',
      price: (19.99 + index).toDouble(),
      imageUrl:
          ImageService.getProductImage('products', 'product_${index + 1}.jpg'),
      categoryImage:
          ImageService.getProductImage('products', 'product_${index + 1}.jpg'),
      rating: 4 + (index % 10) / 10,
      reviews: 50 + index * 2,
      isAvailable: true,
      category: 'Category ${(index % 3) + 1}',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        title: const Text(
          'flamingo',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: AppColors.textPrimary),
            onPressed: () => Navigator.pushNamed(context, '/search'),
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none,
                color: AppColors.textPrimary),
            onPressed: () => Navigator.pushNamed(context, '/notifications'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPromoCarousel(),
            _buildProductSection(
                'Best Sellers', products.sublist(0, 5), 'best_sellers'),
            _buildProductSection(
                'New Arrivals', products.sublist(5, 10), 'new_arrivals'),
            _buildProductSection(
                'Trending', products.sublist(2, 7), 'trending'),
          ],
        ),
      ),
    );
  }

  Widget _buildPromoCarousel() {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(ImageService.getProductImage(
                    'promo coursal', 'promo_${index + 1}.jpg')),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Special Offer ${index + 1}',
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Description for Special Offer ${index + 1}',
                      style: TextStyle(
                        color: AppColors.textPrimary.withOpacity(0.8),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductSection(
      String title, List<Product> products, String folder) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
          child: Text(
            title,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final updatedProduct = products[index].copyWith(
                imageUrl: ImageService.getProductImage(
                    'products/$folder', 'product_${index + 1}.jpg'),
                categoryImage: ImageService.getProductImage(
                    'products/$folder', 'product_${index + 1}.jpg'),
              );
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: ProductCard(product: updatedProduct),
              );
            },
          ),
        ),
      ],
    );
  }
}
