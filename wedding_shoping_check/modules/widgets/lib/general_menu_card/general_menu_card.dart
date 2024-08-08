import 'package:flutter/material.dart';
import 'package:widgets/paddings/paddings.dart';

class GeneralMenuCard extends StatelessWidget {
  const GeneralMenuCard({
    super.key,
    required this.title,
    this.percent,
    this.fun,
    required this.size,
    this.leading,
    this.trailing,
  });

  final String title;
  final double? percent;
  final VoidCallback? fun;
  final Size size;
  final Widget? leading;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CommonPaddings.instance.widgetPadding,
      child: GestureDetector(
        onTap: fun,
        child: SizedBox(
          height: size.height * .14,
          child: Card(
            elevation: 0,
            child: Padding(
                padding: CommonPaddings.instance.allSidePadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.bodyLarge),
                    // todo percent indicator
                    leading ?? const SizedBox.shrink(),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
