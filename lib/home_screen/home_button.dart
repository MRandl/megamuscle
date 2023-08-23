import 'package:flutter/material.dart';

import '../colors.dart';

class HomeButton<ToActivity> extends StatelessWidget {
  const HomeButton(
      {super.key,
      required this.shadowColor,
      required this.colorGradient,
      required this.title,
      required this.toNext,
      this.height,
      this.width});

  final double? height;
  final double? width;
  final Color shadowColor;
  final Gradient colorGradient;
  final String title;
  final MaterialPageRoute<ToActivity> Function() toNext;

  static _presentationCard<T>(
      {required BuildContext ctx,
      required String content,
      required MaterialPageRoute<T> Function() materialPageRoute}) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            ctx,
            materialPageRoute(),
          );
        },
        child: Card(
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          margin: EdgeInsets.zero,
          color: Colors.transparent,
          child: Container(alignment: Alignment.center, child: Text(content, style: const TextStyle(fontSize: 30),)),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            gradient: colorGradient,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            boxShadow: const [
              BoxShadow(
                  spreadRadius: -14.0,
                  blurRadius: 5.0,
                  offset: Offset(0, 15.0),
                  color: trainingShadow)
            ]),
        child:
            _presentationCard<ToActivity>(ctx: context, content: title, materialPageRoute: toNext));
  }
}
