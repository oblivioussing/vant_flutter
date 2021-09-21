import 'package:flutter/material.dart';
import 'package:vant_flutter/package/button/button.dart';

import 'package:vant_flutter/package/nav_bar/nav_bar.dart';
import 'package:vant_flutter/package/style/color.dart';

class ButtonDemo extends StatefulWidget {
  const ButtonDemo({Key? key}) : super(key: key);

  @override
  _ButtonDemoState createState() => _ButtonDemoState();
}

class _ButtonDemoState extends State<ButtonDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(title: 'Button'),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title('按钮类型'),
            _type(),
            _title('朴素类型'),
            _plain(),
            _title('禁用按钮'),
            _disabled(),
          ],
        ),
      ),
    );
  }

  Widget _type() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ChantButton(
              text: '主要按钮',
              type: ButtonType.primary,
              onPressed: () {},
            ),
            ChantButton(
              text: '成功按钮',
              type: ButtonType.success,
              onPressed: () {},
            ),
            ChantButton(
              text: '默认按钮',
              onPressed: () {},
            ),
            ChantButton(
              text: '危险按钮',
              type: ButtonType.danger,
              onPressed: () {},
            ),
          ],
        ),
        SizedBox(height: 7),
        ChantButton(
          text: '警告按钮',
          type: ButtonType.warning,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _plain() {
    return Row(
      children: [
        ChantButton(
          text: '朴素按钮',
          type: ButtonType.primary,
          plain: true,
          onPressed: () {},
        ),
        SizedBox(width: 13),
        ChantButton(
          text: '朴素按钮',
          type: ButtonType.success,
          plain: true,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _disabled() {
    return Row(
      children: [
        ChantButton(
          text: '禁用按钮',
          type: ButtonType.primary,
          disabled: true,
          onPressed: () {
            print('disabled');
          },
        ),
        SizedBox(width: 13),
        ChantButton(
          text: '禁用按钮',
          type: ButtonType.success,
          disabled: true,
          onPressed: () {
            print('disabled');
          },
        ),
      ],
    );
  }

  Widget _title(text) {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      child: Text(
        text,
        style: TextStyle(color: ChantColor.gray7),
      ),
    );
  }
}
