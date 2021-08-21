import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shortly/constant.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: const Center(
        child: SizedBox(
          child: CircularProgressIndicator(
              strokeWidth: 1.5,
              valueColor: AlwaysStoppedAnimation<Color>(primaryColor1)),
        ),
      ),
    );
  }
}
//valueColor: AlwaysStoppedAnimation<Color>(Colors.white)
