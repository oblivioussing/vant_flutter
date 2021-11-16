import 'package:flutter/material.dart';
import 'package:vant_flutter/package/icon/icon.dart';

import 'package:vant_flutter/package/style/color.dart';
import 'package:vant_flutter/package/style/size.dart';
import 'package:vant_flutter/package/widget/border.dart';

class ChantCell extends StatelessWidget {
  const ChantCell({
    Key? key,
    this.title = '',
    this.titleSlot,
    this.value = '',
    this.valueSlot,
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
  final Widget? titleSlot; // 标题slot
  final String value; // 右侧内容
  final Widget? valueSlot; // 内容slot
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
    return TextButton(
      style: _buttonStyle(),
      child: Padding(
        padding: EdgeInsets.only(
          left: ChantPadding.md,
          right: ChantPadding.md,
        ),
        child: _content(),
      ),
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        }
      },
    );
  }

  ButtonStyle _buttonStyle() {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        var pressed = states.contains(MaterialState.pressed);
        var backgroundColor = ChantColor.white;
        // 点击
        if (pressed && isLink) {
          return ChantColor.gray3.withOpacity(
            ChantColor.activeOpacity,
          );
        }
        return backgroundColor;
      }),
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        var fontColor = ChantColor.black;
        var pressed = states.contains(MaterialState.pressed);
        if (pressed) {
          return fontColor.withOpacity(ChantColor.activeOpacity);
        }
        return fontColor;
      }),
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      padding: MaterialStateProperty.all(
        EdgeInsets.all(0),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            0,
          ),
        ),
      ),
      visualDensity: VisualDensity(
        horizontal: VisualDensity.minimumDensity,
        vertical: VisualDensity.minimumDensity,
      ),
    );
  }

  Widget _content() {
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
      child: _contentMain(),
    );
  }

  Widget _contentMain() {
    var alignment = MainAxisAlignment.spaceBetween;
    if (title == '' && titleSlot == null) {
      alignment = MainAxisAlignment.start;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: alignment,
                children: [
                  _title(),
                  SizedBox(
                    child: center ? null : _value(),
                  )
                ],
              ),
              _label(),
            ],
          ),
        ),
        SizedBox(
          child: center ? _value() : null,
        )
      ],
    );
  }

  Widget _title() {
    if (titleSlot != null) {
      return SizedBox(child: titleSlot);
    }
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
            color: ChantColor.black,
            fontSize: ChantFontSize.md,
          ),
        ),
      ],
    );
  }

  Widget _value() {
    if (valueSlot != null) {
      return SizedBox(child: valueSlot);
    }
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
            color: title == '' && titleSlot == null
                ? ChantColor.black
                : ChantColor.gray6,
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
