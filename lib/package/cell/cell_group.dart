import 'package:flutter/material.dart';
import 'package:vant_flutter/package/cell/cell.dart';
import 'package:vant_flutter/package/style/color.dart';

class ChantCellGroup extends StatelessWidget {
  const ChantCellGroup({
    Key? key,
    this.children = const <ChantCell>[],
  }) : super(key: key);

  final List<ChantCell> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ChantColor.white,
      ),
      child: Column(
        children: children,
      ),
    );
  }
}
