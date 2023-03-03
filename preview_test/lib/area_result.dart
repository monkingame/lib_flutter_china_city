import 'area.dart';

class AreaResult {
  final Area? province;
  final Area? city;
  final Area? county;

  AreaResult({this.province, this.city, this.county});

  @override
  String toString() => '$province - $city - $county';
}
