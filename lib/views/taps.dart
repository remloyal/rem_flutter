import 'package:flutter/material.dart';
import 'home/HomePage.dart';
import '../components/IconFont.dart';

//Tabs.dart
class Tabs extends StatefulWidget {
  final int currentIndex; //1，定义传值参数
  const Tabs({key, this.currentIndex = 0}) : super(key: key); //2，重新写构造函数

  _TabsState createState() =>
      _TabsState(this.currentIndex); //3，将参数值传递给_TabsState
}

class _TabsState extends State<Tabs> {
  int _tabIndex; //4，定义传值参数
  List _pageList = [HomePage(), HomePage(), HomePage(), HomePage(), HomePage()];

  _TabsState(this._tabIndex); //5，重新写构造函数

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("AppBarTitle"),
      // ),
      //6，获取到传递过来的值,并使用
      body: _pageList[_tabIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        fixedColor: Colors.pink,
        currentIndex: _tabIndex,
        onTap: (int index) {
          setState(() {
            _tabIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                IconData(0xe613, fontFamily: 'iconfont'),
                size: 24,
              ),
              label: '综合'),
          BottomNavigationBarItem(
              icon: Icon(
                IconData(0xe656, fontFamily: 'iconfont'),
                size: 24,
              ),
              label: '巡检'),
          BottomNavigationBarItem(
              icon: Icon(
                IconData(0xe638, fontFamily: 'iconfont'),
                size: 24,
              ),
              label: '告警'),
          BottomNavigationBarItem(
              icon: Icon(
                IconData(0xe603, fontFamily: 'iconfont'),
                size: 24,
              ),
              label: '设备'),
          BottomNavigationBarItem(
              icon: Icon(
                IconData(0xe6df, fontFamily: 'iconfont'),
                size: 24,
              ),
              label: '我的'),
        ],
      ),
    );
  }
}
