import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

/// Colors App
const primaryColor1 = Color(0xFF2ACFCF);
const primaryColor2 = Color(0xFF3B3054);
const red = Color(0xFFF46262);
const grey0 = Color(0xFFBFBFBF);
const grey1 = Color(0xFF9E9AA7);
const violet0 = Color(0xFF35323E);
const violet1 = Color(0xFF232127);
const black = Color(0xFF000000);
const white = Color(0xFFFFFFFF);
const off_white = Color(0xFFF0F1F6);

/// Strings
const app_name = 'Shortly';
const font = 'Poppins';

const splash = 'splash';
const shorter = 'shorter';
const start = 'start';
const skip = 'Skip';
const copy = 'COPY';
const copied = 'COPIED!';
const link_history = 'Your Link History';
const short_it = 'SHORTEN IT!';
const short_hint = 'Shorten alink here..';
const add_link = 'Please add alink here';
const start_title = 'More than just shoter links';
const get_start_title = 'Lets get started';
const get_start_description = 'Paste your first link into \n the field to shorten it';
const start_description =
    'build your brands recognation and get detailed insights on how your links are performing';

const short_url = 'https://api.shrtco.de/v2/shorten?url=';
const slider_title_1 = 'Brand Recognation';
const slider_title_2 = 'Detailed Record';
const slider_title_3 = 'Fully Customizable';

const slider_description_1 =
    'Boost your brand recognation with each click.Generic links dont mean thing.Branded links help  instill confidence in your content.';
const slider_description_2 =
    'Gain insights into who is clicking your links.Knowing when and where people engage with your content helps inform better decisions.';
const slider_description_3 =
    'improve brand awareness and content dicoverability through customizable links,supercharging audience engagement.';

///Styles
const header_style =
    TextStyle(fontFamily: font, fontWeight: FontWeight.w900, fontSize: 28);

const text_style_0 = TextStyle(
  fontFamily: font,
);

const text_style_1 =
    TextStyle(fontFamily: font, fontWeight: FontWeight.w400, fontSize: 18);

const text_style_2 =
TextStyle(fontFamily: font, fontWeight: FontWeight.bold, fontSize: 20);

const text_style_3 =
    TextStyle(fontFamily: font, fontWeight: FontWeight.w900, fontSize: 28);

const text_style_primary =
TextStyle(fontFamily: font,color: primaryColor1);



showSimpleToast({
  required String message,
  required BuildContext context,
}) {
  return showToast(
    message,
    context: context,
    backgroundColor: primaryColor1,
    textStyle: TextStyle(
      color: white,
      fontFamily: font,
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
    ),
    textPadding: EdgeInsets.symmetric(horizontal: 33.0, vertical: 12.0),
    position: StyledToastPosition.center,
    animation: StyledToastAnimation.fadeScale,
    reverseAnimation: StyledToastAnimation.fade,
    curve: Curves.easeInOutBack,
    duration: Duration(seconds: 2),
    animDuration: Duration(milliseconds: 100),
  );
}