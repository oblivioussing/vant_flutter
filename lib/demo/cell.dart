import 'package:flutter/material.dart';
import 'package:vant_flutter/package/cell/cell_group.dart';

import 'package:vant_flutter/package/nav_bar/nav_bar.dart';
import 'package:vant_flutter/package/style/color.dart';

class CellDemo extends StatefulWidget {
  const CellDemo({Key? key}) : super(key: key);

  @override
  _CellDemoState createState() => _CellDemoState();
}

class _CellDemoState extends State<CellDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(title: 'Cell'),
      backgroundColor: ChantColor.gray1,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 0,
          bottom: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title('基础用法'),
            _base(),
          ],
        ),
      ),
    );
  }

  Widget _base() {
    return ChantCellGroup();
  }

  Widget _title(text) {
    return Container(
      padding: EdgeInsets.only(
        top: 30,
        bottom: 15,
        left: 15,
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
