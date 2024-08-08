part of '../../home_screen.dart';

class HomeScreenImage extends StatelessWidget {
  const HomeScreenImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Assets.image.undrawLoveReMwbq.svg(package: 'gen', height: MediaQuery.of(context).size.height * .25);
  }
}
