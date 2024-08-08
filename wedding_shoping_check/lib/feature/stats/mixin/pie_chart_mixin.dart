part of '../widget/pie_chart.dart';

mixin PieChartMixin on State<PieChart> {
  double? _bedroom;
  double? _beyaz;
  List<ChartData> _chartData = [];
  double? _decoration;
  double? _electronic;
  double? _kitchen;
  double? _lighting;
  double? _saloon;
  double? _textile;
  double? _tool;

  double calculateTotalListPrice(List<Products> list) {
    double totalPrice = 0;
    for (final product in list) {
      totalPrice = totalPrice + (product.price ?? 0);
    }
    return totalPrice;
  }

  void initCalculateTotalPrice() {
    _kitchen = calculateTotalListPrice(user.purchasedKitchensList);
    _beyaz = calculateTotalListPrice(user.purchasedBeyazsList);
    _bedroom = calculateTotalListPrice(user.purchasedBedroomsList);
    _saloon = calculateTotalListPrice(user.purchasedSaloonsList);
    _electronic = calculateTotalListPrice(user.purchasedElectronicsList);
    _textile = calculateTotalListPrice(user.purchasedHomeTextilesList);
    _tool = calculateTotalListPrice(user.purchasedHomeToolsList);
    _lighting = calculateTotalListPrice(user.purchasedLightingsList);
    _decoration = calculateTotalListPrice(user.purchasedDecorationsList);

    _chartData = [
      ChartData(_kitchen ?? 0, 'Mutfak'),
      ChartData(_beyaz ?? 0, 'Beyaz Eşya'),
      ChartData(_bedroom ?? 0, 'Yatak Odası'),
      ChartData(_saloon ?? 0, 'Oturma Odası'),
      ChartData(_electronic ?? 0, 'Elektronik'),
      ChartData(_textile ?? 0, 'Ev Tekstili'),
      ChartData(_tool ?? 0, 'Ev Gereçleri'),
      ChartData(_lighting ?? 0, 'Aydınlatma'),
      ChartData(_decoration ?? 0, 'Dekorasyon'),
    ];
    setState(() {});
  }
}
