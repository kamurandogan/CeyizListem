import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:widgets/paddings/paddings.dart';

class ImageBuilder extends StatelessWidget {
  const ImageBuilder({
    super.key,
    required this.imageList,
    this.selectedImage,
  });
  final List<String> imageList;
  final List<XFile>? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CommonPaddings.instance.sectionPadding,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .1,
        child: Row(
          children: [
            ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: selectedImage?.length ?? 0,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(right: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.file(
                    filterQuality: FilterQuality.low,
                    scale: 1,
                    fit: BoxFit.cover,
                    File(imageList[index]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
