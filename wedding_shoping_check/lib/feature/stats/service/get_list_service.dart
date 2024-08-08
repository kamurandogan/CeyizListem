import 'package:shared_preferences/shared_preferences.dart';
import 'package:wedding_shopping_check/models/product_model.dart';
import 'package:wedding_shopping_check/product/constans/strings.dart';
import 'package:wedding_shopping_check/product/navigation/navigation_enum.dart';

class GetPurchasedList {
  static GetPurchasedList? _instance;
  static GetPurchasedList get instance {
    _instance ??= GetPurchasedList._init();
    return _instance!;
  }

  GetPurchasedList._init();

  Future<void> getAllList() async {
    user.purchasedElectronicsList = await getListFromSharedPreferences(NavigationEnum.appliances.name);
    user.purchasedKitchensList = await getListFromSharedPreferences(NavigationEnum.products.name);
    user.purchasedBeyazsList = await getListFromSharedPreferences(NavigationEnum.beyaz.name);
    user.purchasedBedroomsList = await getListFromSharedPreferences(NavigationEnum.bedroom.name);
    user.purchasedSaloonsList = await getListFromSharedPreferences(NavigationEnum.saloon.name);
    user.purchasedBathroomsList = await getListFromSharedPreferences(NavigationEnum.bathroom.name);
    user.purchasedHomeTextilesList = await getListFromSharedPreferences(NavigationEnum.homeTextiles.name);
    user.purchasedHomeToolsList = await getListFromSharedPreferences(NavigationEnum.homeTools.name);
    user.purchasedDecorationsList = await getListFromSharedPreferences(NavigationEnum.decoration.name);
    user.purchasedLightingsList = await getListFromSharedPreferences(NavigationEnum.lighting.name);
  }

  Future<List<Products>> getListFromSharedPreferences(String listKey) async {
    final prefs = await SharedPreferences.getInstance();
    final productListJson = prefs.getStringList(listKey);
    if (productListJson != null) {
      return productListJson.map(Products.fromJson).toList();
    } else {
      return []; // Eğer kayıt yoksa boş bir liste döndürebilirsiniz.
    }
  }
}
