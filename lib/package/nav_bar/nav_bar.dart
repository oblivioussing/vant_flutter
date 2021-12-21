import 'package:flutter/material.dart';
import 'package:vant_flutter/package/icon/icon.dart';
import 'package:vant_flutter/package/style/color.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  NavBar({
    required this.title,
    this.showMore = false,
  });

  final String title;
  final bool showMore;

  @override
  final Size preferredSize = Size.fromHeight(46);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: _backButtn(context),
      title: _title(),
      actions: [
        _more(context),
      ],
    );
  }

  Widget _iconButton(
    context, {
    required onPressed,
    required icon,
  }) {
    return IconButton(
      onPressed: onPressed,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      icon: Icon(
        icon,
        color: ChantColor.black,
        size: 20,
      ),
    );
  }

  Widget _backButtn(context) {
    return _iconButton(
      context,
      onPressed: () {
        Navigator.maybePop(context);
      },
      icon: ChantIcon.back,
    );
  }

  Widget _title() {
    return Text(
      title,
      style: TextStyle(
        color: ChantColor.black,
      ),
    );
  }

  Widget _more(context) {
    if (!showMore) {
      return SizedBox.shrink();
    }
    return _iconButton(
      context,
      onPressed: () {},
      icon: ChantIcon.checkMore,
    );
  }
}
