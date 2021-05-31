import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jokebook/assets/brand_colors.dart';

final spinkit = SpinKitFadingCircle(
  itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: index.isEven
            ? BrandColors.colorPrimary
            : BrandColors.colorPrimaryDark,
      ),
    );
  },
);