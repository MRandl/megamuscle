import 'package:flutter/material.dart';
import 'package:megamuscle/home_screen/plotter.dart';

class ContainerizedPlotter extends StatelessWidget {
  const ContainerizedPlotter({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width - 16,
        height: MediaQuery.of(context).size.height / 4,
        decoration:
            BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(12)), boxShadow: [
          BoxShadow(
              spreadRadius: -14.0,
              blurRadius: 5.0,
              offset: Offset.fromDirection((3.14) / 2, 15.0),
              color: color)
        ]),
        child: Card(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                color: color,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          color: Colors.white,
          surfaceTintColor: Colors.white,
          shadowColor: Colors.white,
          margin: EdgeInsets.zero,
          child: SamplePlot(color: color),
        ));
  }
}
