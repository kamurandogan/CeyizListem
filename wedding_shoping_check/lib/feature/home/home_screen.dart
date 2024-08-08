import 'package:flutter/material.dart';
import 'package:gen/gen/assets.gen.dart';
import 'package:gen/gen/colors.gen.dart';
import 'package:wedding_shopping_check/feature/home/view/total_expenses_view/total_expenses_view.dart';
import 'package:wedding_shopping_check/product/constans/routes/routes_enum.dart';
import 'package:widgets/paddings/paddings.dart';

part 'view/home_screen_image/home_screen_image.dart';
part 'widget/menu_card/menu_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: CommonPaddings.instance.columnPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const HomeScreenImage(),
            const Spacer(flex: 2),
            SizedBox(
              height: size.height * .07,
            ),
            const TotalExpensesView(),
            // SizedBox(
            //   height: size.height * .07,
            // ),
            _statsMenuCard(size),
            _willBuyMenuCard(size),
            _dowryMenuCard(size)
          ],
        ),
      ),
    );
  }

  _MenuCard _dowryMenuCard(Size size) {
    return _MenuCard(
      leading: Assets.icon.love10175418.image(package: 'gen'),
      title: 'Çeyizim',
      route: RoutesEnum.purchasedScreenRoute.name,
      size: size.height,
    );
  }

  _MenuCard _willBuyMenuCard(Size size) {
    return _MenuCard(
      leading: Assets.icon.addCart.image(package: 'gen'),
      title: 'Alınacaklar',
      route: RoutesEnum.listViewRoute.name,
      size: size.height,
    );
  }

  Padding _statsMenuCard(Size size) {
    return Padding(
      padding: CommonPaddings.instance.sectionPadding,
      child: _MenuCard(
        leading: Assets.icon.pieChart16262242.image(package: 'gen'),
        title: 'Toplam Harcamalar',
        route: RoutesEnum.statsRoute.name,
        size: size.height,
      ),
    );
  }
}
