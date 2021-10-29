import 'package:flutter/material.dart';
import 'package:vant_flutter/package/icon/icon.dart';

import 'package:vant_flutter/package/nav_bar/nav_bar.dart';
import 'package:vant_flutter/package/style/color.dart';

class IconDemo extends StatefulWidget {
  const IconDemo({Key? key}) : super(key: key);

  @override
  _IconDemoState createState() => _IconDemoState();
}

class _IconDemoState extends State<IconDemo> {
  var _iconList = [
    ChantIcon.delete,
    ChantIcon.increase,
    ChantIcon.close,
    ChantIcon.down,
    ChantIcon.upward,
    ChantIcon.next,
    ChantIcon.back,
    ChantIcon.nickname,
    ChantIcon.address,
    ChantIcon.check_more,
    ChantIcon.clock,
    ChantIcon.search,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(title: 'Icon'),
      backgroundColor: ChantColor.gray1,
      body: GridView.builder(
        itemCount: 12,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // 每行列数
        ),
        itemBuilder: (context, index) {
          return Icon(_iconList[index]);
        },
      ),
    );
  }
}
