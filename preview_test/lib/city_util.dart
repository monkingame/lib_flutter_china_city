import 'china_cities.dart';

abstract class CityUtil {
  CityUtil._();

  static void analyze() {
    for (var code in chinaCities.keys) {
      print(code);
    }
  }
}
