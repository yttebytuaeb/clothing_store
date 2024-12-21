import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import '../services/image_service.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Product> _searchResults = [];
  bool _isSearching = false;

  void _performSearch(String query) {
    // This is a mock search. Replace with actual search logic
    setState(() {
      _isSearching = true;
      _searchResults = List.generate(
        5,
        (index) => Product(
          id: 'search_$index',
          name: 'Product ${index + 1}',
          brand: 'Brand ${String.fromCharCode(65 + index)}',
          description: 'Description for Product ${index + 1}',
          price: (19.99 + index).toDouble(),
          imageUrl: ImageService.getProductImage(
              'products', 'product_${index + 1}.jpg'),
          categoryImage: ImageService.getProductImage(
              'products', 'product_${index + 1}.jpg'),
          rating: 4.5,
          reviews: 100,
          isAvailable: true,
          category: 'Category',
        ),
      )
          .where((product) =>
              product.name.toLowerCase().contains(query.toLowerCase()) ||
              product.brand.toLowerCase().contains(query.toLowerCase()))
          .toList();
      _isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        title: TextField(
          controller: _searchController,
          style: const TextStyle(color: AppColors.textPrimary),
          decoration: InputDecoration(
            hintText: 'Search products...',
            hintStyle:
                TextStyle(color: AppColors.textSecondary.withOpacity(0.5)),
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear, color: AppColors.textSecondary),
              onPressed: () {
                _searchController.clear();
                setState(() {
                  _searchResults.clear();
                });
              },
            ),
          ),
          onSubmitted: _performSearch,
        ),
      ),
      body: _isSearching
          ? const Center(child: CircularProgressIndicator())
          : _searchResults.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search,
                        size: 64,
                        color: AppColors.textSecondary.withOpacity(0.5),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _searchController.text.isEmpty
                            ? 'Start searching...'
                            : 'No results found',
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                )
              : GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: _searchResults.length,
                  itemBuilder: (context, index) {
                    return ProductCard(product: _searchResults[index]);
                  },
                ),
    );
  }
}
