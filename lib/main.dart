import 'package:flutter/material.dart';
// import 'dart:io';
import 'views/login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/", // 默认加载的界面，这里为RootPage
      routes: {
        // 显式声明路由
        // "/":(context) => RootPage(),
        "/A": (context) => const Login(),
        "/B": (context) => const Login(),
        "/C": (context) => const Login(),
      },
      home: const Login(),
    );
  }
}
