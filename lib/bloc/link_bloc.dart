import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shortly/bloc/link_event.dart';
import 'package:shortly/bloc/link_state.dart';
import 'package:http/http.dart' as http;
import 'package:shortly/database/link.dart';
import 'package:shortly/model/link_model.dart';

import '../constant.dart';

class LinkBloc extends Bloc<LinkEvents, LinkStates> {
  LinkBloc(LinkStates initialState) : super(initialState);

  @override
  Stream<LinkStates> mapEventToState(LinkEvents event) async* {
    if (event is Short) {
      yield LoadingState();
      try {
        LinkModel linkModel = await _shortLink(event.url);
        print('ShortenState......................');

        yield ShortenState(linkModel);
      } on Exception {
        print('erooooor');
        yield ErrorState();
      }
    } else if (event is InsertDatabase) {
      yield await _insertDatabase(event);
    } else if (event is DeleteFromDatabase) {
      yield await _deleteFromDatabase(event);
    }
  }

  Future<LinkModel> _shortLink(String url) async {
    http.Response response = await http.get(Uri.parse(
      '$short_url$url',
    ));
    print(response.statusCode);

    if (response.statusCode > 200 && response.statusCode < 400) {
      final body = json.decode(response.body);

      ApiResultModel apiResultModel =  ApiResultModel.fromJson(body);

      LinkModel linkModel;

      if (apiResultModel.ok)
        linkModel = LinkModel.fromJson(body['result']);
      else
        throw Exception();

      return linkModel;
    } else {
      throw Exception();
    }
  }

  Future<LinkStates> _insertDatabase(InsertDatabase event) async {
    event.database.insertNewLink(Link(
      id: event.id,
      linkBefore: event.linkBefore,
      linkAfter: event.linkAfter,
    ));

    return RowAdded();
  }

  Future<LinkStates> _deleteFromDatabase(DeleteFromDatabase event) async {
    event.database.deleteLink(event.link);

    return RowAdded();
  }
}
