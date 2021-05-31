import 'package:flutter/material.dart';
import 'package:jokebook/const/consts.dart';
import 'package:jokebook/views/jokes_list_view.dart';
import 'package:jokebook/widgets/buttons.dart';
import 'package:jokebook/widgets/custom_app_bar.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Categories'),
      body: Center(
        child: Wrap(children: buildButtonsWithCategory(context)),
      ),
    );
  }

  List<Widget> buildButtonsWithCategory(BuildContext context) {
    List<Widget> buttons = <Widget>[];
    jokeTypes.forEach((jokeType) => {
      buttons.add(CategoryButton(
        title: jokeType.title,
        color: jokeType.color,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => JokesListView(jokeType: jokeType)));
        },
      ))
    });
    return buttons;
  }
}
