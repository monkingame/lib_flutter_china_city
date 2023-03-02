import 'package:flutter/material.dart';

import 'area_analyzer.dart';

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
      body: Center(
        child: OutlinedButton(
          onPressed: () async {
            // print(chinaCities);
            final nation = AreaAnalyzer.analyzeNation();
            print(nation);
            // print(nation.children);
          },
          child: const Text('test'),
        ),
      ),
    );
  }
}
