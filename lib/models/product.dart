class Product {
  final String id;
  final String name;
  final String brand;
  final String description;
  final double price;
  final String imageUrl;
  final String categoryImage;
  final double rating;
  final int reviews;
  final bool isAvailable;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.categoryImage,
    required this.rating,
    required this.reviews,
    required this.isAvailable,
    required this.category,
  });

  Product copyWith({
    String? id,
    String? name,
    String? brand,
    String? description,
    double? price,
    String? imageUrl,
    String? categoryImage,
    double? rating,
    int? reviews,
    bool? isAvailable,
    String? category,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      brand: brand ?? this.brand,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      categoryImage: categoryImage ?? this.categoryImage,
      rating: rating ?? this.rating,
      reviews: reviews ?? this.reviews,
      isAvailable: isAvailable ?? this.isAvailable,
      category: category ?? this.category,
    );
  }
}
