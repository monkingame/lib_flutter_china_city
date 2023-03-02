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

  // Area? get parent;

  bool get isProvince => codeValue % 10000 == 0;

  bool get isCity => !isProvince && (codeValue % 100 == 0);

  bool get isCounty => codeValue % 100 != 0;
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
