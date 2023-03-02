/// 县
class County {
  County({required this.code, required this.name});

  final String code;
  final String name;
}

/// 市
class City {
  City({required this.code, required this.name});

  final String code;
  final String name;

  final List<County> counties = [];
}

/// 省
class Province {
  Province({required this.code, required this.name});

  final String code;
  final String name;

  final List<City> cities = [];
}

/// 全国
class WholeNation {
  final List<Province> provinces = [];
}
