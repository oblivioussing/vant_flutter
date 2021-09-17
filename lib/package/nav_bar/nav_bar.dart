import 'package:flutter/material.dart';
import 'package:vant_flutter/package/style/color.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  NavBar({
    required this.title,
  });

  final String title;

  @override
  final Size preferredSize = Size.fromHeight(46);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: _backBtn(context),
      title: _title(),
    );
  }

  // 返回按钮
  Widget _backBtn(context) {
    return IconButton(
      onPressed: () {
        Navigator.maybePop(context);
      },
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      icon: Image.asset(
        'image/ic_back.png',
        width: 20,
      ),
    );
  }

  // title
  Widget _title() {
    return Text(
      title,
      style: TextStyle(
        color: ChantColor.black,
      ),
    );
  }
}
