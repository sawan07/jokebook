import 'package:flutter/material.dart';
import 'package:jokebook/datamodels/joke_type.dart';


final jokeTypes = List.of([
  JokeType(
      type: "general",
      typeText: "general",
      title: "General Jokes",
      color: Colors.blue),
  JokeType(
      type: "knock",
      typeText: "knock-knock",
      title: "Knock Knock Jokes",
      color: Colors.indigo),
  JokeType(
      type: "programming",
      typeText: "programming",
      title: "Programming Jokes",
      color: Colors.purpleAccent)
]);

enum AnimatedTextType{
  Colorize,
  Typewriter
}


