import 'package:flutter/material.dart';
import 'package:megamuscle/dbInteract.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      int ctr = _counter + 1;
      if(ctr >= 0) {
        _counter = ctr;
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      int ctr = _counter - 1;
      if(ctr >= 0) {
        _counter = ctr;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            const SizedBox(height: 30),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DbInteract(name:"blabla.db")),
                  );
                },
                child: const Text('Open route'),
            ),
          ],
        ),
      ),
      floatingActionButton : Wrap( //will break to another line on overflow
        direction: Axis.vertical, //use vertical to show  on vertical axis
        children: <Widget>[
          FloatingActionButton(
            heroTag: "btn1",
            onPressed: _incrementCounter,
            child: const Icon(Icons.add),
          ), //button first
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "btn2",
            onPressed: _decrementCounter,
            child: const Icon(Icons.remove),
          ),
        ],
      ),// button second
    );
  }
}
