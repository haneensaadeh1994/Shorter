import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shortly/bloc/link_bloc.dart';
import 'package:shortly/bloc/link_event.dart';
import 'package:shortly/bloc/link_state.dart';
import 'package:shortly/database/link.dart';
import 'package:shortly/view/common/loader.dart';
import 'package:shortly/view/shorter_screen/component/get_started.dart';

import '../../constant.dart';
import '../../main.dart';
import 'component/history_item.dart';

class ShorterScreen extends StatefulWidget {
  @override
  _ShorterScreenState createState() => _ShorterScreenState();
}

class _ShorterScreenState extends State<ShorterScreen> {
  var linkController = TextEditingController();
  int historyListLength = 0;
  late LinkBloc _linkBloc;
  String copiedValue = '';
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    _linkBloc = BlocProvider.of<LinkBloc>(context);
    Clipboard.getData(Clipboard.kTextPlain)
        .then((dynamic value) async => copiedValue = value.text);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: off_white,
        body: SafeArea(
            child: BlocBuilder<LinkBloc, LinkStates>(
                bloc: _linkBloc,
                builder: (_, state) {
                  if (state is ShortenState) {
                    historyListLength++;
                    _linkBloc.add(InsertDatabase(
                        MyApp.database,
                        historyListLength,
                        state.linkData.original_link,
                        state.linkData.full_short_link));

                    Future.delayed(Duration.zero, () async {
                      linkController.clear();
                    });
                  } else if (state is ErrorState)
                    Future.delayed(Duration.zero, () async {
                      showSimpleToast(
                          context: context, message: 'link invalid');
                    });

                  return Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: StreamBuilder(
                          stream: MyApp.database.watchAllLinks(),
                          builder:
                              (context, AsyncSnapshot<List<Link>> snapshot) {
                            if (snapshot.data != null)
                              historyListLength = snapshot.data!.length;

                            return snapshot.data == null ||
                                    snapshot.data!.length == 0
                                ? GetStartedWidget()
                                : Column(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(top: 20,bottom: 10),
                                        child: Text(
                                          link_history,
                                          style: text_style_1,
                                        )),

                                    Expanded(
                                      child: ListView.builder(
                                          itemBuilder: (_, index) {
                                            return HistoryItem(snapshot.data![index],
                                                copiedValue, _linkBloc);
                                          },
                                          itemCount: snapshot.data != null
                                              ? snapshot.data!.length
                                              : 0,
                                        ),
                                    ),
                                  ],
                                );
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: primaryColor2,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 7,
                                    ),
                                    SizedBox(
                                      width: 300,
                                      child: TextFormField(
                                        controller: linkController,
                                        decoration: new InputDecoration(
                                          hintText: short_hint,
                                          errorText: null,
                                          filled: true,
                                          fillColor: white,
                                          focusColor: white,
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                          ),
                                        ),
                                        validator: (text) {
                                          if (text.toString().isEmpty) {
                                            return add_link;
                                          } else
                                            return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    state is LoadingState
                                        ? Loader()
                                        : TextButton(
                                            onPressed: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                _linkBloc.add(Short(
                                                    linkController.text
                                                        .toString()));
                                              }
                                            },
                                            child: Text(
                                              short_it,
                                              style: text_style_1,
                                            ),
                                            style: TextButton.styleFrom(
                                              primary: white,
                                              backgroundColor: primaryColor1,
                                              minimumSize: Size(300, 45),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 16.0),
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5.0)),
                                              ),
                                            )),
//                                    Spacer(
//                                      flex: 1,
//                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                })),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _linkBloc.close();
    super.dispose();
  }
}
