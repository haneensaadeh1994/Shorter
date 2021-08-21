import 'package:flutter/cupertino.dart';

import '../../constant.dart';

class AppNameHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      app_name,
      style: header_style,
    );
  }
}
