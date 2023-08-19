import 'package:flutter/material.dart';
import 'package:megamuscle/doggo_route.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  _presentationCard({required BuildContext ctx, required Color color, required String content}) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            ctx,
            MaterialPageRoute(builder: (context) => const DbInteractRoute(dbFileName:"blabla.db")),
          );
        },
        child: Card(
          color: color,
          child: Container(
              alignment: Alignment.center,
              child: Text(content)
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body:Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: _presentationCard(ctx: context, color: Colors.lightBlueAccent, content: "content")
                ),
                Expanded(
                  child: _presentationCard(ctx: context, color: Colors.redAccent, content: "content")
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: _presentationCard(ctx: context, color: Colors.orangeAccent, content: "content")
                ),
                Expanded(
                    child: _presentationCard(ctx: context, color: Colors.greenAccent, content: "content")
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
