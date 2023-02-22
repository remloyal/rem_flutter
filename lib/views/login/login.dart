import 'package:flutter/material.dart';

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
  final String imageUrl = 'lib/asset/images/bg-login.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            // margin: const EdgeInsets.all(50.0),
            padding: const EdgeInsets.only(top: 50),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: ExactAssetImage('lib/asset/images/bg-login.png'),
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
                        image: AssetImage("lib/asset/images/logo1.png"),
                        width: 100.0,
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
                  SizedBox(
                    height: 400,
                    width: 312,
                    child: Form(
                      key: _formKey, // 设置globalKey，用于后面获取FormStat
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        // padding: const EdgeInsets.symmetric(horizontal: 20),
                        children: [
                          // const Spacer(),
                          buildPhoneTextField(), // 输入手机号
                          // const SizedBox(height: 30),
                          buildPasswordTextField(context), // 输入密码
                          buildCodeTextField(context),
                          // buildForgetPasswordText(context), // 忘记密码
                          const SizedBox(height: 30),
                          buildLoginButton(context), // 登录按钮
                          // const SizedBox(height: 40),
                          buildRegisterText(context), // 注册
                          // const Spacer(),
                        ],
                      ),
                    ),
                  )
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

  Widget buildForgetPasswordText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () {
            // Navigator.pop(context);
            print("忘记密码");
          },
          child: const Text("忘记密码？",
              style: TextStyle(fontSize: 14, color: Colors.grey)),
        ),
      ),
    );
  }

  Widget buildPhoneTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: '手机号',
        hintText: "您的手机号",
        icon: Icon(
          IconData(0xe6df, fontFamily: 'iconfont'),
          size: 24,
          color: Color.fromARGB(255, 255, 4, 0),
        ),
      ),
      validator: (v) {
        var emailReg = RegExp(
            r"[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?");
        if (!emailReg.hasMatch(v!)) {
          return '请输入正确的手机号';
        }
      },
      onSaved: (v) => _email = v!,
    );
  }

  Widget buildCodeTextField(BuildContext context) {
    return TextFormField(
        obscureText: _isObscure, // 是否显示文字
        onSaved: (v) => _password = v!,
        validator: (v) {
          if (v!.isEmpty) {
            return '请选择单位';
          }
        },
        // enabled: false,
        onTap: () {
          print('object');
        },
        decoration: InputDecoration(
            labelText: "",
            icon: const Icon(
              IconData(0xe624, fontFamily: 'iconfont'),
              size: 24,
              color: Color.fromARGB(255, 255, 4, 0),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: _eyeColor,
              ),
              onPressed: () {
                // 修改 state 内部变量, 且需要界面内容更新, 需要使用 setState()
                setState(() {
                  _isObscure = !_isObscure;
                  _eyeColor = (_isObscure
                      ? Colors.grey
                      : Theme.of(context).iconTheme.color)!;
                });
              },
            )));
  }

  Widget buildPasswordTextField(BuildContext context) {
    return TextFormField(
        obscureText: _isObscure, // 是否显示文字
        onSaved: (v) => _password = v!,
        validator: (v) {
          if (v!.isEmpty) {
            return '请输入密码';
          }
        },
        decoration: InputDecoration(
            labelText: "",
            icon: const Icon(
              IconData(0xe62c, fontFamily: 'iconfont'),
              size: 24,
              color: Color.fromARGB(255, 255, 4, 0),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: _eyeColor,
              ),
              onPressed: () {
                // 修改 state 内部变量, 且需要界面内容更新, 需要使用 setState()
                setState(() {
                  _isObscure = !_isObscure;
                  _eyeColor = (_isObscure
                      ? Colors.grey
                      : Theme.of(context).iconTheme.color)!;
                });
              },
            )));
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

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
// Form(
//         key: _formKey, // 设置globalKey，用于后面获取FormStat
//         autovalidateMode: AutovalidateMode.onUserInteraction,
//         child: ListView(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           children: [
//             const Spacer(),
//             const SizedBox(height: kToolbarHeight), // 距离顶部一个工具栏的高度
//             buildTitle(), // Login
//             buildTitleLine(), // Login下面的下划线
//             const SizedBox(height: 60),
//             buildEmailTextField(), // 输入邮箱
//             const SizedBox(height: 30),
//             buildPasswordTextField(context), // 输入密码
//             buildForgetPasswordText(context), // 忘记密码
//             const SizedBox(height: 60),
//             buildLoginButton(context), // 登录按钮
//             const SizedBox(height: 40),
//             buildOtherLoginText(), // 其他账号登录
//             buildOtherMethod(context), // 其他登录方式
//             buildRegisterText(context), // 注册
//             const Spacer(),
//           ],
//         ),
//       ),
