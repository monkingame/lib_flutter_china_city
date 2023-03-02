/// 地区类
abstract class Area {
  final String code;
  final String name;

  // TODO: 一传参就获值 并判断类型，避免动态计算，并且判断数据格式正确性
  Area({required this.code, required this.name});

  int get codeValue => int.parse(code);

  // abstract List<Area> children;
  final List<Area> children = [];

  void add(Area child) => children.add(child);

  void sort() => children.sort(((a, b) => a.codeValue.compareTo(b.codeValue)));

  // @Deprecated('用静态函数isNationCode')
  // bool get isNation => codeValue == 0;
  // bool get isProvince => codeValue % 10000 == 0;
  // bool get isCity => !isProvince && (codeValue % 100 == 0);
  // bool get isCounty => codeValue % 100 != 0;

  static bool isNationCode(int value) => value == 0;
  static bool isProvinceCode(int value) => value % 10000 == 0;
  static bool isCityCode(int value) =>
      !isProvinceCode(value) && (value % 100 == 0);
  static bool isCountyCode(int value) => value % 100 != 0;

  int get parentCodeValue {
    // if (isNation) return 0;
    // if (isProvince) return 0;
    // if (isCity) return ((codeValue / 10000) as int) * 10000;
    // if (isCounty) return ((codeValue / 100) as int) * 100;

    if (isNationCode(codeValue)) return 0;
    if (isProvinceCode(codeValue)) return 0;
    if (isCityCode(codeValue)) return (codeValue ~/ 10000) * 10000;
    if (isCountyCode(codeValue)) return (codeValue ~/ 100) * 100;

    return 0;
  }

  String get parentCode => parentCodeValue.toString().padRight(6, '0');

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
