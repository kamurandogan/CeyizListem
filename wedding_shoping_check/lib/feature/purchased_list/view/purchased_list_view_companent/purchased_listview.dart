import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen/colors.gen.dart';
import 'package:wedding_shopping_check/feature/home/view/total_expenses_view/cubit/total_expenses_cubit.dart';
import 'package:wedding_shopping_check/feature/purchased_list/mixin/purchased_listview_mixin.dart';
import 'package:wedding_shopping_check/feature/purchased_list/view/product_image_view/product_image_view.dart';
import 'package:wedding_shopping_check/feature/purchased_list/widget/bottom_sheet/bottom_sheet.dart';
import 'package:wedding_shopping_check/models/product_model.dart';
import 'package:wedding_shopping_check/product/constans/strings.dart';
import 'package:widgets/paddings/paddings.dart';

class PurchasedListview extends StatefulWidget {
  const PurchasedListview({super.key, required this.firebaseId});
  final String firebaseId;

  @override
  State<PurchasedListview> createState() => _PurchasedListviewState();
}

class _PurchasedListviewState extends State<PurchasedListview> with PurchasedListviewMixin {
  @override
  void initState() {
    loadListFromSharedPreferences();
    selectedPage = widget.firebaseId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListView.builder(
      shrinkWrap: true,
      physics: const RangeMaintainingScrollPhysics(),
      itemCount: productList?.length ?? 0,
      itemBuilder: (context, index) {
        final product = productList![index];

        return Card(
          child: SizedBox(
            width: size.width,
            height: size.height * .5,
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(child: ProductImageView(product: product)),
                  Text(
                    product.name ?? '',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    product.brand ?? '',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${product.piece} Adet',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        '${product.price} TL',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(color: ColorName.secondary, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Padding(
                    padding: CommonPaddings.instance.contentPadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _showDeleteDialog(context, product);
                            });
                          },
                          child: Text(
                            'Sil',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.pink),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            if (productList != null) {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return PurchasedBottomSheet(
                                    size: size,
                                    piecesController: piecesTextController,
                                    priceController: priceTextController,
                                    products: product,
                                    clearController: clearController,
                                    selectpage: () => selectpage(product),
                                    imagePicker: imagePicker,
                                  );
                                },
                              );
                            }
                          },
                          child: Text(
                            'Düzenle',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> _showDeleteDialog(BuildContext context, Products product) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Çeyiz listenizden kaldırılsın mı?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
              child: const Text('İptal'),
            ),
            TextButton(
              onPressed: () async {
                if (productList != null) {
                  productList?.remove(product);
                  print(productList);

                  selectpage(product);
                  context.read<TotalExpensesCubit>().getTotalExpenses();
                }
                setState(() {
                  Navigator.pop(context);
                });
              },
              child: const Text(
                'Evet, kaldırılsın',
              ),
            ),
          ],
        );
      },
    );
  }
}
