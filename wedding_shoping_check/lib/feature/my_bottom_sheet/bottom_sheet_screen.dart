// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wedding_shopping_check/feature/my_bottom_sheet/widget/form_field/form_field_view.dart';
import 'package:wedding_shopping_check/models/product_model.dart';
import 'package:wedding_shopping_check/models/user_model.dart';
import 'package:wedding_shopping_check/product/service/ad_service/ad_manager.dart';
import 'package:widgets/paddings/paddings.dart';

// ignore: must_be_immutable

final class BottomSheetScreen extends StatefulWidget {
  final User? user;
  final String? title;
  final String? productName;
  const BottomSheetScreen({
    super.key,
    this.user,
    this.title,
    this.productName,
  });

  @override
  State<BottomSheetScreen> createState() => _BottomSheetScreenState();
}

class _BottomSheetScreenState extends State<BottomSheetScreen> {
  final TextEditingController _brandTextController = TextEditingController();
  final TextEditingController _piecesTextController = TextEditingController();
  final TextEditingController _priceTextController = TextEditingController();
  final Products _products = Products(image: []);
  List<XFile>? _selectedImage;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: CommonPaddings.instance.columnPadding,
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              widget.title ?? "Null",
              // todo
              style: const TextStyle(),
            ),
            addButton(context, size)
          ]),
          const Divider(
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  IconButton addButton(BuildContext context, Size size) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return FormFieldView(
              brandTextEditingController: _brandTextController,
              piecesTextEditingController: _piecesTextController,
              priceTextEditingController: _priceTextController,
              productName: widget.productName!.toUpperCase(),
              products: _products,
              size: size,
              selectedImage: _selectedImage,
            );
          },
        );
      },
      icon: const Icon(
        Icons.add,
        // todo
      ),
    );
  }

  @override
  void initState() {
    BannerAdManager.instance.load();
    super.initState();
  }
}
