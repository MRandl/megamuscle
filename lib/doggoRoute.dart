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

  late Future<DogDataStore> _db;
  late Future<List<Dog>> _dogsList;
  var _counter = 0;

  @override
  void initState() {
    _db = DogDataStore.open(widget.dbFileName);
    _dogsList = _getRefreshedList();
    super.initState();
  }

  @override
  void dispose() {
    _db.then((d) => d.close());
    super.dispose();
  }

  Future<void> _runInsert(int counter, String name) async {
    return (await _db).insert(Dog(id: counter, name: name, age: 1));
  }

  Future<List<Dog>> _getRefreshedList() async {
    return (await _db).getAllDogs();
  }

  Future<void> _runWipeAll() async {
    return (await _db).cleanDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dogs Database'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        scrolledUnderElevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _counter++;
                      _dogsList = _runInsert(_counter, "doggo $_counter")
                          .then((v) => _getRefreshedList());
                    });
                  },
                  child: const Text('Insert'),
                ),
                const SizedBox(width: 10,),
                // clean the database and update the visuals
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _dogsList = _runWipeAll().then((v) => _getRefreshedList());
                    });
                  },
                  child: const Text('Wipe database'),
                ),
              ],
            ),
            // insert new dog into db

            const SizedBox(height: 20,),

            Expanded(
              child: FutureBuilder<List<Dog>>(

                future: _dogsList,
                initialData: const <Dog>[],

                builder: (context, snapshot) {
                  final dogDump = snapshot.data != null ? snapshot.data! : <Dog>[];
                  return Card(child : ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child : Container(
                      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width  - 40),
                      child: Scrollbar(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: dogDump.length,
                          padding: const EdgeInsets.only(top: 0),
                          itemBuilder: (context, index) {
                            final item = dogDump[index];
                            return ListTile(
                              title: Text(item.name),
                              subtitle: Text(item.id.toString()),
                            );
                          },
                        )
                      )
                    )
                  ));
                },

              )
            ),
            const SizedBox(height: 20,),
          ]
        )
      ),
    );
  }
}
