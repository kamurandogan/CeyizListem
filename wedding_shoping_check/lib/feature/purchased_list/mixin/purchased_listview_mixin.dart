import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wedding_shopping_check/feature/purchased_list/view/purchased_list_view_companent/purchased_listview.dart';
import 'package:wedding_shopping_check/models/product_model.dart';
import 'package:wedding_shopping_check/product/constans/strings.dart';
import 'package:wedding_shopping_check/product/navigation/navigation_enum.dart';
import 'package:wedding_shopping_check/product/service/shared_preferences_service.dart';

mixin PurchasedListviewMixin on State<PurchasedListview> {
  List<Products>? productList;

  final ImagePicker imagePicker = ImagePicker();

  final TextEditingController piecesTextController = TextEditingController();

  final TextEditingController priceTextController = TextEditingController();

  void clearController() {
    piecesTextController.clear();
    priceTextController.clear();
    setState(() {});
  }

  Future<void> loadListFromSharedPreferences() async {
    final list = await SharedPreferencesService.instance.getList(widget.firebaseId);
    setState(() {
      productList = list;
    });
  }

  Future<void> selectpage(Products products) async {
    if (selectedPage == null) {
      return;
    }
    if (selectedPage == NavigationEnum.appliances.name) {
      user.purchasedElectronicsList = productList ?? [];
      await SharedPreferencesService.instance.saveList(
        NavigationEnum.appliances.name,
        user.purchasedElectronicsList,
      );
    } else if (selectedPage == NavigationEnum.products.name) {
      user.purchasedKitchensList = productList ?? [];
      await SharedPreferencesService.instance.saveList(NavigationEnum.products.name, user.purchasedKitchensList);
    } else if (selectedPage == NavigationEnum.beyaz.name) {
      user.purchasedBeyazsList = productList ?? [];
      await SharedPreferencesService.instance.saveList(NavigationEnum.beyaz.name, user.purchasedBeyazsList);
    } else if (selectedPage == NavigationEnum.bedroom.name) {
      user.purchasedBedroomsList = productList ?? [];
      await SharedPreferencesService.instance.saveList(NavigationEnum.bedroom.name, user.purchasedBedroomsList);
    } else if (selectedPage == NavigationEnum.saloon.name) {
      user.purchasedSaloonsList = productList ?? [];
      await SharedPreferencesService.instance.saveList(NavigationEnum.saloon.name, user.purchasedSaloonsList);
    } else if (selectedPage == NavigationEnum.bathroom.name) {
      user.purchasedBathroomsList = productList ?? [];
      await SharedPreferencesService.instance.saveList(
        NavigationEnum.bathroom.name,
        user.purchasedBathroomsList,
      );
    } else if (selectedPage == NavigationEnum.homeTextiles.name) {
      user.purchasedHomeTextilesList = productList ?? [];
      await SharedPreferencesService.instance.saveList(
        NavigationEnum.homeTextiles.name,
        user.purchasedHomeTextilesList,
      );
    } else if (selectedPage == NavigationEnum.homeTools.name) {
      user.purchasedHomeToolsList = productList ?? [];
      await SharedPreferencesService.instance.saveList(
        NavigationEnum.homeTools.name,
        user.purchasedHomeToolsList,
      );
    } else if (selectedPage == NavigationEnum.decoration.name) {
      user.purchasedDecorationsList = productList ?? [];
      await SharedPreferencesService.instance.saveList(
        NavigationEnum.decoration.name,
        user.purchasedDecorationsList,
      );
    } else if (selectedPage == NavigationEnum.lighting.name) {
      user.purchasedLightingsList = productList ?? [];
      await SharedPreferencesService.instance.saveList(
        NavigationEnum.lighting.name,
        user.purchasedLightingsList,
      );
    }
    setState(() {});
    // Shared_preferences'a listeleri kaydedin
  }
}
