/// 地区类
abstract class Area {
  final String code;
  final String name;

  Area({required this.code, required this.name});

  int get codeValue => int.parse(code);

  // abstract List<Area> children;
  final List<Area> children = [];

  Area get parent;
}
