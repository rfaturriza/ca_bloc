import 'package:ca_bloc/features/domain/repositories/leagues_repository.dart';
import 'package:ca_bloc/features/presentation/bloc/leagues_bloc/leagues_bloc.dart';
import 'package:ca_bloc/features/presentation/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/data/datasource/leagues_remote_datasource.dart';
import 'features/data/repositories/leagues_repository_impl.dart';
import 'features/domain/usecases/get_leagues_from_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final LeaguesRepository _leaguesRepository = LeaguesRepositoryImpl(
      remoteDataSource: LeaguesRemoteDataSourceImpl(),
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => LeaguesBloc(GetLeaguesFromAPI(_leaguesRepository))
          ..add(LeaguesFetchEvent()),
        child: const HomePage(),
      ),
    );
  }
}
