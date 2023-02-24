import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';
import '../../components/slideVerify.dart';

typedef VoidSuccessCallback = dynamic Function(String v);

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  late String _email, _password;
  bool _isObscure = true;
  Color _eyeColor = Colors.grey;

  // 倒计时
  late Timer _timer;
  int _countdownTime = 0;

  final List _loginMethod = [
    {
      "title": "facebook",
      "icon": Icons.facebook,
    },
    {
      "title": "google",
      "icon": Icons.fiber_dvr,
    },
    {
      "title": "twitter",
      "icon": Icons.account_balance,
    },
  ];
  final String imageUrl = 'lib/assets/images/bg-login.png';

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size);
    ScreenUtil.init(context,
        designSize: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height));
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width.w,
            height: MediaQuery.of(context).size.height.h,
            // margin: const EdgeInsets.all(50.0),
            padding: const EdgeInsets.only(top: 40),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 0, 0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: ExactAssetImage('lib/assets/images/bg-login.png'),
              ),
            ),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // verticalDirection:,
                    // mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const <Widget>[
                      Image(
                        image: AssetImage("lib/assets/images/logo1.png"),
                        width: 100,
                      )
                    ],
                  ),
                  const Text(
                    '智慧消防系统',
                    // maxLines: 100,
                    style: TextStyle(
                        fontSize: 28,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  const Text(
                    '移动版',
                    style: TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 10),
                    child: Text(
                      '欢迎登录',
                      style: TextStyle(
                          fontSize: 30,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                  Container(
                      // height: 400.h,
                      width: 350.w,
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      ),
                      child: Column(
                        children: [
                          Form(
                            key: _formKey, // 设置globalKey，用于后面获取FormStat
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: Column(
                              // padding: const EdgeInsets.symmetric(horizontal: 20),
                              children: [
                                buildPhoneTextField(), // 输入手机号
                                // const SizedBox(height: 30),
                                buildUnitTextField(), // 输入密码
                                buildCodeTextField(context),
                                // const SizedBox(height: 30),
                                buildLoginButton(context), // 登录按钮
                                // const SizedBox(height: 40),
                                buildRegisterText(context), // 注册
                                // const Spacer(),
                              ],
                            ),
                          ),
                        ],
                      )),
                ]))));
  }

  Widget buildRegisterText(context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('没有账号?'),
            GestureDetector(
              child: const Text('点击注册', style: TextStyle(color: Colors.green)),
              onTap: () {
                print("点击注册");
              },
            )
          ],
        ),
      ),
    );
  }

  Widget buildOtherMethod(context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: _loginMethod
          .map((item) => Builder(builder: (context) {
                return IconButton(
                    icon: Icon(item['icon'],
                        color: Theme.of(context).iconTheme.color),
                    onPressed: () {
                      //TODO: 第三方登录方法
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('${item['title']}登录'),
                            action: SnackBarAction(
                              label: '取消',
                              onPressed: () {},
                            )),
                      );
                    });
              }))
          .toList(),
    );
  }

  Widget buildOtherLoginText() {
    return const Center(
      child: Text(
        '其他账号登录',
        style: TextStyle(color: Colors.grey, fontSize: 14),
      ),
    );
  }

  Widget buildLoginButton(BuildContext context) {
    return Align(
      child: SizedBox(
        height: 45,
        width: 270,
        child: ElevatedButton(
          style: ButtonStyle(
              // 设置圆角
              shape: MaterialStateProperty.all(const StadiumBorder(
                  side: BorderSide(style: BorderStyle.none)))),
          child:
              Text('登录', style: Theme.of(context).primaryTextTheme.headline5),
          onPressed: () {
            // 表单校验通过才会继续执行
            if ((_formKey.currentState as FormState).validate()) {
              (_formKey.currentState as FormState).save();
              //TODO 执行登录方法
              print('email: $_email, password: $_password');
            }
          },
        ),
      ),
    );
  }

  Widget buildPhoneTextField() {
    return Container(
        width: 320.w,
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(245, 245, 245, 245),
          borderRadius: const BorderRadius.all(Radius.circular(25.0)),
          border: Border.all(
              width: 1, color: const Color.fromARGB(245, 245, 245, 245)),
        ),
        child: Flex(direction: Axis.horizontal, children: <Widget>[
          const Expanded(
            flex: 1,
            child: Icon(
              IconData(0xe6df, fontFamily: 'iconfont'),
              color: Colors.red,
            ),
          ),
          Expanded(
              flex: 4,
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: "您的手机号",
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none),
                validator: (v) {
                  var emailReg = RegExp(
                      r"[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?");
                  if (!emailReg.hasMatch(v!)) {
                    return '请输入正确的手机号';
                  }
                  return null;
                },
                onSaved: (v) => _email = v!,
              )),
          // const Expanded(
          //   flex: 1,
          //   child: Icon(
          //     IconData(0xe6df, fontFamily: 'iconfont'),
          //   ),
          // ),
        ]));
  }

  Widget buildUnitTextField() {
    return Container(
        width: 320.w,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: const Color.fromARGB(245, 245, 245, 245),
          borderRadius: const BorderRadius.all(Radius.circular(25.0)),
          border: Border.all(
              width: 1, color: const Color.fromARGB(245, 245, 245, 245)),
        ),
        child: Flex(direction: Axis.horizontal, children: <Widget>[
          const Expanded(
            flex: 1,
            child: Icon(
              IconData(0xe62c, fontFamily: 'iconfont'),
              color: Colors.red,
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
                height: 40.0,
                width: 100,
                // color: Colors.green,
                child: const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    '请输入单位识别码',
                    style: TextStyle(
                      color: Color.fromARGB(152, 152, 152, 152),
                      fontSize: 18,
                      height: 1.2,
                      fontFamily: "Courier",
                      // decoration: TextDecoration.underline,
                      // decorationStyle: TextDecorationStyle.dashed
                    ),
                  ),
                )),
          ),
          const Expanded(
            flex: 1,
            child: Icon(
              IconData(0xe633, fontFamily: 'iconfont'),
              color: Color.fromARGB(97, 24, 24, 24),
              size: 18,
            ),
          ),
        ]));
  }

  Widget buildCodeTextField(BuildContext context) {
    return Container(
        width: 320.w,
        margin: const EdgeInsets.only(bottom: 10),
        padding: _countdownTime > 0
            ? const EdgeInsets.only(left: 4)
            : const EdgeInsets.only(left: 8),
        decoration: BoxDecoration(
          color: const Color.fromARGB(245, 245, 245, 245),
          borderRadius: const BorderRadius.all(Radius.circular(25.0)),
          border: Border.all(
              width: 1, color: const Color.fromARGB(245, 245, 245, 245)),
        ),
        child: Flex(direction: Axis.horizontal, children: <Widget>[
          const Expanded(
            flex: 1,
            child: Icon(
              IconData(0xe624, fontFamily: 'iconfont'),
              color: Colors.red,
            ),
          ),
          Expanded(
              flex: 4,
              child: TextFormField(
                enabled: _countdownTime > 0 ? true : false,
                decoration: const InputDecoration(
                    hintText: "验证码",
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none),
                // obscureText: _isObscure, // 是否显示文字
                onSaved: (v) => _password = v!,
                validator: (v) {
                  if (v!.isEmpty) {
                    return '请输入验证码';
                  }
                },
              )),
          Expanded(
            flex: _countdownTime > 0 ? 1 : 2,
            child: GestureDetector(
              child: Text(_countdownTime > 0 ? '$_countdownTime' : '获取验证码'),
              onTap: () {
                print('获取验证码');
                if (_countdownTime == 0) {
                  //Http请求发送验证码
                  setState(() {
                    _countdownTime = 60;
                  });
                  //开始倒计时
                  startCountdownTimer();
                }
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Center(heightFactor: 1, child: Text("提示")),
                      content: Center(
                          heightFactor: 1,
                          child: SlideVerify(
                            imgBlock: '222',
                            imgMain: '222222222',
                            success: success,
                            refresh: refresh,
                            top: 222,
                          )),
                      // actions: [
                      // TextButton(
                      //   onPressed: () {
                      //     Navigator.of(context).pop();
                      //   },
                      //   child: const Text("取消"),
                      // ),
                      // TextButton(onPressed: () {}, child: const Text("确定")),
                      // ],
                    );
                  },
                );
              },
            ),
          ),
        ]));
  }

  // 图片验证正确
  success() {
    print('success 22222222');
  }

  // 重新请求
  refresh() {
    print('refresh 22222222');
  }

  void startCountdownTimer() {
    const oneSec = Duration(seconds: 1);

    callback(timer) => {
          setState(() {
            if (_countdownTime < 1) {
              _timer.cancel();
            } else {
              _countdownTime = _countdownTime - 1;
            }
          })
        };
    _timer = Timer.periodic(oneSec, callback);
  }

  Widget buildPasswordTextField(BuildContext context) {
    return Container(
        width: 320,
        height: 60,
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(245, 245, 245, 245),
          borderRadius: const BorderRadius.all(Radius.circular(25.0)),
          border: Border.all(
              width: 1, color: const Color.fromARGB(245, 245, 245, 245)),
        ),
        child: Flex(direction: Axis.horizontal, children: <Widget>[
          const Expanded(
            flex: 2,
            child: Icon(
              IconData(0xe62c, fontFamily: 'iconfont'),
            ),
          ),
          Expanded(
              flex: 4,
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: "验证码",
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    errorText: "",
                    filled: false,
                    focusedBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none),
                // obscureText: _isObscure, // 是否显示文字
                onSaved: (v) => _password = v!,
                validator: (v) {
                  if (v!.isEmpty) {
                    return '请输入验证码';
                  }
                },
              )),
          Expanded(
              flex: 2,
              child: RichText(
                text: TextSpan(
                    text: '获取验证码',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print('object  获取验证码');
                      }),
              )),
        ]));
  }

  Widget buildTitleLine() {
    return Padding(
        padding: const EdgeInsets.only(left: 12.0, top: 4.0),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            color: Colors.black,
            width: 40,
            height: 2,
          ),
        ));
  }

  Widget buildTitle() {
    return const Padding(
        padding: EdgeInsets.all(8),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 42),
        ));
  }
}
