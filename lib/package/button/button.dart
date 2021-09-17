import 'package:flutter/material.dart';

import 'package:vant_flutter/package/style/color.dart';
import 'package:vant_flutter/package/style/size.dart';

class ChantButton extends StatelessWidget {
  ChantButton({
    required this.text,
    required this.onPressed,
    this.type = ButtonType.normal,
    this.size = ButtonSize.normal,
    this.height = ChantButtonSize.normalHeight,
    this.width = ChantButtonSize.normalWidth,
    this.alignment = Alignment.center,
    this.borderRadius = ChantBorderSize.borderRadiusSm,
    this.color = ChantColor.white,
    this.fontColor = ChantColor.black,
    this.fontSize = ChantFontSize.md,
    this.icon,
    this.padding,
    this.plain = false,
    this.square = false,
    this.round = false,
    this.disabled = false,
    this.loading = false,
    this.loadingText = '',
    this.loadingType = LoadingType.circular,
    this.loadingSize = 20,
  });

  final String text; // 按钮文字
  final VoidCallback onPressed; // 点击回调
  final ButtonType type; // 类型
  final ButtonSize size; // 尺寸
  final double height; // 高度
  final double width; // 宽度
  final Alignment alignment; // 对齐方式
  final double borderRadius; // 圆角
  final Color color; // 按钮颜色
  final Color fontColor; // 文字颜色
  final double? fontSize; // 文字大小
  final Image? icon; // 左侧图标
  final EdgeInsets? padding; // 间距
  final bool plain; // 是否为朴素按钮
  final bool square; // 是否为方形按钮
  final bool round; // 是否为圆形按钮
  final bool disabled; // 是否禁用按钮
  final bool loading; // 是否显示为加载状态
  final String loadingText; // 加载状态提示文字
  final LoadingType loadingType; // 加载图标类型
  final double loadingSize; // 加载图标大小

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return themeColor().withOpacity(
              ChantColor.activeOpacity,
            );
          }
          return themeColor();
        }),
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        padding: MaterialStateProperty.all(
          padding ?? EdgeInsets.all(0),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              themeBorderRadius(),
            ),
          ),
        ),
        side: MaterialStateProperty.all(
          BorderSide(color: ChantColor.gray3, width: 1),
        ),
      ),
      child: Container(
        alignment: alignment,
        height: height,
        child: Text(
          text,
          style: TextStyle(
            color: themeFontColor(),
            fontSize: fontSize,
          ),
        ),
      ),
      onPressed: onPressed,
    );
  }

  // 按钮颜色
  Color themeColor() {
    if (type == ButtonType.primary) {
      return ChantColor.primary;
    }
    if (type == ButtonType.success) {
      return ChantColor.success;
    }
    if (type == ButtonType.warning) {
      return ChantColor.warning;
    }
    if (type == ButtonType.danger) {
      return ChantColor.danger;
    }
    return color;
  }

  // 圆角
  double themeBorderRadius() {
    if (round) {
      return ChantBorderSize.borderRadiusMax;
    }
    if (square) {
      return 0;
    }
    return borderRadius;
  }

  // 字体颜色
  Color themeFontColor() {
    if (type == ButtonType.normal) {
      return fontColor;
    }
    return ChantColor.white;
  }
}

// 类型
enum ButtonType {
  normal,
  primary,
  success,
  warning,
  danger,
}

// 尺寸
enum ButtonSize {
  large,
  normal,
  small,
  mini,
}

enum LoadingType {
  circular,
  spinner,
}
