import 'package:flutter/material.dart';

class SettingsRoute extends StatelessWidget {
  const SettingsRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Paramètres"),
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
        ),
        body: const Center(
          child: Text("zlatan"),
        ));
  }
}
