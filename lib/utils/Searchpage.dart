import 'package:flutter/material.dart';

class Searchpage extends StatelessWidget {
  final arguments; //用于接收命名路由传递过来的参数值
  const Searchpage({Key? key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //在最底层采取Scaffold组件
      appBar: AppBar(
        title: Text("搜索页面"),
      ),
      //获取命名路由传递过来的参数值
      body: Text(
          "Search Page!传递过来的参数值是：${arguments != null ? arguments['info'] : '默认值'}"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //返回上一级页面
          Navigator.of(context).pop();
        },
        child: Text("back"),
      ),
    );
  }
}
