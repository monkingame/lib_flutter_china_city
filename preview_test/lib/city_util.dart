import 'package:preview_test/area.dart';

import 'china_cities.dart';

abstract class CityUtil {
  CityUtil._();

  static void analyze() {
    final nation = Nation();

    for (var code in chinaCities.keys) {
      // print(code);
      if (code.length != 6) continue;
      if (int.tryParse(code) == null) continue;
    }
  }
}
