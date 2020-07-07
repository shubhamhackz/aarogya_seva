import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticlePage extends StatelessWidget {
  final String articleUrl;

  ArticlePage({this.articleUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: WebView(
          initialUrl: articleUrl,
          javascriptMode: JavascriptMode.unrestricted ,
        ),
      ),
    );
  }
}
