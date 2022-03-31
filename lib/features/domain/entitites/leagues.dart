import 'package:equatable/equatable.dart';

class Leagues extends Equatable {
  final String? id;
  final String? name;
  final String? slug;
  final String? abbr;
  final String? logos;

  const Leagues({
    required this.id,
    required this.name,
    required this.slug,
    required this.abbr,
    required this.logos,
  });

  @override
  List<Object?> get props => [id, name, slug, abbr, logos];
}
