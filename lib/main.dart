import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'dart:io';
import 'views/taps.dart';
import 'views/login/login.dart';
import 'routes/Routes.dart' as prefix0;

void main() {
  // debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:  const Home(title:'测试'),
        theme: ThemeData(
          platform: TargetPlatform.iOS, //滑动切换页面
        ),
        //统一处理命名路由
        onGenerateRoute: prefix0.onGenerateRoute);
  }
}

class Home extends StatelessWidget {
  const Home({Key? key, required String? title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, // 不显示右上角的 debug
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // 注册路由表
        routes: {
          "/": (context) => const Login(), // 首页路由
          "/login": (context) => const Tabs(), // 首页路由
        });
  }
}