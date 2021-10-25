import 'package:flutter/material.dart';
import 'package:vant_flutter/package/cell/cell.dart';
import 'package:vant_flutter/package/style/color.dart';
import 'package:vant_flutter/package/style/size.dart';

class ChantCellGroup extends StatelessWidget {
  const ChantCellGroup({
    Key? key,
    this.children = const <ChantCell>[],
    this.backgroundColor = ChantColor.white,
    this.title = '',
    this.inset = false,
    this.border = true,
  }) : super(key: key);

  final List<ChantCell> children;
  final Color backgroundColor; // 背景色
  final String title; // 分组标题
  final bool inset; // 是否展示为圆角卡片风格
  final bool border; // 是否显示外边框

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _title(),
        Container(
          decoration: BoxDecoration(
            color: backgroundColor,
          ),
          padding: EdgeInsets.only(
            left: ChantPadding.md,
          ),
          child: Column(
            children: children,
          ),
        )
      ],
    );
  }

  Widget _title() {
    if (title == '') {
      return SizedBox.shrink();
    }
    return Padding(
      padding: EdgeInsets.only(
        left: ChantPadding.md,
        top: ChantPadding.md,
        bottom: ChantPadding.xs,
      ),
      child: Text(
        title,
        style: TextStyle(
          color: ChantColor.gray6,
        ),
      ),
    );
  }
}
