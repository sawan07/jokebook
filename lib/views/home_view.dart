import 'package:flutter/material.dart';
import 'package:jokebook/const/consts.dart';
import 'package:jokebook/views/categories_view.dart';
import 'package:jokebook/widgets/animated_text_widget.dart';
import 'package:jokebook/widgets/buttons.dart';
import 'package:jokebook/widgets/custom_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Joke Book'),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedTextWidget(text: 'Joke Book', animatedTextType: AnimatedTextType.Colorize,),
          SizedBox(height: 20,),
          CustomAnimatedButton(
            text: 'Load The Jokes!',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CategoriesView()));
            },
          )
        ],
      )),
    );
  }
}
