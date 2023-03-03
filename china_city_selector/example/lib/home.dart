import 'package:china_city_selector/area_analyzer.dart';
import 'package:china_city_selector/area_result.dart';
import 'package:china_city_selector/selector_area.dart';
import 'package:flutter/material.dart';

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
                final nation = AreaAnalyzer.analyzeNation();
                final provinces = nation.allProvinces.values.toList();
                provinces.sort((a, b) => a.value.compareTo(b.value));
                // print(provinces);
              },
              child: const Text('print all provinces'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: SelectorArea(
              onNewArea: (AreaResult newArea) async {
                print(newArea);
              },
            ),
          ),
        ],
      ),
    );
  }
}
