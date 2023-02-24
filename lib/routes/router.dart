import 'package:flutter/material.dart';
import './routes.dart';

Map<String, Widget Function(BuildContext)> myRouter(BuildContext context) {
  Map<String, Widget Function(BuildContext)> router = {};
  List<Map<String, dynamic>> screenRoutes = [];
  for (var route in Routes()) {
    var path = route["path"];
    if (route["children"] != null) {
      TreeChildrenRouter(path, route["children"], screenRoutes);
    } else {
      router[route["path"]] = (context) => route["view"];
    }
  }
  for (var route in screenRoutes) {
    router[route["path"]] = (context) => route["view"];
  }
  return router;
}

TreeChildrenRouter(
    String path, List<Map> routes, List<Map<String, dynamic>> screenRoutes) {
  String rootPath = path;
  for (var route in routes) {
    path = rootPath + route["path"];
    if (route["children"] != null) {
      TreeChildrenRouter(path, route["children"], screenRoutes);
    } else {
      screenRoutes.add({"path": path, "view": route["view"]});
    }
  }
}

//统一处理命名路由
// var onGenerateRoute = (RouteSettings settings) {
//   print(settings);
//   final String? name = settings.name;
//   final Function pageContentBuilder = routes[name] as Function;
//   if (pageContentBuilder != null) {
//     //能寻找到对应的路由
//     if (settings.arguments != null) {
//       //页面跳转前有传参
//       final Route route = MaterialPageRoute(
//           builder: (context) =>
//               pageContentBuilder(context, arguments: settings.arguments));
//       return route;
//     } else {
//       //页面跳转前没有传参
//       final Route route =
//           MaterialPageRoute(builder: (context) => pageContentBuilder(context));
//       return route;
//     }
//   }
// };
