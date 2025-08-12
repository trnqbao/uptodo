import 'individual_bar.dart';

class BarData {
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thuAmount;
  final double friAmount;
  final double satAmount;

  BarData(this.sunAmount, this.monAmount, this.tueAmount, this.wedAmount,
      this.thuAmount, this.friAmount, this.satAmount);

  List<IndividualBar> data = [];

  void init() {
    data = [
      IndividualBar(0, sunAmount),
      IndividualBar(1, monAmount),
      IndividualBar(2, tueAmount),
      IndividualBar(3, wedAmount),
      IndividualBar(4, thuAmount),
      IndividualBar(5, friAmount),
      IndividualBar(6, satAmount),
    ];
  }
}
