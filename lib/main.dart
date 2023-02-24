import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter/rendering.dart';
// import 'dart:io';
import 'views/taps.dart';
import 'views/login/login.dart';
import 'routes/routes.dart' as prefix0;

void main() async {
  // debugPaintSizeEnabled = true;
  ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(context, designSize: const Size(750, 1334));
    return MaterialApp(
        // home: const Home(title: '测试'),
        theme: ThemeData(
          platform: TargetPlatform.iOS, //滑动切换页面
        ),
        routes: {
          "/": (context) => const Login(), // 首页路由
          "/login": (context) => const Tabs(), // 首页路由
        },
        initialRoute: '/',
        //统一处理命名路由
        onGenerateRoute: prefix0.onGenerateRoute);
  }
}
