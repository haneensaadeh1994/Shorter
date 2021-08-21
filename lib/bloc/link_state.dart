import 'package:equatable/equatable.dart';
import 'package:shortly/model/link_model.dart';

abstract class LinkStates extends Equatable {

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ShortenState extends LinkStates {
  final LinkModel linkData;

  ShortenState(this.linkData) ;


  @override
  // TODO: implement props
  List<Object?> get props => [linkData];
}

class InitialState extends LinkStates {

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadingState extends LinkStates {

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ErrorState extends LinkStates {}
class RowAdded extends LinkStates {}
class RowDeleted extends LinkStates {}
