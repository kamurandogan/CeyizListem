import 'dart:io';

import 'package:flutter/material.dart';

class HeroPic extends StatelessWidget {
  final String picName;

  final String tag;
  const HeroPic({super.key, required this.picName, required this.tag});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Hero(
          tag: tag, // Her fotoğrafın farklı bir etiketi olmalı
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Image.file(
              File(picName),
              errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                return const Text('İmaj YÜklenemedi');
              },
            ),
          ),
        ),
      ),
    );
  }
}
