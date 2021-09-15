import 'package:flutter/material.dart';

// import '../style/color.dart';

class ChantButton extends StatelessWidget {
  const ChantButton({
    required this.text,
    required this.onPressed,
    this.type = ButtonType.normal,
    this.size = ButtonSize.normal,
    this.color,
    this.fontColor,
    this.fontSize = 14,
    this.icon,
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
  final Color? color; // 按钮颜色
  final Color? fontColor; // 文字颜色
  final double fontSize; // 文字大小
  final Image? icon; // 左侧图标
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
        backgroundColor: MaterialStateProperty.all(
          Color(0xFF1989fa).withOpacity(0.5),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      child: Container(
        alignment: Alignment.centerLeft,
        height: 30,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
      onPressed: onPressed,
    );
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
