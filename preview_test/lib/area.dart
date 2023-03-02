/// 地区类
abstract class Area {
  final String code;
  final String name;

  Area({required this.code, required this.name});

  int get codeValue => int.parse(code);

  // abstract List<Area> children;
  final List<Area> children = [];

  void add(Area child) => children.add(child);

  void sort() => children.sort(((a, b) => a.code.compareTo(b.code)));

  bool get isNation => codeValue == 0;

  bool get isProvince => codeValue % 10000 == 0;

  bool get isCity => !isProvince && (codeValue % 100 == 0);

  bool get isCounty => codeValue % 100 != 0;

  static bool isNationCode(int code) => code == 0;
  static bool isProvinceCode(int code) => code % 10000 == 0;
  static bool isCityCode(int code) =>
      !isProvinceCode(code) && (code % 100 == 0);
  static bool isCountyCode(int code) => code % 100 != 0;

  int get getParentCodeValue {
    if (isNation) return 0;
    if (isProvince) return 0;
    if (isCity) return ((codeValue / 10000) as int) * 10000;
    if (isCounty) return ((codeValue / 100) as int) * 100;
    return 0;
  }

  Area? parent;
}

class Nation extends Area {
  Nation() : super(code: '000000', name: '全国');
}

class Province extends Area {
  Province({required super.code, required super.name});
}

class City extends Area {
  City({required super.code, required super.name});
}

class County extends Area {
  County({required super.code, required super.name});
}
