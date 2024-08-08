import 'package:flutter/material.dart';
import 'package:wedding_shopping_check/feature/my_bottom_sheet/bottom_sheet_screen.dart';
import 'package:wedding_shopping_check/feature/product_list/service/search_product.dart';
import 'package:wedding_shopping_check/product/constans/strings.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key, required this.myKey, required this.list});
  final Key myKey;
  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: key,
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (context, index) {
        final product = list[index];
        final bool isPurchased = SearchProduct.instance.searchProductInPurchased(name: product.toUpperCase());

        return !isPurchased
            ? BottomSheetScreen(
                title: product,
                user: user,
                productName: product,
              )
            : const SizedBox.shrink();
      },
    );
  }
}
