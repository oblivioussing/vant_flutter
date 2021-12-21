import 'dart:typed_data';

import 'package:flutter/material.dart';

class ChantImage extends StatelessWidget {
  const ChantImage({
    Key? key,
    this.src = '',
    this.memory,
    this.fit,
    this.height,
    this.width,
    this.radius = 0,
    this.round = false,
    this.showError = true,
    this.showLoading = true,
  });

  final String? src; // 图片链接
  final Uint8List? memory; // Uint8List
  final BoxFit? fit; // 图片填充模式
  final double? height; // 高度
  final double? width; // 宽度
  final double radius; // 圆角大小
  final bool round; // 是否显示为圆形
  final bool showError; // 是否展示图片加载失败提示
  final bool showLoading; // 是否展示图片加载中提示

  @override
  Widget build(BuildContext context) {
    var image;
    if (src == '') {
      image = MemoryImage(memory!);
    } else {
      var hasHttp = src?.indexOf('http') == 0;
      if (hasHttp) {
        image = NetworkImage(src!);
      } else {
        image = AssetImage(src!);
      }
    }
    return Container(
      child: _image(
        image,
      ),
    );
  }

  Widget _image(ImageProvider image) {
    return Image(
      image: image,
      fit: fit,
      height: height,
      width: width,
    );
  }
}
