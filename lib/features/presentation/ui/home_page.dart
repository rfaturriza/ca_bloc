import 'package:ca_bloc/features/domain/entitites/leagues.dart';
import 'package:ca_bloc/features/presentation/bloc/leagues_bloc/leagues_bloc.dart';
import 'package:ca_bloc/features/presentation/widget/leagues.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leagues Animation Demo'),
      ),
      body: BlocBuilder<LeaguesBloc, LeaguesState>(
        builder: (context, state) {
          if (state is LeaguesLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LeaguesLoadedState) {
            final List<Leagues> dataList = state.leagues;
            dataList.map((item) => LeaguesWidget(leagues: item)).toList();
            return ListView(
                children: dataList
                    .map((item) => LeaguesWidget(leagues: item))
                    .toList());
          } else if (state is LeaguesErrorState) {
            return const Center(
              child: Text('Error'),
            );
          }
          return Container();
        },
      ),
    );
  }
}
