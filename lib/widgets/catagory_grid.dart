import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../screens/catagory_product_screen.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = [
      'Clothing',
      'Shoes',
      'Accessories',
      'Electronics',
      'Home',
      'Beauty',
    ];

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    CategoryProductsScreen(category: categories[index]),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.deepBlue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                categories[index],
                style: const TextStyle(
                  color: AppColors.lightBlue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }
}
