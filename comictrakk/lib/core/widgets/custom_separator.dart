import 'package:flutter/cupertino.dart';

class CustomSeparator extends StatelessWidget {
  const CustomSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsetsGeometry.fromLTRB(0, 2, 0, 2),
        child: SizedBox(
          height: 1,
          width: double.infinity,
          child: ColoredBox(color: Color(0xFF000000)),
        )
    );
  }
}