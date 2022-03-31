import 'package:ca_bloc/features/domain/entitites/leagues.dart';

class LeaguesModel extends Leagues {
  const LeaguesModel({
    required String? id,
    required String? name,
    required String? slug,
    required String? abbr,
    required String? logos,
  }) : super(
          id: id,
          name: name,
          slug: slug,
          abbr: abbr,
          logos: logos,
        );

  factory LeaguesModel.fromJson(Map<String, dynamic> json) => LeaguesModel(
        id: json['id'],
        name: json['name'],
        slug: json['slug'],
        abbr: json['abbr'],
        logos: json['logos']['light'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
        'abbr': abbr,
        'logos': logos,
      };
}
