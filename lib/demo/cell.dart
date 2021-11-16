import 'package:flutter/material.dart';
import 'package:vant_flutter/package/cell/cell.dart';
import 'package:vant_flutter/package/cell/cell_group.dart';
import 'package:vant_flutter/package/icon/icon.dart';

import 'package:vant_flutter/package/nav_bar/nav_bar.dart';
import 'package:vant_flutter/package/style/color.dart';

class CellDemo extends StatefulWidget {
  const CellDemo({Key? key}) : super(key: key);

  @override
  _CellDemoState createState() => _CellDemoState();
}

class _CellDemoState extends State<CellDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(title: 'Cell'),
      backgroundColor: ChantColor.gray1,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 0,
          bottom: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            _base(),
            SizedBox(height: 15),
            _card(),
            SizedBox(height: 15),
            _size(),
            SizedBox(height: 15),
            _icon(),
            SizedBox(height: 15),
            _onlyValue(),
            SizedBox(height: 15),
            _showArrow(),
            SizedBox(height: 15),
            _group(),
            SizedBox(height: 15),
            _slot(),
            SizedBox(height: 15),
            _vertical(),
          ],
        ),
      ),
    );
  }

  // 基础用法
  Widget _base() {
    return ChantCellGroup(
      title: '基础用法',
      children: [
        ChantCell(
          title: '单元格',
          value: '内容',
        ),
        ChantCell(
          title: '单元格',
          value: '内容',
          label: '描述信息',
          last: true,
        ),
      ],
    );
  }

  // 卡片风格
  Widget _card() {
    return ChantCellGroup(
      title: '卡片风格',
      inset: true,
      children: [
        ChantCell(
          title: '单元格',
          value: '内容',
        ),
        ChantCell(
          title: '单元格',
          value: '内容',
          label: '描述信息',
          last: true,
        ),
      ],
    );
  }

  // 单元格大小
  Widget _size() {
    return ChantCellGroup(
      title: '单元格大小',
      children: [
        ChantCell(
          title: '单元格',
          value: '内容',
          size: CellSize.large,
        ),
        ChantCell(
          title: '单元格',
          value: '内容',
          size: CellSize.large,
          label: '描述信息',
          last: true,
        ),
      ],
    );
  }

  // 展示图标
  Widget _icon() {
    return ChantCellGroup(
      title: '展示图标',
      children: [
        ChantCell(
          icon: Icons.local_airport_sharp,
          title: '单元格',
          value: '内容',
          last: true,
        ),
      ],
    );
  }

  // 只设置 value
  Widget _onlyValue() {
    return ChantCellGroup(
      title: '只设置 value',
      children: [
        ChantCell(
          value: '内容',
          last: true,
        ),
      ],
    );
  }

  // 展示箭头
  Widget _showArrow() {
    return ChantCellGroup(
      title: '展示箭头',
      children: [
        ChantCell(
          title: '单元格',
          isLink: true,
        ),
        ChantCell(
          title: '单元格',
          value: '内容',
          isLink: true,
          onPressed: () {
            print('单元格');
          },
        ),
        ChantCell(
          title: '单元格',
          value: '内容',
          isLink: true,
          arrowDirection: ArrowDirection.down,
          last: true,
        ),
      ],
    );
  }

  // 分组标题
  Widget _group() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 15,
            top: 10,
            bottom: 10,
          ),
          child: Text('分组标题'),
        ),
        ChantCellGroup(
          title: '分组 1',
          children: [
            ChantCell(
              title: '单元格',
              value: '内容',
              last: true,
            ),
          ],
        ),
        ChantCellGroup(
          title: '分组 2',
          children: [
            ChantCell(
              title: '单元格',
              value: '内容',
              last: true,
            ),
          ],
        )
      ],
    );
  }

  // 使用插槽
  Widget _slot() {
    return ChantCellGroup(
      title: '使用插槽',
      children: [
        ChantCell(
          titleSlot: Row(
            children: [
              Icon(ChantIcon.address),
              Icon(ChantIcon.nickname),
            ],
          ),
          value: '内容',
          isLink: true,
        ),
        ChantCell(
          title: '单元格',
          valueSlot: Row(
            children: [
              Icon(ChantIcon.address),
              Icon(ChantIcon.nickname),
            ],
          ),
          last: true,
        ),
      ],
    );
  }

  // 垂直居中
  Widget _vertical() {
    return ChantCellGroup(
      title: '垂直居中',
      children: [
        ChantCell(
          title: '单元格',
          label: '描述信息',
          value: '内容',
          center: true,
          last: true,
        ),
      ],
    );
  }
}
