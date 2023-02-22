import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设备管理"),
      ),
      body: const Center(
        child: Text("This is new route"),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '测试页面',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('测试页面222'),
        ),
        body: Center(
          child: TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return NewRoute();
              }));
            },
            child: const Text("open new route"),
          ),
        ),
      ),
    );
  }
}
