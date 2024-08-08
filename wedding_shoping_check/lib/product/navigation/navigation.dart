import 'package:flutter/material.dart';
import 'package:wedding_shopping_check/feature/dowry_list_menu/dowry_screen.dart';
import 'package:wedding_shopping_check/feature/home/home_screen.dart';
import 'package:wedding_shopping_check/feature/product_list/product_list_screen.dart';
import 'package:wedding_shopping_check/feature/purchased_list/purchased_list_screen.dart';
import 'package:wedding_shopping_check/feature/stats/stats_screen.dart';
import 'package:wedding_shopping_check/feature/will_buy_menu_screen/will_buy_menu_screen.dart';
import 'package:wedding_shopping_check/product/constans/routes/routes_enum.dart';
import 'package:wedding_shopping_check/product/constans/strings.dart';
import 'package:wedding_shopping_check/product/navigation/navigation_enum.dart';

final class Navigation {
  static Map<String, Widget Function(BuildContext)> routes = {
    RoutesEnum.mainViewRoute.name: (context) => const HomeScreen(),
    RoutesEnum.listViewRoute.name: (context) => const WillBuyMenu(),
    RoutesEnum.purchasedScreenRoute.name: (context) => const DowryListMenuScreen(),
    RoutesEnum.statsRoute.name: (context) => const StatsView(),
    // totalPaidsRoute: (context) => const TotalPaidsScreen(),
    RoutesEnum.kitchenPageViewRoute.name: (context) => ProductListScreen(firebaseId: NavigationEnum.products.name),
    RoutesEnum.appliancesScreenRoute.name: (context) => ProductListScreen(firebaseId: NavigationEnum.appliances.name),
    RoutesEnum.beyazEsyaScreenRoute.name: (context) => ProductListScreen(firebaseId: NavigationEnum.beyaz.name),
    RoutesEnum.bedRoomScreenRoute.name: (context) => ProductListScreen(firebaseId: NavigationEnum.bedroom.name),
    RoutesEnum.saloonScreenRoute.name: (context) => ProductListScreen(firebaseId: NavigationEnum.saloon.name),
    RoutesEnum.bathroomRoute.name: (context) => ProductListScreen(firebaseId: NavigationEnum.bathroom.name),
    RoutesEnum.homeTextilesRoute.name: (context) => ProductListScreen(firebaseId: NavigationEnum.homeTextiles.name),
    RoutesEnum.homeToolsRoute.name: (context) => ProductListScreen(firebaseId: NavigationEnum.homeTools.name),
    RoutesEnum.lightingRoute.name: (context) => ProductListScreen(firebaseId: NavigationEnum.lighting.name),
    RoutesEnum.decorationRoute.name: (context) => ProductListScreen(firebaseId: NavigationEnum.decoration.name),
    RoutesEnum.purchasedKitchenRoute.name: (context) =>
        PurchasedListWidget(list: user.purchasedKitchensList, firebaseId: NavigationEnum.products.name),
    RoutesEnum.purchasedBeyazRoute.name: (context) =>
        PurchasedListWidget(list: user.purchasedBeyazsList, firebaseId: NavigationEnum.beyaz.name),
    RoutesEnum.purchasedBedroomRoute.name: (context) =>
        PurchasedListWidget(list: user.purchasedBedroomsList, firebaseId: NavigationEnum.bedroom.name),
    RoutesEnum.purchasedSaloonRoute.name: (context) =>
        PurchasedListWidget(list: user.purchasedSaloonsList, firebaseId: NavigationEnum.saloon.name),
    RoutesEnum.purchasedElectronicRoute.name: (context) =>
        PurchasedListWidget(list: user.purchasedElectronicsList, firebaseId: NavigationEnum.appliances.name),
    RoutesEnum.purchasedBathroomRoute.name: (context) =>
        PurchasedListWidget(list: user.purchasedBathroomsList, firebaseId: NavigationEnum.bathroom.name),
    RoutesEnum.purchasedHomeTextilesRoute.name: (context) =>
        PurchasedListWidget(list: user.purchasedHomeTextilesList, firebaseId: NavigationEnum.homeTextiles.name),
    RoutesEnum.purchasedHometoolsRoute.name: (context) =>
        PurchasedListWidget(list: user.purchasedHomeToolsList, firebaseId: NavigationEnum.homeTools.name),
    RoutesEnum.purchasedLightingRoute.name: (context) =>
        PurchasedListWidget(list: user.purchasedLightingsList, firebaseId: NavigationEnum.lighting.name),
    RoutesEnum.purchasedDecorationRoute.name: (context) =>
        PurchasedListWidget(list: user.purchasedDecorationsList, firebaseId: NavigationEnum.decoration.name),
  };
}
