import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wedding_shopping_check/feature/home/view/total_expenses_view/cubit/total_expenses_cubit.dart';
import 'package:wedding_shopping_check/feature/my_bottom_sheet/widget/image_builder/image_builder.dart';
import 'package:wedding_shopping_check/feature/my_bottom_sheet/widget/my_text_field/my_textfield.dart';
import 'package:wedding_shopping_check/models/product_model.dart';
import 'package:wedding_shopping_check/product/constans/strings.dart';
import 'package:wedding_shopping_check/product/navigation/navigation_enum.dart';
import 'package:wedding_shopping_check/product/service/ad_service/ad_manager.dart';
import 'package:wedding_shopping_check/product/service/shared_preferences_service.dart';
import 'package:widgets/paddings/paddings.dart';

part '../../mixin/form_field_view_mixin.dart';

// ignore: must_be_immutable
class FormFieldView extends StatefulWidget {
  FormFieldView(
      {super.key,
      required this.size,
      required this.brandTextEditingController,
      required this.piecesTextEditingController,
      required this.priceTextEditingController,
      required this.products,
      required this.productName,
      this.selectedImage});

  Products products;
  List<XFile>? selectedImage;
  final Size size;
  final TextEditingController brandTextEditingController;
  final TextEditingController piecesTextEditingController;
  final TextEditingController priceTextEditingController;
  final String productName;

  @override
  State<FormFieldView> createState() => _FormFieldViewState();
}

class _FormFieldViewState extends State<FormFieldView> with _FormFieldViewMixin {
  @override
  Widget build(BuildContext context) {
    _findImagePath();
    return Padding(
      padding: CommonPaddings.instance.columnPadding,
      child: SizedBox(
        height: widget.size.height * .8,
        width: widget.size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MyTextfield(
              title: 'Marka/Model',
              textEditingController: widget.brandTextEditingController,
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.text,
            ),
            MyTextfield(
              title: 'Adet',
              textEditingController: widget.piecesTextEditingController,
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.number,
            ),
            MyTextfield(
                title: 'Fiyat',
                textEditingController: widget.priceTextEditingController,
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.number),
            _chooseButton(),
            ImageBuilder(selectedImage: widget.selectedImage, imageList: _findImagePath()),
            _addButton(context),
          ],
        ),
      ),
    );
  }

  Expanded _addButton(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ElevatedButton(
            onPressed: () async {
              widget.products = Products(
                  isPurchased: true,
                  brand: widget.brandTextEditingController.text.toUpperCase(),
                  image: _findImagePath(),
                  name: widget.productName.toUpperCase(),
                  piece: int.tryParse(widget.piecesTextEditingController.text),
                  price: double.tryParse(widget.priceTextEditingController.text));
              selectpage(widget.products);
              Navigator.pop(context);
              _clearController();
              InterstitialAdManager.instance.show();
              context.read<TotalExpensesCubit>().getTotalExpenses();
              setState(() {});
            },
            child: const Text('EKLE')),
      ),
    );
  }

  Padding _chooseButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Text('Fotoğraf Yükle'),
        ActionChip(
            onPressed: () async {
              widget.selectedImage = (await _imagePicker.pickMultiImage());

              setState(() {});
            },
            avatar: const Icon(Icons.add),
            label: const Text('Seç'))
      ]),
    );
  }
}
