import 'package:flutter/material.dart';

typedef OnNewStatus = void Function(String? newString);

/// 行业类型
class SelectorIndustry extends StatefulWidget {
  final String? initString;
  final OnNewStatus? onNewString;

  const SelectorIndustry({super.key, this.initString, this.onNewString});

  @override
  State<SelectorIndustry> createState() => _SelectorIndustryState();
}

class _SelectorIndustryState extends State<SelectorIndustry> {
  String? _industry;

  List<String?> get _industryValues => [null, ..._industries];

  Text _getText(String? s) => (s == null) ? const Text('请选择') : Text(s);

  @override
  Widget build(BuildContext context) {
    final dropdown = DropdownButton<String>(
      value: _industry,
      items: _industryValues
          .map<DropdownMenuItem<String>>(
            (value) => DropdownMenuItem<String>(
              value: value,
              child: _getText(value),
            ),
          )
          .toList(),
      onChanged: (value) async {
        setState(() {
          _industry = value;
        });

        final onChange = widget.onNewString;
        if (onChange != null) onChange(value);
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
