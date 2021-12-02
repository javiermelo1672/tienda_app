import 'package:flutter/material.dart';

import 'home/home_page.dart';
import 'home/login_simulator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: LoginSimulatorPage(),
    );
  }
}
