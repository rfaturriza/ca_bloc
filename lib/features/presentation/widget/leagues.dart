import 'package:ca_bloc/features/domain/entitites/leagues.dart';
import 'package:ca_bloc/features/presentation/ui/detail_page.dart';
import 'package:flutter/material.dart';

class LeaguesWidget extends StatelessWidget {
  final Leagues? leagues;
  const LeaguesWidget({Key? key, required this.leagues}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailPage(
                    leagues: leagues,
                  ))),
      child: Container(
        /// Give nice padding
        padding: const EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            /// This is the important part, we need [Hero] widget with unique tag for this item.
            Hero(
              tag: "avatar_${leagues?.id}",
              child: CircleAvatar(
                radius: 32,
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(leagues?.logos ?? ""),
              ),
            ),
            Padding(
              /// Give name text a Padding
              padding: const EdgeInsets.all(8.0),
              child: Text(leagues?.name ?? ""),
            )
          ],
        ),
      ),
    );
  }
}
