import 'package:flutter/material.dart';

import 'area_analyzer.dart';

typedef OnNewStatus = void Function(String? newString);

/// 行业类型
class SelectorArea extends StatefulWidget {
  final String? initString;
  final OnNewStatus? onNewString;

  const SelectorArea({super.key, this.initString, this.onNewString});

  @override
  State<SelectorArea> createState() => _SelectorAreaState();
}

class _SelectorAreaState extends State<SelectorArea> {
  final nation = AreaAnalyzer.analyzeNation();

  List<String> _provinceNames = [];
  List<String> _cityNames = [];
  List<String> _countyNames = [];

  // String? _industry;
  String? _provinceName;
  String? _cityName;
  String? _countyName;

  // List<String?> get _industryValues => [null, ..._industries];

  List<String?> get _provinceDropNames => [null, ..._provinceNames];
  List<String?> get _cityDropNames => [null, ..._cityNames];
  List<String?> get _countyDropNames => [null, ..._countyNames];

  Text _getText(String? s) => (s == null) ? const Text('请选择') : Text(s);

  @override
  void initState() {
    final provinces = nation.allProvinces.values.toList();
    provinces.sort((a, b) => a.value.compareTo(b.value));
    _provinceNames = provinces.map((p) => p.name).toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final row = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildProvince(),
        _buildCity(),
        _buildCounty(),
      ],
    );
    return row;
  }

  Widget _buildProvince() {
    final dropdown = DropdownButton<String>(
      value: _provinceName,
      items: _provinceDropNames
          .map<DropdownMenuItem<String>>(
            (value) => DropdownMenuItem<String>(
              value: value,
              child: _getText(value),
            ),
          )
          .toList(),
      onChanged: (value) async {
        setState(() {
          _cityName = null;
          _countyName = null;
          _cityNames = [];
          _countyNames = [];

          _provinceName = value;

          if (_provinceName != null) {
            // print(_provinceName);
            // final province = nation.allProvinces[_provinceName];
            final province = nation.findByName(_provinceName);
            if (province != null) {
              final cities = province.children;
              _cityNames = cities.map((c) => c.name).toList();
            }
          } else {
            _cityName = null;
            _countyName = null;
            _cityNames = [];
            _countyNames = [];
          }
        });

        // print(_cityNames);

        // final onChange = widget.onNewString;
        // if (onChange != null) onChange(value);
      },
    );

    return DropdownButtonHideUnderline(child: dropdown);
  }

  Widget _buildCity() {
    final dropdown = DropdownButton<String>(
      value: _cityName,
      items: _cityDropNames
          .map<DropdownMenuItem<String>>(
            (value) => DropdownMenuItem<String>(
              value: value,
              child: _getText(value),
            ),
          )
          .toList(),
      onChanged: (value) async {
        setState(() {
          _cityName = value;

          if (_cityName != null) {
          } else {
            _countyName = null;
            _countyNames = [];
          }
        });

        // final onChange = widget.onNewString;
        // if (onChange != null) onChange(value);
      },
    );

    return DropdownButtonHideUnderline(child: dropdown);
  }

  Widget _buildCounty() {
    final dropdown = DropdownButton<String>(
      value: _countyName,
      items: _countyDropNames
          .map<DropdownMenuItem<String>>(
            (value) => DropdownMenuItem<String>(
              value: value,
              child: _getText(value),
            ),
          )
          .toList(),
      onChanged: (value) async {
        setState(() {
          _countyName = value;
        });

        // final onChange = widget.onNewString;
        // if (onChange != null) onChange(value);
      },
    );

    return DropdownButtonHideUnderline(child: dropdown);
  }
}

// const _industries = [
//   '国有企业',
//   '省委市委',
//   '纪委',
//   '政法',
//   '发改委',
//   '教育',
//   '科学技术',
//   '工业和信息化',
//   '公安',
//   '交警',
//   '高速交警',
//   '民政',
//   '司法',
//   '税务',
//   '人力资源和社会保障',
//   '国土海洋',
//   '生态环境',
//   '住建',
//   '交通运输',
//   '水利水务',
//   '农业农村',
//   '文化和旅游',
//   '卫生健康',
//   '应急管理',
//   '审计',
//   '国资委',
//   '市场监督管理局',
//   '大数据局',
//   '其他',
// ];
