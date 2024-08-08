part of '../widget/form_field/form_field_view.dart';

mixin _FormFieldViewMixin on State<FormFieldView> {
  bool isPurchased = false;
  final ImagePicker _imagePicker = ImagePicker();

  void _clearController() {
    widget.brandTextEditingController.clear();
    widget.piecesTextEditingController.clear();
    widget.priceTextEditingController.clear();
  }

  List<String> _findImagePath() {
    List<String> imagePaths = [];

    for (var xFile in widget.selectedImage ?? []) {
      imagePaths.add(xFile.path);
    }
    return imagePaths;
  }

  Future<void> selectpage(Products products) async {
    if (selectedPage == null) {
      return;
    }
    if (selectedPage == NavigationEnum.appliances.name) {
      user.purchasedElectronicsList.add(products);
      await SharedPreferencesService.instance.saveList(NavigationEnum.appliances.name, user.purchasedElectronicsList);
    } else if (selectedPage == NavigationEnum.products.name) {
      user.purchasedKitchensList.add(products);
      await SharedPreferencesService.instance.saveList(NavigationEnum.products.name, user.purchasedKitchensList);
    } else if (selectedPage == NavigationEnum.beyaz.name) {
      user.purchasedBeyazsList.add(products);
      await SharedPreferencesService.instance.saveList(NavigationEnum.beyaz.name, user.purchasedBeyazsList);
    } else if (selectedPage == NavigationEnum.bedroom.name) {
      user.purchasedBedroomsList.add(products);
      await SharedPreferencesService.instance.saveList(NavigationEnum.bedroom.name, user.purchasedBedroomsList);
    } else if (selectedPage == NavigationEnum.saloon.name) {
      user.purchasedSaloonsList.add(products);
      await SharedPreferencesService.instance.saveList(NavigationEnum.saloon.name, user.purchasedSaloonsList);
    } else if (selectedPage == NavigationEnum.bathroom.name) {
      user.purchasedBathroomsList.add(products);
      await SharedPreferencesService.instance.saveList(NavigationEnum.bathroom.name, user.purchasedBathroomsList);
    } else if (selectedPage == NavigationEnum.homeTextiles.name) {
      user.purchasedHomeTextilesList.add(products);
      await SharedPreferencesService.instance
          .saveList(NavigationEnum.homeTextiles.name, user.purchasedHomeTextilesList);
    } else if (selectedPage == NavigationEnum.homeTools.name) {
      user.purchasedHomeToolsList.add(products);
      await SharedPreferencesService.instance.saveList(NavigationEnum.homeTools.name, user.purchasedHomeToolsList);
    } else if (selectedPage == NavigationEnum.decoration.name) {
      user.purchasedDecorationsList.add(products);
      await SharedPreferencesService.instance.saveList(NavigationEnum.decoration.name, user.purchasedDecorationsList);
    } else if (selectedPage == NavigationEnum.lighting.name) {
      user.purchasedLightingsList.add(products);
      await SharedPreferencesService.instance.saveList(NavigationEnum.lighting.name, user.purchasedLightingsList);
    }
    // Shared_preferences'a listeleri kaydedin
  }
}
