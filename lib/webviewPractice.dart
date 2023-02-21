// import 'package:flutter/material.dart';
// // import 'dart:io';
// import 'package:webview_flutter/webview_flutter.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//         home: Scaffold(
//       body: SafeArea(child: MyWebView()),
//     ));
//   }
// }

// class MyWebView extends StatefulWidget {
//   const MyWebView({super.key});

//   @override
//   State<MyWebView> createState() => _MyWebViewState();
// }

// class _MyWebViewState extends State<MyWebView> {
//   late final WebViewController controller;
//   double height = 0;
//   @override
//   void initState() {
//     controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setBackgroundColor(const Color(0x00000000))
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onProgress: (int progress) {
//             // Update loading bar.
//           },
//           onPageStarted: (String url) {},
//           onPageFinished: (String url) {},
//           onWebResourceError: (WebResourceError error) {},
//           onNavigationRequest: (NavigationRequest request) {
//             if (request.url.startsWith('https://fanyi.baidu.com/')) {
//               return NavigationDecision.prevent;
//             }
//             return NavigationDecision.navigate;
//           },
//         ),
//       )
//       ..loadRequest(Uri.parse('http://150.158.34.247:5173/dist/'));
//     // ..loadHtmlString('assets/dist/index.html');
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [Expanded(child: WebViewWidget(controller: controller))],
//     );
//   }
// }
