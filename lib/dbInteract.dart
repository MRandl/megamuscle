import 'package:flutter/material.dart';

import 'dataStore.dart';

class DbInteract extends StatefulWidget {
  final String name;

  const DbInteract({super.key, required this.name});

  @override
  State<DbInteract> createState() {
    return DbInteractState();
  }}

class DbInteractState extends State<DbInteract> {
  DbInteractState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: const Center(

      ),
    );
  }

}