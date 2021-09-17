import 'package:flutter/material.dart';

import 'package:vant_flutter/demo/button.dart';
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
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: _menu(),
        ),
      ),
    );
  }

  Widget _menu() {
    return Column(
      children: [
        _cellBtn('Button按钮', () {
          _router('button');
        }),
        _cellBtn('Cell单元格', () {
          _router('cell');
        }),
      ],
    );
  }

  Widget _cellBtn(String text, onPressed) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: ChantButton(
        alignment: Alignment.centerLeft,
        color: ChantColor.gray1,
        padding: EdgeInsets.only(left: 25),
        round: true,
        text: text,
        onPressed: onPressed,
      ),
    );
  }

  _router(String path) {
    var map = {
      'button': ButtonDemo(),
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
