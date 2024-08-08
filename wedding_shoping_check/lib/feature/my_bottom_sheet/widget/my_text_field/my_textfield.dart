import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  const MyTextfield(
      {super.key, required this.textEditingController, this.textInputType, this.textInputAction, required this.title});
  final TextEditingController textEditingController;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        SizedBox(
          width: MediaQuery.of(context).size.width * .3,
          child: TextField(
            textInputAction: textInputAction,
            keyboardType: textInputType,
            controller: textEditingController,
            onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
            decoration: const InputDecoration(prefixIcon: Icon(Icons.edit)),
          ),
        )
      ],
    );
  }
}
