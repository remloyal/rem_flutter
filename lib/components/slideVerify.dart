import 'package:flutter/material.dart';

class SlideVerify extends StatefulWidget {
  const SlideVerify(
      {super.key,
      required this.refresh,
      required this.imgMain,
      required this.imgBlock,
      required this.success,
      required this.top,
      this.w,
      this.h});
  // DatePicker({Key key, this.onCancel, this.onSure}) : super(key: key);
  // 正确比对
  final Function success;
  // 重新请求
  final Function refresh;
  // 大图片
  final String imgMain;
  // 块图片
  final String imgBlock;
  // 块纵坐标
  final int top;
  // 原图片宽高，等比例缩放
  final int? w;
  final int? h;

  @override
  State<SlideVerify> createState() => _SlideVerifyState();
}

class _SlideVerifyState extends State<SlideVerify>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child:
          Column(children: [imageAssembly(context), sliderAssembly(context)]),
    );
  }

  // 图片组件
  Widget imageAssembly(BuildContext context) {
    return const Text('111');
  }

  // 滑块
  Widget sliderAssembly(BuildContext context) {
    return const Text('111');
  }
}
