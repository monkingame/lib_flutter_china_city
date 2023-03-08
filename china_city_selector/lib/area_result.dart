import 'dart:math';

import 'area.dart';
import 'area_analyzer.dart';

class AreaResult {
  final Area? province;
  final Area? city;
  final Area? county;
  final String hyphen;

  AreaResult({this.province, this.city, this.county, this.hyphen = '-'});

  @override
  String toString() {
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

  static AreaResult random() {
    Area? province;
    Area? city;
    Area? county;

    final nation = AreaAnalyzer.analyzeNation();
    final provinces = nation.allProvinces.values.toList();
    if (provinces.isNotEmpty) {
      province = provinces[Random().nextInt(provinces.length)] as Province;
      final cities = province.children;
      if (cities.isNotEmpty) {
        city = cities[Random().nextInt(cities.length)] as City;
        final counties = city.children;
        if (counties.isNotEmpty) {
          county = counties[Random().nextInt(counties.length)] as County;
        }
      }
    }

    final result = AreaResult(province: province, city: city, county: county);
    return result;
  }
}
