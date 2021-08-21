import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shortly/bloc/link_bloc.dart';
import 'package:shortly/bloc/link_event.dart';
import 'package:shortly/database/link.dart';
import 'package:shortly/view/common/svg_pic.dart';

import '../../../constant.dart';
import '../../../main.dart';

class HistoryItem extends StatefulWidget {
  String copiedValue;
  Link link;
  LinkBloc linkBloc;

  HistoryItem(this.link, this.copiedValue, this.linkBloc);

  @override
  _HistoryItemState createState() => _HistoryItemState();
}

class _HistoryItemState extends State<HistoryItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: white, borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8),
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Text(
                    widget.link.linkBefore,
                    style: text_style_0,
                  )),
                  InkWell(
                      onTap: () {
                        widget.linkBloc.add(
                            DeleteFromDatabase(MyApp.database, widget.link));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 20,
                            width: 20,
                            child: SvgPic(path: 'assets/images/del.svg')),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              height: 1,
              color: grey0,
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "${widget.link.linkAfter}",
                    style: text_style_primary,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: widget.link.linkAfter))
                      .then((dynamic value) {
                    setState(() {
                      widget.copiedValue = widget.link.linkAfter;
                    });

                    showSimpleToast(context: context, message: copied);
                  });
                },
                child: Text(
                  widget.link.linkAfter == widget.copiedValue ? copied : copy,
                  style: text_style_1,
                ),
                style: TextButton.styleFrom(
                  primary: white,
                  backgroundColor: widget.link.linkAfter == widget.copiedValue?primaryColor2:primaryColor1,
                  minimumSize: Size(250, 35),
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
