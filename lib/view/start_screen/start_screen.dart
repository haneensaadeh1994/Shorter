import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shortly/view/common/app_name_header.dart';
import 'package:shortly/view/common/svg_pic.dart';

import '../../constant.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: off_white,
      body: SafeArea(
        child: Center(
          child: Container(
            child:  Column(
                children: [
                  SizedBox(
                    height: 35,
                  ),
                  AppNameHeader(),
                  Expanded(child: SvgPic(path: 'assets/images/illustration.svg',)),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    start_title,
                    textAlign: TextAlign.center,
                    style:text_style_3,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    start_description,
                    textAlign: TextAlign.center,
                    style: text_style_0
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextButton(
                      onPressed: () => Navigator.pushNamed(context, splash),
                      child: Text(
                        start,
                        style: text_style_1,
                      ),
                      style: TextButton.styleFrom(
                        primary: white,
                        backgroundColor: primaryColor1,
                        minimumSize: Size(300, 45),
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),

        ),
      ),
    );
  }
}
