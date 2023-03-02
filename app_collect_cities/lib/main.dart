import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: OutlinedButton(
          onPressed: _loadAssetFile,
          child: const Text('test'),
        ),
      ),
    );
  }

  void _loadAssetFile() async {
    final content =
        await rootBundle.loadString('assets/202012-china-cities.txt');
    // print(file);
    final lines = const LineSplitter().convert(content);
    print(lines.length);
    final Map<String, String> maps = {};

    for (String line in lines) {
      // print(line);
      final pure = line.trim();
      if (pure.isEmpty) continue;
      final items = pure.split(RegExp('\\s+'));
      // print(items);
      if (items.length != 2) {
        // print(items); 西沙区 南沙区
        continue;
      }
      maps[items[0].trim()] = items[1].trim();
    }

    print(maps.length);
  }
}
