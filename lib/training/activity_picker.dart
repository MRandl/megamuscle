import 'package:flutter/material.dart';

class ActivityPicker extends StatelessWidget {
  const ActivityPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Choix de l'activité"),
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Text("zlatan"),
        )
    );
  }

}