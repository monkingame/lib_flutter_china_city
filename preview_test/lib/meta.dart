@Deprecated('作废')

/// 县
class County {
  County({required this.code, required this.name});

  final String code;
  final String name;
}

@Deprecated('作废')

/// 市
class City {
  City({required this.code, required this.name});

  final String code;
  final String name;

  final List<County> counties = [];
}

@Deprecated('作废')

/// 省
class Province {
  Province({required this.code, required this.name});

  final String code;
  final String name;

  final List<City> cities = [];
}

@Deprecated('作废')

/// 全国
class Nation {
  final List<Province> provinces = [];
}
