import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsArticleView extends StatefulWidget {
  final String articleUrl;
  const NewsArticleView({Key? key, required this.articleUrl}) : super(key: key);

  @override
  State<NewsArticleView> createState() => _NewsArticleViewState();
}

class _NewsArticleViewState extends State<NewsArticleView> {

  final Completer<WebViewController> _completer = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('top', style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.white
            ),),
            Text('news', style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.black
            ),)
          ],),
        elevation: 0.0,
        actions: <Widget>[
          Opacity(opacity: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: const Icon(Icons.add),
          ),)
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: widget.articleUrl ,
          onWebViewCreated: ((WebViewController webViewController){
            _completer.complete(webViewController);
          }),
        ),
      )
    );
  }
}
