import 'package:flutter/material.dart';

import 'dataStore.dart';

class DbInteractRoute extends StatefulWidget {
  final String dbFileName;

  const DbInteractRoute({super.key, required this.dbFileName});

  @override
  State<DbInteractRoute> createState() {
    return _DbInteractRouteState();
  }}

class _DbInteractRouteState extends State<DbInteractRoute> {

  late Future<DogDataStore> db;
  late Future<List<Dog>> dogsList;
  var counter = 0;

  Future<void> onInsert(int counter, String name) async {
    final database = await db;
    return database.insert(Dog(id: counter, name: name, age: 1));
  }

  Future<List<Dog>> dumpDb() async {
    return (await db).getAllDogs();
  }

  @override
  void initState() {
    db = DogDataStore.open(widget.dbFileName);
    dogsList = dumpDb();
    super.initState();
  }

  void refreshState() {
    setState(() {
      dogsList = dumpDb();
    });
  }
  
  @override
  void dispose() {
    db.then((d) => d.close());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dogs Database'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            ElevatedButton(
              onPressed: () {
                int newCounter = counter + 1;
                setState(() {
                  counter = newCounter;
                });
                onInsert(newCounter, "doggo $newCounter");
                },
              child: const Text('Insert'),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () { refreshState(); },
              child: const Text('Read Database'),
            ),
            FutureBuilder<List<Dog>>(
              future: dogsList,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.connectionState != ConnectionState.waiting) {
                  final dogDump = snapshot.data != null ? snapshot.data! : <Dog>[];
                  return Card(
                      child : Container(
                          constraints: BoxConstraints(minHeight: 100, maxHeight: 400, maxWidth: MediaQuery.of(context).size.width * 0.65),
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: dogDump.length,
                            itemBuilder: (context, index) {
                              final item = dogDump[index];

                              return ListTile(
                                title: Text(item.name),
                                subtitle: Text(item.id.toString()),
                              );
                            },
                          )
                      )
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ]
        )

      ),
    );
  }

}