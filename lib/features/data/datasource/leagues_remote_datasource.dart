import 'dart:convert';

import 'package:ca_bloc/features/data/models/leagues_model.dart';
import 'package:http/http.dart' as http;

abstract class LeaguesRemoteDataSource {
  Future<List<LeaguesModel>?> getLeaguesList();
}

class LeaguesRemoteDataSourceImpl implements LeaguesRemoteDataSource {
  static const String url =
      'https://api-football-standings.azharimm.site/leagues';

  @override
  Future<List<LeaguesModel>?> getLeaguesList() async {
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      );
      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        final responseData = responseBody['data'] as List;
        return responseData.map((item) => LeaguesModel.fromJson(item)).toList();
      } else {
        throw Exception('error fetching data');
      }
    } catch (e) {
      throw Exception('unknown error');
    }
  }
}
