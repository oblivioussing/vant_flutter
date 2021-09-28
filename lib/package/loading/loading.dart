import 'package:flutter/material.dart';

import 'package:vant_flutter/package/loading/line_spin_fade_loader_indicator.dart';
import 'package:vant_flutter/package/style/color.dart';

class ChantLoading extends StatelessWidget {
  const ChantLoading({
    Key? key,
    this.color = ChantColor.gray5,
    this.type = LoadingType.circular,
    this.size = 25,
    this.text = '',
    this.textSize = 14,
    textColor,
    this.vertical = false,
  })  : textColor = textColor == null
            ? (color == ChantColor.gray5 ? ChantColor.gray6 : color)
            : textColor,
        super(key: key);

  final Color color; // 颜色
  final LoadingType type; // 类型
  final double size; // 加载图标大小
  final String text; // 文字
  final double textSize; // 文字大小
  final Color? textColor; // 文字颜色
  final bool vertical; // 是否垂直排列图标和文字内容

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: this.vertical ? Axis.vertical : Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: size,
          width: size,
          child: type == LoadingType.circular ? _circular() : _spinner(),
        ),
        _gap(),
        _text(),
      ],
    );
  }

  Widget _circular() {
    return CircularProgressIndicator(
      color: color,
      strokeWidth: 2,
    );
  }

  Widget _spinner() {
    return LineSpinFadeLoaderIndicator(ballColor: color);
  }

  Widget _gap() {
    if (text.isEmpty) {
      return SizedBox.shrink();
    }
    return SizedBox(
      height: vertical ? 10 : 0,
      width: !vertical ? 10 : 0,
    );
  }

  Widget _text() {
    if (text.isEmpty) {
      return SizedBox.shrink();
    }
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: textSize,
      ),
    );
  }
}

enum LoadingType {
  circular,
  spinner,
}
