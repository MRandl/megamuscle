import 'package:flutter/material.dart';
import 'package:megamuscle/test_doggo/doggo_route.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  _presentationCard({required BuildContext ctx, required Color color, required String content}) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            ctx,
            MaterialPageRoute(builder: (context) => const DbInteractRoute(dbFileName: "blabla.db")),
          );
        },
        child: Card(
          color: color,
          child: Container(alignment: Alignment.center, child: Text(content)),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(title),
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Center(
            child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * .95,
                  height: MediaQuery.of(context).size.height / 4,
                  child: _presentationCard(
                      ctx: context, color: Colors.lightBlueAccent, content: "content")),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * .95,
                  height: MediaQuery.of(context).size.height / 4,
                  child: _presentationCard(
                      ctx: context, color: Colors.lightBlueAccent, content: "content")),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * .95,
                  height: MediaQuery.of(context).size.height / 8,
                  child: _presentationCard(
                      ctx: context, color: Colors.lightBlueAccent, content: "bouton principal")),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .95,
                height: MediaQuery.of(context).size.height / 4,
                child: Row(
                  children: [
                    Expanded(
                        child: _presentationCard(
                            ctx: context, color: Colors.orangeAccent, content: "content")),
                    const SizedBox(width: 8,),
                    Expanded(
                        child: _presentationCard(
                            ctx: context, color: Colors.greenAccent, content: "content")),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        )));
  }
}
