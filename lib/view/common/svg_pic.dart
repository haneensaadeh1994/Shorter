import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class SvgPic extends StatelessWidget {
  String path;


  SvgPic({required this.path});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
    );
  }
}
