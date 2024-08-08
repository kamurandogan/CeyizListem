import 'package:shared_preferences/shared_preferences.dart';
import 'package:wedding_shopping_check/models/product_model.dart';

/// Shared Preferences Service Class with Singleton Pattern
final class SharedPreferencesService {
  static SharedPreferencesService? _instance;
  static SharedPreferencesService get instance {
    _instance ??= SharedPreferencesService._init();
    return _instance!;
  }

  SharedPreferencesService._init();

  /// Save for List to Shared Preferences
  Future<void> saveList(String listKey, List<Products> productList) async {
    final prefs = await SharedPreferences.getInstance();
    final productListJson = productList.map((product) => product.toJson()).toList();
    await prefs.setStringList(listKey, productListJson);
  }

  Future<List<Products>> getList(String listKey) async {
    final prefs = await SharedPreferences.getInstance();
    final productListJson = prefs.getStringList(listKey);
    if (productListJson != null) {
      return productListJson.map(Products.fromJson).toList();
    } else {
      return []; // Eğer kayıt yoksa boş bir liste döndürebilirsiniz.
    }
  }
}
