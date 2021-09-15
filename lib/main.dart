import 'package:flutter/material.dart';

import 'package/button/button.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            alignment: Alignment.topLeft,
            color: Colors.white,
            padding: EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: _menu(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _menu() {
    return Column(
      children: [
        _cellBtn('Button按钮'),
      ],
    );
  }

  Widget _cellBtn(String text) {
    return ChantButton(
      text: text,
      onPressed: () {
        print(text);
      },
    );
  }
}
