//Routes.dart

import 'package:flutter/material.dart';
import 'package:jsca_xf_app/utils/Searchpage.dart';

//配置命名路由信息
final routes = {
  //如果需要传参，那么在配置的时候加上{arguments}；如果不需要传参，则不用加{arguments}
  "/search": (context, {arguments}) => Searchpage(
        arguments: arguments,
      ),
};

//统一处理命名路由
var onGenerateRoute = (RouteSettings settings) {
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
