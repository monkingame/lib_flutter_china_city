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

  List<String> _provinces = [];
  List<String> _cities = [];
  List<String> _counties = [];

  String? _industry;
  String? _currProvince;
  String? _currCity;
  String? _currCounty;

  List<String?> get _industryValues => [null, ..._industries];

  List<String?> get _provinceValues => [null, ..._provinces];
  List<String?> get _cityValues => [null, ..._cities];
  List<String?> get _countyValues => [null, ..._counties];

  Text _getText(String? s) => (s == null) ? const Text('请选择') : Text(s);

  @override
  Widget build(BuildContext context) {
    // final dropdown = DropdownButton<String>(
    //   value: _industry,
    //   items: _industryValues
    //       .map<DropdownMenuItem<String>>(
    //         (value) => DropdownMenuItem<String>(
    //           value: value,
    //           child: _getText(value),
    //         ),
    //       )
    //       .toList(),
    //   onChanged: (value) async {
    //     setState(() {
    //       _industry = value;
    //     });

    //     final onChange = widget.onNewString;
    //     if (onChange != null) onChange(value);
    //   },
    // );

    // return DropdownButtonHideUnderline(child: dropdown);

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
      value: _currProvince,
      items: _provinceValues
          .map<DropdownMenuItem<String>>(
            (value) => DropdownMenuItem<String>(
              value: value,
              child: _getText(value),
            ),
          )
          .toList(),
      onChanged: (value) async {
        setState(() {
          _currProvince = value;
        });

        // final onChange = widget.onNewString;
        // if (onChange != null) onChange(value);
      },
    );

    return DropdownButtonHideUnderline(child: dropdown);
  }

  Widget _buildCity() {
    final dropdown = DropdownButton<String>(
      value: _currCity,
      items: _cityValues
          .map<DropdownMenuItem<String>>(
            (value) => DropdownMenuItem<String>(
              value: value,
              child: _getText(value),
            ),
          )
          .toList(),
      onChanged: (value) async {
        setState(() {
          _currCity = value;
        });

        // final onChange = widget.onNewString;
        // if (onChange != null) onChange(value);
      },
    );

    return DropdownButtonHideUnderline(child: dropdown);
  }

  Widget _buildCounty() {
    final dropdown = DropdownButton<String>(
      value: _currCounty,
      items: _countyValues
          .map<DropdownMenuItem<String>>(
            (value) => DropdownMenuItem<String>(
              value: value,
              child: _getText(value),
            ),
          )
          .toList(),
      onChanged: (value) async {
        setState(() {
          _currCounty = value;
        });

        // final onChange = widget.onNewString;
        // if (onChange != null) onChange(value);
      },
    );

    return DropdownButtonHideUnderline(child: dropdown);
  }
}

const _industries = [
  '国有企业',
  '省委市委',
  '纪委',
  '政法',
  '发改委',
  '教育',
  '科学技术',
  '工业和信息化',
  '公安',
  '交警',
  '高速交警',
  '民政',
  '司法',
  '税务',
  '人力资源和社会保障',
  '国土海洋',
  '生态环境',
  '住建',
  '交通运输',
  '水利水务',
  '农业农村',
  '文化和旅游',
  '卫生健康',
  '应急管理',
  '审计',
  '国资委',
  '市场监督管理局',
  '大数据局',
  '其他',
];
