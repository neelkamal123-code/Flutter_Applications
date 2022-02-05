import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget{
  String blogUrl;
  ArticleView({required this.blogUrl});
  @override
  ArticleViewState createState() {
    // TODO: implement createState
    return ArticleViewState();
  }
}

class ArticleViewState extends State<ArticleView>{
  final Completer<WebViewController> completer = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black, onPressed: () {
            Navigator.pop(context);
        },
        ),
        actions: [],
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "News",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              "Pedia",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: WebView(
          initialUrl: widget.blogUrl,
          onWebViewCreated: ((WebViewController webviewcontrll){
            completer.complete(webviewcontrll);
          }),
        ),
      ),
    );
  }
}