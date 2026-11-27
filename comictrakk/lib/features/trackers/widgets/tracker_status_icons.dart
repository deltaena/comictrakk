import 'package:flutter/material.dart';

class BaseIcon extends StatelessWidget {
  final Color iconBgColor;
  final IconData icon;

  const BaseIcon({super.key, required this.icon, required this.iconBgColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: ColoredBox(
        color: iconBgColor,
        child: Center(child: Icon(icon, color: Colors.white)),
      ),
    );
  }
}


class HaveIcon extends BaseIcon {
  const new({super.key}): super(icon: Icons.shelves, iconBgColor:  Colors.orange);
}

class ReadIcon extends BaseIcon {
  const new({super.key}): super(icon: Icons.book, iconBgColor:  Colors.green);
}

class WishIcon extends BaseIcon {
  const new({super.key}): super(icon: Icons.shopping_bag, iconBgColor: Colors.deepPurple);
}

class DefaultIcon extends BaseIcon {
  const new({super.key}): super(icon: Icons.bookmark_border, iconBgColor: Colors.black38);
}