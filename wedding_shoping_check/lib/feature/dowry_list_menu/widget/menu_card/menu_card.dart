import 'package:flutter/material.dart';
import 'package:gen/gen/colors.gen.dart';
import 'package:widgets/paddings/paddings.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({super.key, this.fun, required this.title});
  final VoidCallback? fun;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CommonPaddings.instance.widgetPadding,
      child: GestureDetector(
        onTap: fun,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .14,
          child: Card(
            elevation: 0,
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: ListTile(
                    title: Text(title, style: Theme.of(context).textTheme.titleMedium),
                    trailing: const Icon(
                      Icons.chevron_right_rounded,
                      color: ColorName.secondary,
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
