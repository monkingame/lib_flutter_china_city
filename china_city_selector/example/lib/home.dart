import 'package:flutter/material.dart';

import 'city_util.dart';

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
            CityUtil.analyze();
          },
          child: const Text('test'),
        ),
      ),
    );
  }
}
