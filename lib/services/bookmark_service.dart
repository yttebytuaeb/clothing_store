import '../models/product.dart';

class BookmarkService {
  static final BookmarkService _instance = BookmarkService._internal();
  factory BookmarkService() => _instance;
  BookmarkService._internal();

  final List<Product> _bookmarkedItems = [];

  List<Product> get items => List.unmodifiable(_bookmarkedItems);

  void toggleBookmark(Product product) {
    final isBookmarked = _bookmarkedItems.any((item) => item.id == product.id);
    if (isBookmarked) {
      _bookmarkedItems.removeWhere((item) => item.id == product.id);
    } else {
      _bookmarkedItems.add(product);
    }
  }

  bool isBookmarked(String productId) {
    return _bookmarkedItems.any((item) => item.id == productId);
  }
}
