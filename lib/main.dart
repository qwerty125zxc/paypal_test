import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:js/js.dart';
import 'package:paypal_test/js_interop.dart';

void _someDartFunction() {
  print('Hello from Dart!');
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // JavaScript code may now call `functionName()` or `window.functionName()`.
    functionName();
    jsFunctionName = allowInterop(_someDartFunction);
    functionName();
    super.initState();

    final IFrameElement _iframeElement = IFrameElement();
    _iframeElement.height = '500';
    _iframeElement.width = '500';
    _iframeElement.src = '../web/checkout.html';
    // _iframeElement.style.border = 'none';
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
        (int viewId) => _iframeElement,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Center(
        child: HtmlElementView(
          key: UniqueKey(),
          viewType: 'iframeElement',
        ),
      ),
    );
  }
}
