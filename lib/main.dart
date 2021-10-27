import 'package:flutter/material.dart';

import 'package:vant_flutter/demo/button.dart';
import 'package:vant_flutter/demo/cell.dart';
import 'package:vant_flutter/demo/loading.dart';
import 'package:vant_flutter/package/button/button.dart';
import 'package:vant_flutter/package/style/color.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      // home: ButtonDemo(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topLeft,
        color: ChantColor.white,
        padding: EdgeInsets.only(
          top: 30,
          right: 15,
          bottom: 30,
          left: 15,
        ),
        child: SingleChildScrollView(
          child: _menu(),
        ),
      ),
    );
  }

  Widget _menu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title('基础组件'),
        _cellBtn('Button按钮', () {
          _router('button');
        }),
        _cellBtn('Cell单元格', () {
          _router('cell');
        }),
        _title('反馈组件'),
        _cellBtn('Loading加载', () {
          _router('loading');
        }),
      ],
    );
  }

  Widget _cellBtn(String text, onPressed) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: ChantButton(
        mainAxisAlignment: MainAxisAlignment.start,
        backgroundColor: ChantColor.gray1,
        fontColor: ChantColor.black,
        round: true,
        text: text,
        width: double.infinity,
        onPressed: onPressed,
      ),
    );
  }

  Widget _title(text) {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
        left: 20,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: ChantColor.gray6,
        ),
      ),
    );
  }

  _router(String path) {
    var map = {
      'button': ButtonDemo(),
      'loading': LoadingDemo(),
      'cell': CellDemo(),
    };
    var wdt = map[path] ?? Container();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => wdt,
      ),
    );
  }
}
