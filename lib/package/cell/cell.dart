import 'package:flutter/material.dart';

class ChantCell extends StatelessWidget {
  const ChantCell({
    Key? key,
    this.title = '',
    this.value = '',
    this.label = '',
    this.size = CellSize.normal,
    this.icon,
  }) : super(key: key);

  final String title; // 左侧标题
  final String value; // 右侧内容
  final String label; // 标题下方的描述信息
  final CellSize size; // 单元格大小
  final String? icon; // 左侧图标

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// 尺寸
enum CellSize {
  large,
  normal,
}
