part of 'leagues_bloc.dart';

abstract class LeaguesState extends Equatable {
  const LeaguesState();

  @override
  List<Object> get props => [];
}

class LeaguesLoadingState extends LeaguesState {}

class LeaguesLoadedState extends LeaguesState {
  final List<Leagues> leagues;

  const LeaguesLoadedState(this.leagues);

  @override
  List<Object> get props => [leagues];
}

class LeaguesErrorState extends LeaguesState {
  final String message;

  const LeaguesErrorState(this.message);

  @override
  List<Object> get props => [message];
}
