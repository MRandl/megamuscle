import 'package:flutter/material.dart';
import 'package:megamuscle/doggo_route.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Push the button to get to the db interaction :',
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DbInteractRoute(dbFileName:"blabla.db")),
                );
              },
              child: const Text('Open route'),
            ),
          ],
        ),
      ),
    );
  }
}
