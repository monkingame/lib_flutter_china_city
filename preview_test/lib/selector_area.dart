import 'package:flutter/material.dart';

import 'area_analyzer.dart';
import 'area_selected.dart';

typedef OnNewArea = void Function(AreaSelected newArea);

/// 行业类型
class SelectorArea extends StatefulWidget {
  final String? topAreaName;
  final OnNewArea? onNewArea;

  const SelectorArea({super.key, this.topAreaName, this.onNewArea});

  @override
  State<SelectorArea> createState() => _SelectorAreaState();
}

class _SelectorAreaState extends State<SelectorArea> {
  final nation = AreaAnalyzer.analyzeNation();

  List<String> _provinceNames = [];
  List<String> _cityNames = [];
  List<String> _countyNames = [];

  String? _provinceName;
  String? _cityName;
  String? _countyName;

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
          _cityNames = [];
          _countyName = null;
          _countyNames = [];

          _provinceName = value;

          if (_provinceName != null) {
            final province = nation.findByName(_provinceName);
            if (province != null) {
              final cities = province.children;
              _cityNames = cities.map((c) => c.name).toList();
            }
          }
        });

        _doChange();
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
          _countyName = null;
          _countyNames = [];

          _cityName = value;

          if (_cityName != null) {
            final city = nation.findByName(_cityName);
            if (city != null) {
              final counties = city.children;
              _countyNames = counties.map((c) => c.name).toList();
            }
          }
        });

        _doChange();
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

        _doChange();
      },
    );

    return DropdownButtonHideUnderline(child: dropdown);
  }

  void _doChange() {
    final onChange = widget.onNewArea;
    if (onChange == null) return;

    final selected = AreaSelected(
      province: nation.findProvince(_provinceName),
      city: nation.findCity(_provinceName, _cityName),
      county: nation.findCounty(_provinceName, _cityName, _countyName),
    );

    print(selected);

    // onChange(selected);
  }
}
