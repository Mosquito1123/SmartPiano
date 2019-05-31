import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:convert';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/services.dart';

class WrapScreen extends StatefulWidget {
  final url;
  WrapScreen(this.url);

  @override
  _WrapState createState() {
    // TODO: implement createState
    return _WrapState(this.url);
  }
}

class _WrapState extends State<WrapScreen> {
  final _url;
  Completer<WebViewController> _controller = Completer<WebViewController>();
  _WrapState(this._url);

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('++++++++wrap$_url');
    // TODO: implement build
    return new WebviewScaffold(
      supportMultipleWindows: true,
      url: _url,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }
}
