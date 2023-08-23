import 'package:flutter/material.dart';

class FastTransitionRoute<T> extends MaterialPageRoute<T> {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 150);

  FastTransitionRoute({builder}) : super(builder: builder);
}