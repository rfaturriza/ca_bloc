import 'package:ca_bloc/core/usecase/usecase.dart';
import 'package:ca_bloc/features/domain/entitites/leagues.dart';
import 'package:ca_bloc/features/domain/repositories/leagues_repository.dart';

class GetLeaguesFromAPI implements UseCase<List<Leagues>, NoParams> {
  final LeaguesRepository repository;

  GetLeaguesFromAPI(this.repository);

  @override
  Future<List<Leagues>?> call(NoParams params) async {
    return await repository.getLeaguesFromAPI();
  }
}
