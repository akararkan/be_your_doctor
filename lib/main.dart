import 'package:flutter/material.dart';

import 'TabbedPage.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Be Your Doctor',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: TabbedPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}