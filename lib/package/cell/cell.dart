import 'package:flutter/material.dart';

import 'package:vant_flutter/package/style/color.dart';
import 'package:vant_flutter/package/style/size.dart';
import 'package:vant_flutter/package/widget/border.dart';

class ChantCell extends StatelessWidget {
  const ChantCell({
    Key? key,
    this.title = '',
    this.value = '',
    this.label = '',
    this.size = CellSize.normal,
    this.icon,
    this.border = true,
    this.clickable = false,
    this.isLink = false,
    this.required = false,
    this.center = false,
    this.last = false,
  }) : super(key: key);

  final String title; // 左侧标题
  final String value; // 右侧内容
  final String label; // 标题下方的描述信息
  final CellSize size; // 单元格大小
  final String? icon; // 左侧图标
  final bool border; // 是否显示内边框
  final bool clickable; // 是否开启点击反馈
  final bool isLink; // 是否展示右侧箭头并开启点击反馈
  final bool required; // 是否显示表单必填星号
  final bool center; // 是否使内容垂直居中
  final bool last; // 是否为最后一个元素

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: last ? null : ChantBorder.bottom(),
          ),
          padding: EdgeInsets.only(
            top: ChantPadding.cell,
            right: ChantPadding.md,
            bottom: ChantPadding.cell,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _title(),
              _value(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _title() {
    return Text(title);
  }

  Widget _value() {
    return Text(
      value,
      style: TextStyle(
        color: ChantColor.gray6,
      ),
    );
  }
}

// 尺寸
enum CellSize {
  large,
  normal,
}
