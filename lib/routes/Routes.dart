//Routes.dart

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jsca_xf_app/utils/Searchpage.dart';

// import '../views/taps.dart';
// import '../views/login/login.dart';

//配置命名路由信息
final routes = {
  //如果需要传参，那么在配置的时候加上{arguments}；如果不需要传参，则不用加{arguments}
  "/search": (context, {arguments}) => Searchpage(
        arguments: arguments,
      ),
};

//统一处理命名路由
var onGenerateRoute = (RouteSettings settings) {
  print(settings);
  final String? name = settings.name;
  final Function pageContentBuilder = routes[name] as Function;
  if (pageContentBuilder != null) {
    //能寻找到对应的路由
    if (settings.arguments != null) {
      //页面跳转前有传参
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      //页面跳转前没有传参
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};

// List<Map<String, dynamic>> Routes() {
//   return [
//     {
//       "path": "/",
//       "view": const Login(),
//     },
//     {
//       "path": "/login",
//       "view": const Tabs(),
//     },
// //    //嵌套路由示例
// //     {
// //    //上层路由无需view
// //       "path":"/busManage",
// //       "children":[
// //          //匹配规则为"/busManage/demo1"
// //         {
// //           "path":"/demo1",
// //           "view":Demo1()
// //         },{
// //          //匹配规则为"/busManage/demo2/demo3"
// //           "path":"/demo2",
// //           "children":[
// //             {
// //               "path":"/demo3",
// //               "view":Demo3()
// //             }
// //           ]
// //         },
// //       ]
// //     }
//   ];
// }
