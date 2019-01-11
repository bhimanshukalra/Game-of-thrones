import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:game_of_thrones/detailsPage.dart';
import 'package:game_of_thrones/episodes.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GameOfThrones gameOfThrones;

  Future<void> fetchEpisodes() async {
    var response = await http.get(
        "http://api.tvmaze.com/singlesearch/shows?q=game-of-thrones&embed=episodes");
    var decodedResponse = jsonDecode(response.body);
    print(decodedResponse);
    gameOfThrones = GameOfThrones.fromJson(decodedResponse);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchEpisodes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Game of thrones"),
      ),
      body: gameOfThrones != null
          ? descriptionData()
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  Widget descriptionData() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
              Hero(
                tag: gameOfThrones.images.medium,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    gameOfThrones.images.medium,
                  ),
                  radius: 120.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(gameOfThrones.name,style: TextStyle(fontSize: 26.0,fontWeight: FontWeight.bold,color: Colors.red),),
              SizedBox(
                height: 10.0,
              ),
              Text(gameOfThrones.summary,style: TextStyle(fontSize: 16.0),),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailsPage(
                            episodes: gameOfThrones.embedded.episodes,
                            imageUrl: gameOfThrones.images.medium,
                          )));
                },
                child: Text("All episodes"),
                color: Colors.red,
              )
          ],
        ),
            ),
      ),
    );
  }
}
