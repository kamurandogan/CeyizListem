import 'package:flutter/material.dart';
import 'package:wedding_shopping_check/product/constans/routes/routes_enum.dart';
import 'package:wedding_shopping_check/product/service/fetch_product_list.dart';
import 'package:widgets/general_menu_card/general_menu_card.dart';
import 'package:widgets/paddings/paddings.dart';

class WillBuyMenu extends StatefulWidget {
  const WillBuyMenu({super.key});

  @override
  State<WillBuyMenu> createState() => _WillBuyMenuState();
}

class _WillBuyMenuState extends State<WillBuyMenu> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: kPurple,
      appBar: AppBar(),
      body: Padding(
        padding: CommonPaddings.instance.columnPadding,
        child: ListView(
          children: [
            GeneralMenuCard(
              fun: () => Navigator.pushNamed(context, RoutesEnum.kitchenPageViewRoute.name),
              size: size,
              percent: FetchProductList.instance.kitchenPercent,
              title: 'Mutfak',
            ),
            GeneralMenuCard(
              percent: FetchProductList.instance.beyazPercent,
              fun: () => Navigator.pushNamed(context, RoutesEnum.beyazEsyaScreenRoute.name),
              size: size,
              title: 'Beyaz Eşya',
            ),
            GeneralMenuCard(
              percent: FetchProductList.instance.bedroomPercent,
              size: size,
              fun: () => Navigator.pushNamed(context, RoutesEnum.bedRoomScreenRoute.name),
              title: 'Yatak Odası',
            ),
            GeneralMenuCard(
              percent: FetchProductList.instance.saloonPercent,
              fun: () => Navigator.pushNamed(context, RoutesEnum.saloonScreenRoute.name),
              size: size,
              title: 'Oturma Odası',
            ),
            GeneralMenuCard(
              percent: FetchProductList.instance.appliancesPercent,
              fun: () => Navigator.pushNamed(context, RoutesEnum.appliancesScreenRoute.name),
              size: size,
              title: 'Elektronik',
            ),
            GeneralMenuCard(
              percent: FetchProductList.instance.bathroomPercent,
              fun: () => Navigator.pushNamed(context, RoutesEnum.bathroomRoute.name),
              size: size,
              title: 'Banyo',
            ),
            GeneralMenuCard(
              percent: FetchProductList.instance.homeTextilesPercent,
              fun: () => Navigator.pushNamed(context, RoutesEnum.homeTextilesRoute.name),
              size: size,
              title: 'Ev Tekstili',
            ),
            GeneralMenuCard(
              percent: FetchProductList.instance.homeToolsPercent,
              fun: () => Navigator.pushNamed(context, RoutesEnum.homeToolsRoute.name),
              size: size,
              title: 'Ev Gereçleri',
            ),
            GeneralMenuCard(
              percent: FetchProductList.instance.lightingPercent,
              size: size,
              title: 'Aydınlatma',
              fun: () => Navigator.pushNamed(context, RoutesEnum.lightingRoute.name),
            ),
            GeneralMenuCard(
              percent: FetchProductList.instance.decorationPercent,
              fun: () => Navigator.pushNamed(context, RoutesEnum.decorationRoute.name),
              size: size,
              title: 'Dekorasyon',
            ),
          ],
        ),
      ),
    );
  }

  double calculatePercent(int a, int b) {
    double percent;

    percent = a / b;

    return percent;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  initState() {
    FetchProductList.instance.fetchAllList();
    super.initState();
  }
}
