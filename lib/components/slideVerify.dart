import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  final double? w;
  final double? h;

  @override
  State<SlideVerify> createState() => _SlideVerifyState();
}

class _SlideVerifyState extends State<SlideVerify>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final GlobalKey _keyImg = GlobalKey();
  double width = 300;
  double height = 150;

  double sliderStartX = 0; //滑块未拖前的X坐标
  double sliderStartY = 0; //滑块未拖前的Y坐标
  double sliderXMoved = 0;
  bool sliderMoveFinish = false; //滑块拖动结束
  bool checkResultAfterDrag = false; //拖动后的校验结果
  double sliderDistance = 0;
  double initial = 0.0;

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
    print('$width$height');
    return Container(
      padding: const EdgeInsets.all(0),
      height: 200,
      child:
          Column(children: [imageAssembly(context), sliderAssembly(context)]),
    );
  }

  // 图片组件
  Widget imageAssembly(BuildContext context) {
    var _image =
        new Image.asset('lib/assets/images/ceshi.png', fit: BoxFit.cover);
    _image!.image
        .resolve(new ImageConfiguration())
        .addListener(ImageStreamListener((image, synchronousCall) {
      print('image   $image.image ');
      print('image $synchronousCall');
    }));
    return Stack(alignment: Alignment.center, children: [
      Container(
        key: _keyImg,
        width: 300,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.red,
          border: Border.all(
            color: Colors.red,
            width: 0.0,
          ),
        ),
        child: _image,
      ),
      Positioned(
        left: sliderStartX,
        top: 0,
        child: Image.asset(
          'lib/assets/images/logo.png',
        ),
      ),
    ]);
  }

  _getSize() {
    final RenderObject? renderBox = _keyImg.currentContext!.findRenderObject();
    // final sizeGreen = renderBox.renderBox;
    final sizeGreen = renderBox.size;
    print("SIZE of green: $sizeGreen");
  }

  // 滑块
  Widget sliderAssembly(BuildContext context) {
    return Container(
        height: 40,
        margin: const EdgeInsets.only(top: 8),
        width: 350,
        decoration: const BoxDecoration(
            // color: Colours.greyF7,
            borderRadius: BorderRadius.all(Radius.circular(132))),
        child: Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.centerStart,
            children: <Widget>[
              Container(
                // height: _bottomSliderSize,
                // width: sliderDistance < 1 ? 0 : sliderDistance + 140.w / 2,
                decoration: const BoxDecoration(
                    // gradient: LinearGradient(
                    //   begin: Alignment.centerLeft,
                    //   end: Alignment.centerRight,
                    //   colors: [
                    //     Color.fromARGB(255, 132, 188, 214),
                    //     Color.fromARGB(255, 0, 174, 255),
                    //   ],
                    // ),
                    color: Color.fromARGB(233, 199, 199, 199)),
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  '请向右拖动滑块完成拼图',
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
              ),
              Positioned(
                child: GestureDetector(
                    onPanStart: (startDetails) {
                      ///开始
                      ///
                      initial = startDetails.globalPosition.dx;
                      print(initial);
                      _getSize();
                      // _checkMilliseconds =
                      //     new DateTime.now().millisecondsSinceEpoch;
                      // print(startDetails.localPosition);
                      // sliderStartX = startDetails.localPosition.dx;
                    },
                    onPanUpdate: (updateDetails) {
                      ///更新
                      ///
                      // print(updateDetails.localPosition);
                      sliderDistance =
                          updateDetails.globalPosition.dx - initial;

                      setState(() {
                        //   sliderXMoved = offset;
                        if (sliderDistance >= 240) {
                          sliderStartX = 240;
                        } else if (sliderDistance < 0) {
                          sliderStartX = 0;
                        } else {
                          sliderStartX = sliderDistance;
                        }
                        // sliderStartX =
                        //     sliderDistance >= 300 ? 300 : sliderDistance;
                        print('sliderStartX:   $sliderDistance');
                      });
                      // if (sliderDistance < 0) {
                      //   sliderDistance = 0;
                      // }

                      // double _w1 = _baseImageKey.currentContext!.size!.width -
                      //     _slideImageKey.currentContext!.size!.width;

                      // double offset =
                      //     updateDetails.localPosition.dx - sliderStartX;
                      // if (offset < 0) {
                      //   offset = 0;
                      // }
                      // if (offset > _w1) {
                      //   print(offset > _w1);
                      //   offset = _w1;
                      // }
                      // print("offset ------ $offset");
                      // setState(() {
                      //   sliderXMoved = offset;
                      // });
                      //滑动过程，改变滑块左边框颜色
                      // updateSliderColorIcon();
                    },
                    onPanEnd: (endDetails) {
                      //结束
                      print("endDetails");
                      setState(() {
                        //   sliderXMoved = offset;
                        sliderStartX = 0;
                      });
                      // int _nowTime = new DateTime.now().millisecondsSinceEpoch;
                      // _checkMilliseconds = _nowTime - _checkMilliseconds;

                      // _checkMilliseconds / (60.0 * 12) > 60
                      //     ? checkFail()
                      //     : checkCaptcha(
                      //         sliderXMoved,
                      //       );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          width: sliderStartX,
                          decoration: const BoxDecoration(
                            // borderRadius: BorderRadius.all(
                            //     new Radius.circular(140.w / 2)),
                            color: Color.fromARGB(255, 26, 145, 249),
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 40,
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.all(
                            //     new Radius.circular(140.w / 2)),
                            color: const Color.fromARGB(255, 26, 145, 249),
                            border: Border.all(
                              color: Color.fromARGB(255, 255, 255, 255),
                              width: 0.0,
                            ),
                          ),
                          child: const Icon(
                            IconData(0xe633, fontFamily: 'iconfont'),
                            color: Color.fromARGB(255, 59, 59, 59),
                          ),
                        ),
                        // SizedBox(
                        //   width: 10.w,
                        // ),
                        // Container(
                        //   height: 38.w,
                        //   width: 6.w,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.all(
                        //         new Radius.circular(140.w / 2)),
                        //     color: Color(0xff3BBEFF),
                        //   ),
                        // ),
                      ],
                    )),
              )
            ]));
  }
}
