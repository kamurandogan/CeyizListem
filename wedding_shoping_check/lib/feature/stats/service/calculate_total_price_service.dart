import 'package:wedding_shopping_check/feature/stats/service/get_list_service.dart';
import 'package:wedding_shopping_check/models/product_model.dart';

final class CalculateTotalPriceService {
  static CalculateTotalPriceService? _instance;
  static CalculateTotalPriceService get instance {
    _instance ??= CalculateTotalPriceService._init();
    return _instance!;
  }

  CalculateTotalPriceService._init();

  double totalPrice = 0;

  Future<double> calculateAllPrice({required user}) async {
    await GetPurchasedList.instance.getAllList();

    final totalKitchenPrice = calculateTotalPrice(user.purchasedKitchensList);
    final totalBeyazPrice = calculateTotalPrice(user.purchasedBeyazsList);
    final totalBedroomPrice = calculateTotalPrice(user.purchasedBedroomsList);
    final totalSaloonPrice = calculateTotalPrice(user.purchasedSaloonsList);
    final totalElectronicsPrice = calculateTotalPrice(user.purchasedElectronicsList);
    final totalHomeTextilesPrice = calculateTotalPrice(user.purchasedHomeTextilesList);
    final totalHomeToolsPrice = calculateTotalPrice(user.purchasedHomeToolsList);
    final totalLightingsPrice = calculateTotalPrice(user.purchasedLightingsList);
    final totalDecorationsPrice = calculateTotalPrice(user.purchasedDecorationsList);
    final totalBathroomsPrice = calculateTotalPrice(user.purchasedBathroomsList);
    final grandTotalPrice = totalKitchenPrice +
        totalBeyazPrice +
        totalBedroomPrice +
        totalSaloonPrice +
        totalElectronicsPrice +
        totalHomeTextilesPrice +
        totalHomeToolsPrice +
        totalLightingsPrice +
        totalDecorationsPrice +
        totalBathroomsPrice;
    return grandTotalPrice;
  }

  double calculateTotalPrice(List<Products> productList) {
    double totalPrice = 0; // Her çağrıda sıfırdan başlayın

    for (final product in productList) {
      totalPrice += product.price ?? 0.0;
    }

    return totalPrice;
  }
}
