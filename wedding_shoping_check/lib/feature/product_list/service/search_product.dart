import 'package:wedding_shopping_check/models/product_model.dart';
import 'package:wedding_shopping_check/product/constans/strings.dart';
import 'package:wedding_shopping_check/product/navigation/navigation_enum.dart';

class SearchProduct {
  static SearchProduct? _instance;
  static SearchProduct get instance {
    _instance ??= SearchProduct._init();
    return _instance!;
  }

  SearchProduct._init();

  bool searchProduct(List<Products> list, String name) {
    var isPurch = false;
    if (list.isEmpty) {
      return false;
    } else {
      for (final product in list) {
        if (product.name?.toUpperCase() == name.toUpperCase()) {
          isPurch = true;

          break;
        } else {
          isPurch = false;
        }
      }

      return isPurch;
    }
  }

  bool searchProductInPurchased({required String name}) {
    var isP = false;
    if (selectedPage == NavigationEnum.appliances.name) {
      isP = searchProduct(user.purchasedElectronicsList, name);
    } else if (selectedPage == NavigationEnum.products.name) {
      isP = searchProduct(user.purchasedKitchensList, name);
    } else if (selectedPage == NavigationEnum.beyaz.name) {
      isP = searchProduct(user.purchasedBeyazsList, name);
    } else if (selectedPage == NavigationEnum.bedroom.name) {
      isP = searchProduct(user.purchasedBedroomsList, name);
    } else if (selectedPage == NavigationEnum.saloon.name) {
      isP = searchProduct(user.purchasedSaloonsList, name);
    } else if (selectedPage == NavigationEnum.bathroom.name) {
      isP = searchProduct(user.purchasedBathroomsList, name);
    } else if (selectedPage == NavigationEnum.homeTextiles.name) {
      isP = searchProduct(user.purchasedHomeTextilesList, name);
    } else if (selectedPage == NavigationEnum.homeTools.name) {
      isP = searchProduct(user.purchasedHomeToolsList, name);
    } else if (selectedPage == NavigationEnum.decoration.name) {
      isP = searchProduct(user.purchasedDecorationsList, name);
    } else if (selectedPage == NavigationEnum.lighting.name) {
      isP = searchProduct(user.purchasedLightingsList, name);
    }
    return isP;
  }
}
