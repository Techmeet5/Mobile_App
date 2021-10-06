// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:fwfh_webview/fwfh_webview.dart';


class Drawing extends StatefulWidget {
  const Drawing({ Key? key }) : super(key: key);

  @override
  _DrawingState createState() => _DrawingState();
}

class _DrawingState extends State<Drawing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawing"),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: HtmlWidget(
      '<iframe src="https://whiteboard-techmeet.herokuapp.com/boards/techmeet"></iframe>',
      factoryBuilder: () => MyWidgetFactory(),
    ),
      )
    );
  }
}

class MyWidgetFactory extends WidgetFactory with WebViewFactory {
  // optional: override getter to configure how WebViews are built
  bool get webViewMediaPlaybackAlwaysAllow => true;
  String? get webViewUserAgent => 'My app';
}