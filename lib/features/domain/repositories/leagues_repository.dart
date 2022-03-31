import 'package:ca_bloc/features/domain/entitites/leagues.dart';

abstract class LeaguesRepository {
  Future<List<Leagues>?> getLeaguesFromAPI();
}
