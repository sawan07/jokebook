import 'package:flutter/material.dart';
import 'package:jokebook/const/consts.dart';
import 'package:jokebook/datamodels/joke.dart';
import 'package:jokebook/widgets/animated_text_widget.dart';
import 'package:jokebook/widgets/custom_app_bar.dart';

class SingleJokeView extends StatelessWidget {
  final Joke joke;

  const SingleJokeView({Key key, this.joke}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(joke.setup.replaceAll("\n", "")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(child: AnimatedTextWidget(
            text: joke.punchline,
          animatedTextType: AnimatedTextType.Typewriter,
        )),
      ),
    );
  }
}
