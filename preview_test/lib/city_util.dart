import 'area.dart';
import 'map_china_cities.dart';

abstract class CityUtil {
  CityUtil._();

  static void analyze() {
    final nation = Nation();
    // final List<Area> allAreas = [];
    final Map<String, Area> allProvinces = {};
    final Map<String, Area> allCities = {};
    final Map<String, Area> allCounties = {};

    for (var code in mapChinaCities.keys) {
      // print(code);
      if (code.length != 6) continue;
      if (int.tryParse(code) == null) continue;
      final name = mapChinaCities[code];
      if (name == null) continue;

      Area area;
      final codeValue = int.parse(code);
      if (Area.isProvinceCode(codeValue)) {
        area = Province(code: code, name: name);
        nation.add(area);
        allProvinces[code] = area;
      } else if (Area.isCityCode(codeValue)) {
        area = City(code: code, name: name);
        allCities[code] = area;
      } else if (Area.isCountyCode(codeValue)) {
        area = County(code: code, name: name);
        allCounties[code] = area;
      } else {
        continue;
      }
      // allAreas.add(area);
    }

    for (Area city in allCities.values) {
      final provinceCode = city.parentCode;
      final province = allProvinces[provinceCode];
      if (province == null) continue;
      city.parent = province;
      province.add(city);
    }

    print('done');
  }
}
