part of 'leagues_bloc.dart';

abstract class LeaguesEvent extends Equatable {
  const LeaguesEvent();

  @override
  List<Object> get props => [];
}

class LeaguesFetchEvent extends LeaguesEvent {}
