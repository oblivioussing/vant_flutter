import 'package:flutter/material.dart';

import 'package:vant_flutter/package/loading/line_spin_fade_loader_indicator.dart';
import 'package:vant_flutter/package/loading/loading.dart';
import 'package:vant_flutter/package/nav_bar/nav_bar.dart';
import 'package:vant_flutter/package/style/color.dart';

class LoadingDemo extends StatefulWidget {
  const LoadingDemo({Key? key}) : super(key: key);

  @override
  _LoadingDemoState createState() => _LoadingDemoState();
}

class _LoadingDemoState extends State<LoadingDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(title: 'Loading'),
      backgroundColor: ChantColor.white,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title('加载类型'),
            _type(),
          ],
        ),
      ),
    );
  }

  Widget _type() {
    return Row(
      children: [
        ChantLoading(),
        SizedBox(width: 13),
        LineSpinFadeLoaderIndicator(),
      ],
    );
  }

  Widget _title(text) {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      child: Text(
        text,
        style: TextStyle(
          color: ChantColor.gray7,
        ),
      ),
    );
  }
}
