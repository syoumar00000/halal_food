import 'package:flutter/material.dart';

//text 6
TextStyle? KHeadline6(BuildContext context, [Color? color]) =>
    Theme.of(context).textTheme.titleLarge?.copyWith(color: color);

//text 5
TextStyle? KHeadline5(BuildContext context, [Color? color]) =>
    Theme.of(context).textTheme.headlineSmall?.copyWith(color: color);

//text caption
TextStyle? KCaption(BuildContext context, [Color? color]) =>
    Theme.of(context).textTheme.bodySmall?.copyWith(color: color);

//text subtitle 1
TextStyle? KSubtitle1(BuildContext context, [Color? color]) =>
    Theme.of(context).textTheme.titleMedium?.copyWith(color: color);
