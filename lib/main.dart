import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: "Le début d'une grande aventure"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
        backgroundColor: Colors.tealAccent,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton : Wrap( //will break to another line on overflow
          direction: Axis.vertical, //use vertical to show  on vertical axis
          children: <Widget>[
            Container(
              margin:const EdgeInsets.only(bottom: 10),
              child: FloatingActionButton(
                onPressed: _incrementCounter,
                child: const Icon(Icons.add),
              )
            ), //button first

            Container(
              child: FloatingActionButton(
                onPressed: _decrementCounter,
                child: const Icon(Icons.remove),
              )
            ),
          ],
      ),// button second
    );
  }
}
