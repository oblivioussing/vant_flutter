import 'package:flutter/material.dart';

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
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 0,
          right: 10,
          bottom: 30,
          left: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title('加载类型'),
            _type(),
            _title('自定义颜色'),
            _color(),
            _title('自定义大小'),
            _size(),
            _title('加载文案'),
            _text(),
            _title('垂直排列'),
            _vertical(),
            _title('自定义文本颜色'),
            _textColor(),
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
        ChantLoading(
          type: LoadingType.spinner,
        ),
      ],
    );
  }

  Widget _color() {
    return Row(
      children: [
        ChantLoading(
          color: ChantColor.primary,
        ),
        SizedBox(width: 13),
        ChantLoading(
          color: ChantColor.primary,
          type: LoadingType.spinner,
        ),
      ],
    );
  }

  Widget _size() {
    return Row(
      children: [
        ChantLoading(size: 20),
        SizedBox(width: 13),
        ChantLoading(
          size: 40,
          type: LoadingType.spinner,
        ),
      ],
    );
  }

  Widget _text() {
    return Row(
      children: [
        ChantLoading(text: '加载中...'),
      ],
    );
  }

  Widget _vertical() {
    return Row(
      children: [
        ChantLoading(
          vertical: true,
          text: '加载中...',
        ),
      ],
    );
  }

  Widget _textColor() {
    return Row(
      children: [
        ChantLoading(
          color: ChantColor.primary,
          text: '加载中...',
          vertical: true,
        ),
        SizedBox(width: 13),
        ChantLoading(
          text: '加载中...',
          textColor: ChantColor.primary,
          vertical: true,
        ),
      ],
    );
  }

  Widget _title(text) {
    return Container(
      padding: EdgeInsets.only(
        top: 30,
        bottom: 15,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: ChantColor.gray6,
        ),
      ),
    );
  }
}
