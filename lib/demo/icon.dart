import 'package:flutter/material.dart';
import 'package:vant_flutter/package/icon/icon.dart';

import 'package:vant_flutter/package/nav_bar/nav_bar.dart';
import 'package:vant_flutter/package/style/color.dart';
import 'package:vant_flutter/package/style/size.dart';
import 'package:vant_flutter/package/widget/border.dart';

class IconDemo extends StatefulWidget {
  const IconDemo({Key? key}) : super(key: key);

  @override
  _IconDemoState createState() => _IconDemoState();
}

class _IconDemoState extends State<IconDemo> {
  var _iconMap = {
    'delete': ChantIcon.delete,
    'increase': ChantIcon.increase,
    'close': ChantIcon.close,
    'down': ChantIcon.down,
    'upward': ChantIcon.upward,
    'next': ChantIcon.next,
    'back': ChantIcon.back,
    'nickname': ChantIcon.nickname,
    'address': ChantIcon.address,
    'check_more': ChantIcon.checkMore,
    'clock': ChantIcon.clock,
    'search': ChantIcon.search,
    'loading': ChantIcon.loading,
    'photo': ChantIcon.photo,
    'photo_fail': ChantIcon.photoFail,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(title: 'Icon'),
      backgroundColor: ChantColor.gray1,
      body: Container(
        decoration: BoxDecoration(
          borderRadius: ChantBorder.radius(
            ChantBorderSize.borderRadiusLg,
          ),
          color: ChantColor.white,
        ),
        margin: EdgeInsets.all(20),
        child: _grid(),
      ),
    );
  }

  Widget _grid() {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      children: _gridList(),
    );
  }

  List<Widget> _gridList() {
    List<Widget> list = [];
    _iconMap.forEach((key, value) {
      list.add(
        _gridItem(name: key, icon: value),
      );
    });
    return list;
  }

  Widget _gridItem({name: String, icon: IconData}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon),
        SizedBox(height: 5),
        Text(name),
      ],
    );
  }
}
