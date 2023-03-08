import 'area.dart';
import 'map_china_areas.dart';

/// area analyzer
abstract class AreaAnalyzer {
  AreaAnalyzer._();

  /// analyze nation from map const
  static Nation analyzeNation() {
    final nation = Nation();
    final Map<String, Area> allAreas = {};
    final Map<String, Area> allProvinces = {};
    final Map<String, Area> allCities = {};
    final Map<String, Area> allCounties = {};

    for (var code in mapChinaAreas.keys) {
      // print(code);
      if (code.length != 6) continue;
      if (int.tryParse(code) == null) continue;
      final name = mapChinaAreas[code];
      if (name == null) continue;

      Area area;
      final codeValue = int.parse(code);
      if (Area.isProvinceCode(codeValue)) {
        area = Province(code: code, name: name);
        // area.parent = nation;
        // nation.add(area);
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

      allAreas[code] = area;
    }

    for (Area county in allCounties.values) {
      final cityCode = county.parentCode;
      final city = allCities[cityCode];
      if (city == null) continue;
      county.parent = city;
      city.add(county);
    }

    for (Area city in allCities.values) {
      final provinceCode = city.parentCode;
      final province = allProvinces[provinceCode];
      if (province == null) continue;
      city.parent = province;
      city.sort();
      province.add(city);
    }

    for (Area province in allProvinces.values) {
      province.parent = nation;
      province.sort();
      nation.add(province);
    }

    nation.sort();

    nation.allAreas = allAreas;
    nation.allProvinces = allProvinces;
    nation.allCities = allCities;
    nation.allCounties = allCounties;

    // print('done');
    return nation;
  }
}
