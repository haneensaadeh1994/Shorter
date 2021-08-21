import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shortly/constant.dart';
import 'package:shortly/view/common/svg_pic.dart';

class GetStartedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          SizedBox(
            height: 35,
          ),
          Text(
            app_name,
            style: text_style_3,
          ),
          Expanded(
            child: SvgPic(
              path: 'assets/images/illustration.svg',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(get_start_title,
              textAlign: TextAlign.center, style: text_style_2),
          SizedBox(
            height: 10,
          ),
          Text(
            get_start_description,
            textAlign: TextAlign.center,
            style: text_style_0,
          ),
          SizedBox(
            height: 20,
          ),
        ],

    );
  }
}
