import 'package:ca_bloc/features/data/datasource/leagues_remote_datasource.dart';
import 'package:ca_bloc/features/domain/entitites/leagues.dart';
import 'package:ca_bloc/features/domain/repositories/leagues_repository.dart';

class LeaguesRepositoryImpl implements LeaguesRepository {
  final LeaguesRemoteDataSource remoteDataSource;

  LeaguesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Leagues>?> getLeaguesFromAPI() {
    return remoteDataSource.getLeaguesList();
  }
}
