import 'package:flutter/material.dart';

import 'area_analyzer.dart';
import 'area_result.dart';
import 'selector_area.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('china cities')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: OutlinedButton(
              onPressed: () async {
                // print(chinaCities);
                final nation = AreaAnalyzer.analyzeNation();
                // print(nation);
                // print(nation.children);
                final provinces = nation.allProvinces.values.toList();
                provinces.sort((a, b) => a.value.compareTo(b.value));
                // print(provinces);
              },
              child: const Text('test'),
            ),
          ),
          SelectorArea(
            onNewArea: (AreaResult newArea) async {
              print(newArea);
            },
          ),
        ],
      ),
    );
  }
}
