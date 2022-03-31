import 'package:ca_bloc/features/domain/entitites/leagues.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Leagues? leagues;
  const DetailPage({Key? key, required this.leagues}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(leagues?.name ?? ""),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16),

              /// This is the important part, we need [Hero] widget with unique tag but same as Hero's tag in [User] widget.
              child: Hero(
                tag: "avatar_${leagues?.id!}",
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 100,
                  backgroundImage: NetworkImage(leagues?.logos ?? ""),
                ),
              ),
            ),
            Text(
              leagues?.name ?? "",
              style: const TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
