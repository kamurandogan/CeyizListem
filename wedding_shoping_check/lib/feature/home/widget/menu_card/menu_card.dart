part of '../../home_screen.dart';

class _MenuCard extends StatelessWidget {
  const _MenuCard({required this.title, required this.route, required this.size, required this.leading});
  final String title;
  final String route;
  final double size;
  final Image leading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CommonPaddings.instance.widgetPadding,
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, route),
        child: SizedBox(
          height: size * .13,
          child: Card(
            child: Center(
              child: ListTile(
                leading: leading,
                trailing: const Icon(
                  Icons.chevron_right_rounded,
                  color: ColorName.secondary,
                ),
                title: Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
