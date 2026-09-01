import 'package:flutter/material.dart';

final KBodyPadding = EdgeInsets.all(14);
//sizedbox for spacing between widget
final _defaultSpace = 10;
KSpaceH(double size) => SizedBox(
  height: size * _defaultSpace,
);
KSpaceW(double size) => SizedBox(
  width: size * _defaultSpace,
);

//size width height
double KscreenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double KscreenHeight(BuildContext context) => MediaQuery.of(context).size.height;