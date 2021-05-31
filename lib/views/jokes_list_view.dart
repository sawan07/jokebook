import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jokebook/datamodels/joke.dart';
import 'package:jokebook/datamodels/joke_type.dart';
import 'package:jokebook/views/single_joke_view.dart';
import 'package:jokebook/widgets/custom_app_bar.dart';
import 'package:jokebook/widgets/custom_spinner.dart';
import 'package:jokebook/widgets/jokes_divider.dart';

class JokesListView extends StatefulWidget {
  final JokeType jokeType;

  JokesListView({this.jokeType});

  @override
  _JokesListViewState createState() => _JokesListViewState(jokeType);
}

class _JokesListViewState extends State<JokesListView> {
  Future<List<Joke>> jokesList;
  JokeType jokeType;

  _JokesListViewState(this.jokeType);

  final Connectivity _connectivity = Connectivity();
  ConnectivityResult _connectivityResult;

  @override
  void initState() {
    super.initState();
    jokesList = fetchJokes(jokeType.typeText, http.Client());
  }

  void checkConnectivity() async {
    ConnectivityResult connectivityResult =
        await _connectivity.checkConnectivity();
    setState(() {
      _connectivityResult = connectivityResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    checkConnectivity();
    if (_connectivityResult != ConnectivityResult.none) {
      return Scaffold(
        appBar: CustomAppBar(jokeType.title),
        body: Center(
          child: FutureBuilder<List<Joke>>(
            future: jokesList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          height: 100,
                          alignment: Alignment.centerLeft,
                          child: ListTile(
                            title: Text(snapshot.data[index].setup),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SingleJokeView(
                                            joke: snapshot.data[index],
                                          )));
                            },
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        JokesDivider(),
                    itemCount: snapshot.data.length);
              } else if (snapshot.hasError) {
                Text('Sorry. The data could not be loaded!');
              }
              return spinkit;
            },
          ),
        ),
      );
    } else {
      return Scaffold(
          appBar: CustomAppBar(jokeType.title),
          body: Center(
              child: Text(
            'Bummer! You are not connected to internet!',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
          )));
    }
  }
}

Future<List<Joke>> fetchJokes(String typeText, http.Client client) async {
  final response = await client.get(
      Uri.parse('https://official-joke-api.appspot.com/jokes/$typeText/ten'));
  if (response.statusCode == 200) {
    Iterable iterable = jsonDecode(response.body);
    var futureJokes = List<Joke>.from(iterable.map((e) => Joke.fromJson(e)));
    return futureJokes;
  } else {
    throw Exception('Failed to load jokes');
  }
}
