import 'package:flutter/material.dart';
import 'package:gen/gen/colors.gen.dart';
import 'package:wedding_shopping_check/product/constans/routes/routes_enum.dart';
import 'package:widgets/general_menu_card/general_menu_card.dart';
import 'package:widgets/paddings/paddings.dart';

class DowryListMenuScreen extends StatefulWidget {
  const DowryListMenuScreen({super.key});

  @override
  State<DowryListMenuScreen> createState() => _DowryListMenuScreenState();
}

class _DowryListMenuScreenState extends State<DowryListMenuScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: CommonPaddings.instance.columnPadding,
        child: ListView(
          children: [
            GeneralMenuCard(
                leading: const Icon(
                  Icons.chevron_right_rounded,
                  color: ColorName.secondary,
                ),
                size: size,
                fun: () => Navigator.pushNamed(context, RoutesEnum.purchasedKitchenRoute.name),
                title: 'Mutfak'),
            GeneralMenuCard(
                leading: const Icon(
                  Icons.chevron_right_rounded,
                  color: ColorName.secondary,
                ),
                size: size,
                fun: () => Navigator.pushNamed(context, RoutesEnum.purchasedBeyazRoute.name),
                title: 'Beyaz Eşya'),
            GeneralMenuCard(
                leading: const Icon(
                  Icons.chevron_right_rounded,
                  color: ColorName.secondary,
                ),
                size: size,
                fun: () => Navigator.pushNamed(context, RoutesEnum.purchasedBedroomRoute.name),
                title: 'Yatak Odası'),
            GeneralMenuCard(
                leading: const Icon(
                  Icons.chevron_right_rounded,
                  color: ColorName.secondary,
                ),
                size: size,
                fun: () => Navigator.pushNamed(context, RoutesEnum.purchasedSaloonRoute.name),
                title: 'Oturma Odası'),
            GeneralMenuCard(
                leading: const Icon(
                  Icons.chevron_right_rounded,
                  color: ColorName.secondary,
                ),
                size: size,
                fun: () => Navigator.pushNamed(context, RoutesEnum.purchasedElectronicRoute.name),
                title: 'Elektronik'),
            GeneralMenuCard(
                leading: const Icon(
                  Icons.chevron_right_rounded,
                  color: ColorName.secondary,
                ),
                size: size,
                fun: () => Navigator.pushNamed(context, RoutesEnum.purchasedBathroomRoute.name),
                title: 'Banyo'),
            GeneralMenuCard(
                leading: const Icon(
                  Icons.chevron_right_rounded,
                  color: ColorName.secondary,
                ),
                size: size,
                title: 'Ev Tekstili',
                fun: () => Navigator.pushNamed(context, RoutesEnum.purchasedHomeTextilesRoute.name)),
            GeneralMenuCard(
                leading: const Icon(
                  Icons.chevron_right_rounded,
                  color: ColorName.secondary,
                ),
                size: size,
                fun: () => Navigator.pushNamed(context, RoutesEnum.purchasedHometoolsRoute.name),
                title: 'Ev Gereçleri'),
            GeneralMenuCard(
                leading: const Icon(
                  Icons.chevron_right_rounded,
                  color: ColorName.secondary,
                ),
                size: size,
                fun: () => Navigator.pushNamed(context, RoutesEnum.purchasedLightingRoute.name),
                title: 'Aydınlatma'),
            GeneralMenuCard(
                leading: const Icon(
                  Icons.chevron_right_rounded,
                  color: ColorName.secondary,
                ),
                size: size,
                fun: () => Navigator.pushNamed(context, RoutesEnum.purchasedDecorationRoute.name),
                title: 'Dekorasyon'),
          ],
        ),
      ),
    );
  }
}
