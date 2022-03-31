import 'package:bloc/bloc.dart';
import 'package:ca_bloc/core/usecase/usecase.dart';
import 'package:ca_bloc/features/domain/entitites/leagues.dart';
import 'package:ca_bloc/features/domain/usecases/get_leagues_from_api.dart';
import 'package:equatable/equatable.dart';

part 'leagues_event.dart';
part 'leagues_state.dart';

class LeaguesBloc extends Bloc<LeaguesEvent, LeaguesState> {
  final GetLeaguesFromAPI getLeaguesFromAPI;
  LeaguesBloc(this.getLeaguesFromAPI) : super(LeaguesLoadingState()) {
    on<LeaguesFetchEvent>(_onLeaguesLoad);
  }
  void _onLeaguesLoad(
      LeaguesFetchEvent event, Emitter<LeaguesState> emit) async {
    emit(LeaguesLoadingState());
    try {
      final List<Leagues>? data = await getLeaguesFromAPI.call(NoParams());
      emit(LeaguesLoadedState(data!));
    } catch (e) {
      emit(LeaguesErrorState(e.toString()));
    }
  }
}
