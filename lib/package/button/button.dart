import 'package:flutter/material.dart';

import 'package:vant_flutter/package/loading/loading.dart';
import 'package:vant_flutter/package/style/color.dart';
import 'package:vant_flutter/package/style/size.dart';
import 'package:vant_flutter/package/widget/border.dart';

class ChantButton extends StatefulWidget {
  ChantButton({
    required this.onPressed,
    this.text = '',
    this.onLongPress,
    this.type = ButtonType.normal,
    this.size = ButtonSize.normal,
    this.height = ChantButtonSize.normalHeight,
    this.width = ChantButtonSize.normalWidth,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.borderRadius = ChantBorderSize.borderRadiusSm,
    this.backgroundColor = ChantColor.white,
    this.gradient,
    this.color,
    this.fontColor = ChantColor.white,
    this.fontSize = ChantFontSize.md,
    this.icon = '',
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
  final MainAxisAlignment mainAxisAlignment; // 对齐方式
  final double borderRadius; // 圆角
  final Color backgroundColor; // 背景颜色
  final Gradient? gradient; // 渐变色
  final Color? color; // 按钮颜色
  final Color fontColor; // 文字颜色
  final double fontSize; // 文字大小
  final String icon; // 左侧图标
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
  late Color color; // 颜色
  late Color fontColor; // 文字颜色
  late double fontSize; // 文字大小
  late BorderSide borderSide; // 边框
  late double? height; // 高度
  late double? width; // 宽度
  double iconHeight = 20; // icon高度
  double iconWidth = 20; // icon宽度
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
        style: _buttonStyle(),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              borderRadius,
            ),
            gradient: widget.gradient,
          ),
          child: _button(),
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
    color = colorMap[widget.type] as Color;
    // 背景颜色
    if (widget.type == ButtonType.normal) {
      backgroundColor = widget.backgroundColor;
      // 如果背景色为白色,则字体为黑色
      if (backgroundColor == ChantColor.white) {
        fontColor = ChantColor.black;
      }
    } else {
      backgroundColor = color;
    }
    // 普通按钮
    if (widget.type == ButtonType.normal) {
      borderSide = ChantBorder.side();
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
      borderSide = ChantBorder.side(color: widget.color ?? color);
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
    // 纯icon按钮
    if (widget.text.isEmpty) {
      width = (height ?? 0) + 10;
    }
  }

  // button样式
  ButtonStyle _buttonStyle() {
    return ButtonStyle(
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
          return backgroundColor.withOpacity(
            ChantColor.disabledOpacity,
          );
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
      textStyle: MaterialStateProperty.all(
        TextStyle(fontSize: fontSize),
      ),
      visualDensity: VisualDensity(
        horizontal: VisualDensity.minimumDensity,
        vertical: VisualDensity.minimumDensity,
      ),
    );
  }

  // button
  Widget _button() {
    if (widget.loading) {
      return _loading();
    }
    return Row(
      mainAxisAlignment: widget.mainAxisAlignment,
      children: [
        _icon(),
        Container(
          alignment: Alignment.center,
          padding: widget.padding,
          child: Text(widget.text),
        ),
      ],
    );
  }

  Widget _loading() {
    var loadingColor = ChantColor.white;
    var size = 20.0;
    if (widget.plain) {
      loadingColor = color;
    }
    if (widget.size == ButtonSize.mini) {
      size = 13;
    }
    return ChantLoading(
      color: loadingColor,
      size: size,
      text: widget.loadingText,
      textColor: loadingColor,
      type: widget.loadingType,
    );
  }

  Widget _icon() {
    if (widget.icon.isEmpty) {
      return SizedBox.shrink();
    }
    return Row(
      children: [
        Image.asset(
          widget.icon,
          height: iconHeight,
          width: iconWidth,
        ),
        SizedBox(
          width: widget.text.isEmpty ? 0 : 5,
        ),
      ],
    );
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
