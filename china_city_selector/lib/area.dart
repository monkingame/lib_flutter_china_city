import 'package:collection/collection.dart';

/// Area
abstract class Area {
  final String code;
  final String name;

  int _value = 0;
  _AreaType _type = _AreaType.nation;

  /// code: area code
  /// https://www.mca.gov.cn/article/sj/xzqh/2020/20201201.html
  Area({required this.code, required this.name}) {
    if (code.length == 6) {
      final v = int.tryParse(code);
      if (v != null) {
        _value = v;

        if (isNationCode(v)) _type = _AreaType.nation;
        if (isProvinceCode(v)) _type = _AreaType.province;
        if (isCityCode(v)) _type = _AreaType.city;
        if (isCountyCode(v)) _type = _AreaType.county;
      }
    }
  }

  int get value => _value;

  final List<Area> children = [];

  void add(Area child) => children.add(child);

  void sort() => children.sort(((a, b) => a.value.compareTo(b.value)));

  static bool isNationCode(int value) => value == 0;
  static bool isProvinceCode(int value) => value % 10000 == 0;
  static bool isCityCode(int value) =>
      !isProvinceCode(value) && (value % 100 == 0);
  static bool isCountyCode(int value) => value % 100 != 0;

  bool get isNation => _type == _AreaType.nation;
  bool get isProvince => _type == _AreaType.province;
  bool get isCity => _type == _AreaType.city;
  bool get isCounty => _type == _AreaType.county;

  /// get parent area value
  int get parentValue {
    if (isNation) return 0;
    if (isProvince) return 0;
    if (isCity) return (value ~/ 10000) * 10000;
    if (isCounty) return (value ~/ 100) * 100;

    return 0;
  }

  String get parentCode => parentValue.toString().padRight(6, '0');

  Area? parent;

  @override
  String toString() => '$code:$name';
}

/// area type
enum _AreaType { nation, province, city, county }

/// Nation
class Nation extends Area {
  Nation() : super(code: '000000', name: '全国');

  late final Map<String, Area> allAreas;
  late final Map<String, Area> allProvinces;
  late final Map<String, Area> allCities;
  late final Map<String, Area> allCounties;

  /// find area by name,maybe area names are same
  Area? findByName(String? name) {
    final area = allAreas.values.firstWhereOrNull((a) => a.name == name);
    return area;
  }

  /// find province by name
  Province? findProvince(String? nameProvince) {
    final p = children.firstWhereOrNull((a) => a.name == nameProvince);
    return (p == null) ? null : (p as Province);
  }

  /// find city by province and city
  City? findCity(String? nameProvince, String? nameCity) {
    final p = findProvince(nameProvince);
    if (p == null) return null;
    final c = p.children.firstWhereOrNull((a) => a.name == nameCity);
    // return c as City;
    return (c == null) ? null : (c as City);
  }

  /// find count by province and city and county names
  County? findCounty(
      String? nameProvince, String? nameCity, String? nameCounty) {
    final city = findCity(nameProvince, nameCity);
    if (city == null) return null;
    final c = city.children.firstWhereOrNull((a) => a.name == nameCounty);
    return (c == null) ? null : (c as County);
  }
}

/// Province
class Province extends Area {
  Province({required super.code, required super.name});
}

/// City
class City extends Area {
  City({required super.code, required super.name});
}

/// County
class County extends Area {
  County({required super.code, required super.name});
}
