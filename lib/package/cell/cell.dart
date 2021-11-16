import 'package:flutter/material.dart';
import 'package:vant_flutter/package/icon/icon.dart';

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
    this.arrowDirection = ArrowDirection.right,
    this.required = false,
    this.center = false,
    this.last = false,
    this.onPressed,
  }) : super(key: key);

  final String title; // 左侧标题
  final String value; // 右侧内容
  final String label; // 标题下方的描述信息
  final CellSize size; // 单元格大小
  final IconData? icon; // 左侧图标
  final bool border; // 是否显示内边框
  final bool clickable; // 是否开启点击反馈
  final bool isLink; // 是否展示右侧箭头并开启点击反馈
  final ArrowDirection arrowDirection; // 箭头方向
  final bool required; // 是否显示表单必填星号
  final bool center; // 是否使内容垂直居中
  final bool last; // 是否为最后一个元素
  final VoidCallback? onPressed; // 点击回调

  @override
  Widget build(BuildContext context) {
    // cell上下间距
    var cellVerticalPadding = ChantPadding.cell;
    if (size == CellSize.large) {
      cellVerticalPadding = ChantPadding.cellLarge;
    }
    return Container(
      decoration: BoxDecoration(
        border: last ? null : ChantBorder.bottom(),
      ),
      padding: EdgeInsets.only(
        top: cellVerticalPadding,
        bottom: cellVerticalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: title == ''
                ? MainAxisAlignment.start
                : MainAxisAlignment.spaceBetween,
            children: [
              _title(),
              _value(),
            ],
          ),
          _label(),
        ],
      ),
    );
  }

  Widget _title() {
    var iconWdt;
    if (icon == null) {
      iconWdt = SizedBox.shrink();
    } else {
      iconWdt = Padding(
        padding: EdgeInsets.only(
          right: ChantPadding.base,
        ),
        child: Icon(icon, size: 16),
      );
    }
    return Row(
      children: [
        iconWdt,
        Text(
          title,
          style: TextStyle(
            fontSize: ChantFontSize.md,
          ),
        ),
      ],
    );
  }

  Widget _value() {
    var icon;
    if (isLink) {
      // 箭头方向
      var map = {
        ArrowDirection.up: ChantIcon.upward,
        ArrowDirection.right: ChantIcon.next,
        ArrowDirection.down: ChantIcon.down,
        ArrowDirection.left: ChantIcon.back,
      };
      icon = Icon(
        map[arrowDirection],
        size: 18,
        color: ChantColor.gray6,
      );
    } else {
      icon = SizedBox.shrink();
    }
    return Row(
      children: [
        Text(
          value,
          style: TextStyle(
            color: title == '' ? null : ChantColor.gray6,
            fontSize: ChantFontSize.md,
          ),
        ),
        icon,
      ],
    );
  }

  Widget _label() {
    if (label.isEmpty) {
      return SizedBox.shrink();
    }
    return Container(
      padding: EdgeInsets.only(top: ChantPadding.base),
      child: Text(
        label,
        style: TextStyle(
          color: ChantColor.gray6,
          fontSize: ChantFontSize.sm,
        ),
      ),
    );
  }
}

// 尺寸
enum CellSize {
  large,
  normal,
}

// 箭头方向
enum ArrowDirection {
  left,
  up,
  right,
  down,
}
