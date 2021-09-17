import 'package:flutter/material.dart';
import 'package:vant_flutter/package/nav_bar/nav_bar.dart';

class ButtonDemo extends StatefulWidget {
  const ButtonDemo({Key? key}) : super(key: key);

  @override
  _ButtonDemoState createState() => _ButtonDemoState();
}

class _ButtonDemoState extends State<ButtonDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(title: 'Button'),
      body: Text('123'),
    );
  }
}
