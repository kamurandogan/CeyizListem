import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wedding_shopping_check/feature/purchased_list/widget/hero_image/hero_image.dart';
import 'package:wedding_shopping_check/models/product_model.dart';

class ProductImageView extends StatefulWidget {
  const ProductImageView({super.key, required this.product});

  final Products product;

  @override
  State<ProductImageView> createState() => _ProductImageViewState();
}

class _ProductImageViewState extends State<ProductImageView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemCount: widget.product.image.length,
      itemBuilder: (context, index) {
        final image = widget.product.image[index];
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => HeroPic(tag: image, picName: image),
            ),
          ),
          child: Stack(
            children: [
              Image.file(
                fit: BoxFit.fill,
                cacheHeight: (size.height * .3).toInt(),
                cacheWidth: (size.width * .5).toInt(),
                errorBuilder: (
                  BuildContext context,
                  Object error,
                  StackTrace? stackTrace,
                ) {
                  return const Text('İmaj YÜklenemedi');
                },
                File(widget.product.image[index]),
              ),
              Align(
                alignment: const Alignment(-0.96, -0.96),
                child: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text(
                            'Fotoğraf silinsin mi?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.pop(
                                    context,
                                  );
                                });
                              },
                              child: const Text(
                                'İptal',
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                widget.product.image.remove(image);
                                setState(() {
                                  Navigator.pop(
                                    context,
                                  );
                                });
                              },
                              child: const Text(
                                'Evet, Silinsin',
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.delete_outline,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
