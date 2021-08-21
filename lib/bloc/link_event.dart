import 'package:equatable/equatable.dart';
import 'package:shortly/database/link.dart';

class LinkEvents extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InsertDatabase extends LinkEvents{

  String linkBefore,linkAfter;
  AppDatabase database;
  int id;

  InsertDatabase(this.database,this.id,this.linkBefore, this.linkAfter);
}

class DeleteFromDatabase extends LinkEvents{

  AppDatabase database;
  Link link;

  DeleteFromDatabase(this.database,this.link);
}
class Short extends LinkEvents{
  String url;


  Short(this.url);

  @override
  // TODO: implement props
  List<Object?> get props => [url];


}

