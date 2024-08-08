import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wedding_shopping_check/product/constans/strings.dart';
import 'package:wedding_shopping_check/product/navigation/navigation_enum.dart';

class FetchProductList {
  static FetchProductList? _instance;
  static FetchProductList get instance {
    _instance ??= FetchProductList._init();
    return _instance!;
  }

  FetchProductList._init();

  double appliancesPercent = 0;

  double kitchenPercent = 0;
  double beyazPercent = 0;
  double bedroomPercent = 0;
  double saloonPercent = 0;
  double bathroomPercent = 0;
  double homeTextilesPercent = 0;
  double homeToolsPercent = 0;
  double decorationPercent = 0;
  double lightingPercent = 0;

  double calculatePercent(int a, int b) {
    double percent;

    percent = a / b;

    return percent;
  }

  Future<void> fetchAllList() async {
    final appliancesValue = await FetchProductList.instance.getListLength(NavigationEnum.appliances.name);
    if (appliancesValue != null) {
      appliancesPercent = calculatePercent(
        user.purchasedElectronicsList.length,
        appliancesValue,
      );
    }

    final kitchenValue = await FetchProductList.instance.getListLength(NavigationEnum.products.name);
    if (kitchenValue != null) {
      kitchenPercent = calculatePercent(user.purchasedKitchensList.length, kitchenValue);
    }

    final beyazValue = await FetchProductList.instance.getListLength(NavigationEnum.beyaz.name);
    if (beyazValue != null) {
      beyazPercent = calculatePercent(user.purchasedBeyazsList.length, beyazValue);
    }

    final bedroomValue = await FetchProductList.instance.getListLength(NavigationEnum.bedroom.name);
    if (bedroomValue != null) {
      bedroomPercent = calculatePercent(user.purchasedBedroomsList.length, bedroomValue);
    }

    final saloonValue = await FetchProductList.instance.getListLength(NavigationEnum.saloon.name);
    if (saloonValue != null) {
      saloonPercent = calculatePercent(user.purchasedSaloonsList.length, saloonValue);
    }

    final bathroomValue = await FetchProductList.instance.getListLength(NavigationEnum.bathroom.name);
    if (bathroomValue != null) {
      bathroomPercent = calculatePercent(user.purchasedBathroomsList.length, bathroomValue);
    }

    final homeTextilesValue = await FetchProductList.instance.getListLength(NavigationEnum.homeTextiles.name);
    if (homeTextilesValue != null) {
      homeTextilesPercent = calculatePercent(
        user.purchasedHomeTextilesList.length,
        homeTextilesValue,
      );
    }

    final homeToolsValue = await FetchProductList.instance.getListLength(NavigationEnum.homeTools.name);
    if (homeToolsValue != null) {
      homeToolsPercent = calculatePercent(user.purchasedHomeToolsList.length, homeToolsValue);
    }

    final decorationValue = await FetchProductList.instance.getListLength(NavigationEnum.decoration.name);
    if (decorationValue != null) {
      decorationPercent = calculatePercent(
        user.purchasedDecorationsList.length,
        decorationValue,
      );
    }

    final lightingValue = await FetchProductList.instance.getListLength(NavigationEnum.lighting.name);
    if (lightingValue != null) {
      lightingPercent = calculatePercent(user.purchasedLightingsList.length, lightingValue);
    }
  }

  Future<int?> getListLength(String dataName) async {
    List<dynamic>? dataList;
    final CollectionReference products = FirebaseFirestore.instance.collection('products');

    try {
      // Belgeyi al ve işlemleri tamamlanana kadar bekle
      final documentSnapshot = await products.doc('Kitchen').get();

      // Belge içindeki belirli bir alanı al
      final productData = documentSnapshot.data() as Map<String, dynamic>?;

      if (productData != null) {
        // Alandaki verileri liste olarak al
        dataList = productData[dataName] as List<dynamic>?;

        if (dataList != null) {
          // Listeyi yazdır
        } else {}
      } else {}
      // ignore: empty_catches
    } catch (e) {}
    return dataList?.length;
  }
}
