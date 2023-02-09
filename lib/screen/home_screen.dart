import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  WebViewController? controller;

  HomeScreen({Key? key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Juhan\'s Blog'),
        centerTitle: true, //false라면 타이틀이 왼쪽으로 정렬이됨
        leading: IconButton(
          onPressed: () {
            if(controller != null) {
              controller!.goBack();
            }
          },
          icon: Icon(
            Icons.arrow_back_outlined,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if(controller != null) {
                controller!.loadUrl('https://blog.naver.com/iiiamst');
              }
            },
            icon: Icon(
              Icons.home,
            ),
          )
        ],
      ),
      body: WebView(
        onWebViewCreated: (WebViewController controller) {
          this.controller = controller;
        },
        initialUrl: 'https://blog.naver.com/iiiamst',
        javascriptMode: JavascriptMode.unrestricted
      )
    );
  }
}