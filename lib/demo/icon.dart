import 'package:flutter/material.dart';

import 'package:vant_flutter/package/nav_bar/nav_bar.dart';
import 'package:vant_flutter/package/style/color.dart';

class IconDemo extends StatefulWidget {
  const IconDemo({Key? key}) : super(key: key);

  @override
  _IconDemoState createState() => _IconDemoState();
}

class _IconDemoState extends State<IconDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(title: 'Icon'),
      backgroundColor: ChantColor.gray1,
      body: Text('bac'),
    );
  }
}
