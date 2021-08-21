import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shortly/view/common/app_name_header.dart';
import 'package:shortly/view/shorter_screen/shorter.dart';

import '../../constant.dart';
import 'componetns/slider_widget.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _currentIndex = 0;
  List<Map<String, String>> _splashList = [
    {
      'title': '$slider_title_1',
      'descreption': '$slider_description_1',
      'path': 'assets/images/diagram.svg'
    },
    {
      'title': '$slider_title_2',
      'descreption': '$slider_description_2',
      'path': 'assets/images/Gauge.svg'
    },
    {
      'title': '$slider_title_3',
      'descreption': '$slider_description_3',
      'path': 'assets/images/tools.svg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: off_white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Expanded(
              flex: 1,
              child: AppNameHeader(),
            ),
            Expanded(
              flex: 4,
              child: Container(

                child: PageView.builder(
                  onPageChanged: (position) {
                    setState(() {
                      _currentIndex = position;
                    });
                  },
                  itemBuilder: (_, index) {
                    return SliderWidget(
                        _splashList[index]['title'].toString(),
                        _splashList[index]['descreption'].toString(),
                        _splashList[index]['path'].toString());
                  },
                  itemCount: _splashList.length,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_splashList.length, (index) {
                      return buildDots(index);
                    }),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, shorter),
                    child: Text(
                      skip,
                      textAlign: TextAlign.center,
                      style: text_style_1,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDots(int index) {
    return AnimatedContainer(
      decoration: BoxDecoration(
          color: _currentIndex == index ? grey0 : off_white,
          shape: BoxShape.circle,
          border: Border.all(color: grey0, width: 1)),
      margin: EdgeInsets.only(right: 5),
      width: 10,
      height: 10,
      duration: Duration(milliseconds: 100),
    );
  }
}
