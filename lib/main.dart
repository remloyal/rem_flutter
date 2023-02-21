import 'package:flutter/material.dart';
// import 'dart:io';
import 'views/taps.dart';
// import 'views/login/login.dart';
import 'routes/Routes.dart' as prefix0;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Tabs(),
        //统一处理命名路由
        onGenerateRoute: prefix0.onGenerateRoute);
  }
}
