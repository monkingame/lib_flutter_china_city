import 'area.dart';

class AreaResult {
  final Area? province;
  final Area? city;
  final Area? county;
  final String hyphen;

  AreaResult({this.province, this.city, this.county, this.hyphen = '-'});

  @override
  String toString() {
    // => '$province - $city - $county';
    if (province == null) {
      return '';
    } else {
      if (city == null) {
        return province!.name;
      } else {
        if (county == null) {
          return '${province!.name}$hyphen${city!.name}';
        } else {
          return '${province!.name}$hyphen${city!.name}$hyphen${county!.name}';
        }
      }
    }
  }
}
