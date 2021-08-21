import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

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

  Widget _cellBtn(String label) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Color(0xFFf7f8fa),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      child: Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          // color: Color(0xFFf7f8fa),
          borderRadius: BorderRadius.all(
            Radius.circular(45),
          ),
        ),
        height: 45,
        padding: EdgeInsets.only(right: 30, left: 30),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
      onPressed: () {},
    );
  }
}
