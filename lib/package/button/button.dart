import 'package:flutter/material.dart';

import 'package:vant_flutter/package/style/color.dart';
import 'package:vant_flutter/package/style/size.dart';

class ChantButton extends StatefulWidget {
  ChantButton({
    required this.text,
    required this.onPressed,
    this.onLongPress,
    this.type = ButtonType.normal,
    this.size = ButtonSize.normal,
    this.height = ChantButtonSize.normalHeight,
    this.width = ChantButtonSize.normalWidth,
    this.alignment = Alignment.center,
    this.borderRadius = ChantBorderSize.borderRadiusSm,
    this.backgroundColor = ChantColor.white,
    this.color,
    this.fontColor = ChantColor.white,
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
  final VoidCallback? onLongPress; // 长按回调
  final ButtonType type; // 类型
  final ButtonSize size; // 尺寸
  final double height; // 高度
  final double width; // 宽度
  final Alignment alignment; // 对齐方式
  final double borderRadius; // 圆角
  final Color backgroundColor; // 背景颜色
  final Color? color; // 按钮颜色
  final Color fontColor; // 文字颜色
  final double fontSize; // 文字大小
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
  _ChantButtonState createState() => _ChantButtonState();
}

class _ChantButtonState extends State<ChantButton> {
  late Color backgroundColor; // 背景颜色
  late double borderRadius; // 圆角
  late Color fontColor; // 文字颜色
  late double fontSize; // 文字大小
  late BorderSide borderSide; // 边框
  late double? height; // 高度
  late double? width; // 宽度
  bool active = false; // 是否处于点击状态

  @override
  Widget build(BuildContext context) {
    backgroundColor = widget.backgroundColor;
    borderRadius = widget.borderRadius;
    fontColor = widget.fontColor;
    fontSize = widget.fontSize;
    borderSide = BorderSide.none;
    height = widget.height;
    width = widget.width;
    // 初始化
    _init();

    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            var pressed = states.contains(MaterialState.pressed);
            // 点击
            if (pressed && widget.disabled == false) {
              // 文字按钮
              if (widget.type == ButtonType.text) {
                return Colors.transparent;
              }
              // 背景为白色
              if (backgroundColor == ChantColor.white) {
                return ChantColor.gray5.withOpacity(
                  ChantColor.activeOpacity,
                );
              }
              return backgroundColor.withOpacity(
                ChantColor.activeOpacity,
              );
            }
            // 禁用
            if (widget.disabled == true) {
              return backgroundColor.withAlpha(400);
            }
            return backgroundColor;
          }),
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            var pressed = states.contains(MaterialState.pressed);
            if (pressed) {
              return fontColor.withOpacity(ChantColor.activeOpacity);
            }
            return fontColor;
          }),
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          padding: MaterialStateProperty.all(
            widget.padding ?? EdgeInsets.all(0),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                borderRadius,
              ),
            ),
          ),
          side: MaterialStateProperty.all(borderSide),
          visualDensity: VisualDensity(
            horizontal: VisualDensity.minimumDensity,
            vertical: VisualDensity.minimumDensity,
          ),
        ),
        child: Container(
          alignment: widget.alignment,
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: fontSize,
            ),
          ),
        ),
        onPressed: widget.disabled ? null : widget.onPressed,
        onLongPress: widget.disabled ? null : widget.onLongPress,
      ),
    );
  }

  // 初始化
  _init() {
    var colorMap = {
      ButtonType.text: Colors.transparent,
      ButtonType.normal: ChantColor.white,
      ButtonType.success: ChantColor.success,
      ButtonType.warning: ChantColor.warning,
      ButtonType.danger: ChantColor.danger,
      ButtonType.primary: ChantColor.primary,
    };
    // 颜色
    var color = colorMap[widget.type] as Color;
    // 背景颜色
    if (widget.type == ButtonType.normal) {
      backgroundColor = widget.backgroundColor;
      // 如果背景色为白色,则字体为黑色
      if (backgroundColor == ChantColor.white) {
        fontColor = ChantColor.black;
      }
    } else {
      // 背景颜色
      backgroundColor = color;
    }
    // 普通按钮
    if (widget.type == ButtonType.normal) {
      borderSide = BorderSide(color: ChantColor.gray3, width: 0.5);
    } else {
      fontColor = ChantColor.white;
    }
    // 文字按钮
    if (widget.type == ButtonType.text) {
      fontColor = ChantColor.black;
      height = null;
      width = null;
    }
    // 朴素按钮
    if (widget.plain) {
      borderSide = BorderSide(
        color: widget.color ?? color,
        width: 0.5,
      );
      backgroundColor = ChantColor.white;
      fontColor = widget.color ?? color;
    }
    // 圆角
    if (widget.round) {
      borderRadius = ChantBorderSize.borderRadiusMax;
    }
    // 方形按钮
    if (widget.square) {
      borderRadius = 0;
    }
    // 迷你按钮
    if (widget.size == ButtonSize.mini) {
      fontSize = ChantFontSize.xs;
      height = ChantButtonSize.miniHeight;
      width = ChantButtonSize.miniWidth;
    }
    // 小型按钮
    if (widget.size == ButtonSize.small) {
      fontSize = ChantFontSize.sm;
      height = ChantButtonSize.smallHeight;
      width = ChantButtonSize.smallWidth;
    }
    // 大号按钮
    if (widget.size == ButtonSize.large) {
      fontSize = ChantFontSize.lg;
      height = ChantButtonSize.largeHeight;
      width = ChantButtonSize.largeWidth;
    }
  }
}

// 类型
enum ButtonType {
  text,
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
