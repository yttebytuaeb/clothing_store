class ImageService {
  static const String _baseImagePath = 'assets/images';

  static String getCategoryPath(String category) {
    switch (category.toLowerCase()) {
      case "family's":
        return '$_baseImagePath/family\'s';
      case 'kids':
        return '$_baseImagePath/kids';
      case 'men\'s & women\'s':
        return '$_baseImagePath/men\'s&women\'s';
      case 'on sale':
        return '$_baseImagePath/Onsale';
      case 'promo coursal':
        return '$_baseImagePath/promo coursal';
      case 'products':
        return '$_baseImagePath/products';
      case 'best sellers':
        return '$_baseImagePath/products/best_sellers';
      case 'new arrivals':
        return '$_baseImagePath/products/new_arrivals';
      case 'trending':
        return '$_baseImagePath/products/trending';
      default:
        return _baseImagePath;
    }
  }

  static String getProductImage(String category, String imageName) {
    final path = getCategoryPath(category);
    final prefix = _getImagePrefix(category);
    return '$path/${prefix}_$imageName';
  }

  static String _getImagePrefix(String category) {
    switch (category.toLowerCase()) {
      case "family's":
        return 'family';
      case 'kids':
        return 'kid';
      case 'men\'s & women\'s':
        return 'mw';
      case 'on sale':
        return 'sale';
      case 'promo coursal':
        return 'promo';
      case 'best sellers':
        return 'best';
      case 'new arrivals':
        return 'new';
      case 'trending':
        return 'trend';
      default:
        return 'product';
    }
  }

  static String getLogo() {
    return '$_baseImagePath/logo.png';
  }
}
