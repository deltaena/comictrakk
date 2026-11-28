import 'package:comictrakk/core/constants/app_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class IdleLogo extends StatelessWidget {
  const IdleLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
        AppAssets.batmanLogo,
        width: 110,
        height: 110,
        fit: BoxFit.contain,
    );
  }
}
