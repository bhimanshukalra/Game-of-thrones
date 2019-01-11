import 'package:flutter/material.dart';
import 'package:game_of_thrones/episodes.dart';

class DetailsPage extends StatelessWidget {
  final List<Episodes> episodes;
  final String imageUrl;
  DetailsPage({this.episodes, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Hero(
            tag: imageUrl,
            child: CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
            ),
          ),
          SizedBox(
            width: 8.0,
          ),
          Text("GOT episodes"),
        ],
      )),
      body: GridView.builder(
          itemCount: episodes.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Card(
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.network(
                    episodes[index].images.medium,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                      left: 0.0,
                      top: 0.0,
                      child: Container(
                        color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "${episodes[index].season} ${episodes[index].number}",
                            style: myTextStyle(),
                          ),
                        ),
                      )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(episodes[index].name, style: myTextStyle()),
                      ),
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }

  TextStyle myTextStyle() {
    return TextStyle(color: Colors.white, fontSize: 18.0);
  }
}
