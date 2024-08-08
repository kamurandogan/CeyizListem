import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wedding_shopping_check/models/product_model.dart';
import 'package:widgets/paddings/paddings.dart';

// ignore: must_be_immutable
final class PurchasedBottomSheet extends StatefulWidget {
  final VoidCallback clearController;

  final Size size;
  final TextEditingController piecesController;
  final TextEditingController priceController;
  final ImagePicker imagePicker;
  Function() selectpage;
  Products products;
  PurchasedBottomSheet({
    super.key,
    required this.size,
    required this.piecesController,
    required this.priceController,
    required this.products,
    required this.clearController,
    required this.selectpage,
    required this.imagePicker,
  });

  @override
  State<PurchasedBottomSheet> createState() => _PurchasedBottomSheetState();
}

class _PurchasedBottomSheetState extends State<PurchasedBottomSheet> {
  List<XFile> _selectedImage = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size.height * .5,
      width: widget.size.width,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Adet'),
                SizedBox(
                  width: widget.size.width * .3,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: widget.piecesController,
                    onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                    decoration: const InputDecoration(prefixIcon: Icon(Icons.edit)),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Yeni Fiyat'),
                SizedBox(
                  width: widget.size.width * .3,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: widget.priceController,
                    onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                    decoration: const InputDecoration(prefixIcon: Icon(Icons.edit)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Fotoğraf Ekle'),
                  ActionChip(
                    onPressed: () async {
                      _selectedImage = await widget.imagePicker.pickMultiImage();

                      widget.products.image.addAll(_findImagePath(_selectedImage));
                      setState(() {});
                    },
                    avatar: const Icon(Icons.add),
                    label: const Text('Seç'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: CommonPaddings.instance.sectionPadding,
              child: SizedBox(
                height: widget.size.height * .1,
                child: Row(
                  children: [
                    ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: _selectedImage.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.file(
                            isAntiAlias: true,
                            filterQuality: FilterQuality.low,
                            fit: BoxFit.cover,
                            File(_selectedImage[index].path),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: FilledButton(
                  onPressed: () {
                    setState(() {
                      widget.products.piece = int.tryParse(widget.piecesController.text) ?? widget.products.piece;
                      widget.products.price = double.tryParse(widget.priceController.text) ?? widget.products.price;
                      widget.products.image = widget.products.image;

                      widget.selectpage();
                      widget.clearController();

                      Navigator.pop(context);
                    });
                  },
                  child: const Text('Düzenle'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> _findImagePath(List<XFile>? selectedImageList) {
    final imagePaths = <String>[];

    for (final xFile in selectedImageList ?? []) {
      imagePaths.add(xFile.path.toString());
    }
    return imagePaths;
  }
}
