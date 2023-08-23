import 'package:flutter/material.dart';
import 'package:megamuscle/home_screen/plotter.dart';
import 'package:megamuscle/statistics/statistics.dart';
import 'package:megamuscle/test_doggo/doggo_route.dart';
import 'package:megamuscle/training/activity_picker.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  _presentationCard<T>(
      {required BuildContext ctx,
      required Color color,
      required String content,
      required MaterialPageRoute<T> Function() materialPageRoute}) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            ctx,
            materialPageRoute(),
          );
        },
        child: Card(
          elevation: 100,
          margin: EdgeInsets.zero,
          color: Colors.transparent,
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
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              Container(
                  width: MediaQuery.of(context).size.width - 16,
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: -14.0,
                            blurRadius: 5.0,
                            offset: Offset.fromDirection((3.14) / 2, 15.0),
                            color: Colors.blue)
                      ]),
                  child: const Card(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    color: Colors.white,
                    surfaceTintColor: Colors.white,
                    shadowColor: Colors.white,
                    margin: EdgeInsets.zero,
                    child: SamplePlot(color: Colors.blue),
                  )),
              const SizedBox(
                height: 8,
              ),
              Container(
                  width: MediaQuery.of(context).size.width - 16,
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: -14.0,
                            blurRadius: 5.0,
                            offset: Offset.fromDirection((3.14) / 2, 15.0),
                            color: Colors.green)
                      ]),
                  child: const Card(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.greenAccent,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    color: Colors.white,
                    surfaceTintColor: Colors.white,
                    shadowColor: Colors.white,
                    margin: EdgeInsets.zero,
                    child: SamplePlot(color: Colors.greenAccent),
                  )),
              const SizedBox(
                height: 8,
              ),
              Container(
                  width: MediaQuery.of(context).size.width - 16,
                  height: MediaQuery.of(context).size.height / 8,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.orangeAccent.shade100, Colors.orangeAccent.shade400]),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: -14.0,
                            blurRadius: 5.0,
                            offset: Offset.fromDirection((3.14) / 2, 15.0),
                            color: Colors.orange)
                      ]),
                  child: _presentationCard<ActivityPicker>(
                      ctx: context,
                      color: Colors.lightBlueAccent,
                      content: "🔥",
                      materialPageRoute: () => MaterialPageRoute<ActivityPicker>(
                          builder: (context) => const ActivityPicker()))),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                  child: SizedBox(
                width: MediaQuery.of(context).size.width - 16,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(12)),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.orangeAccent.shade100,
                                      Colors.orangeAccent.shade400
                                    ]),
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: -14.0,
                                      blurRadius: 5.0,
                                      offset: Offset.fromDirection((3.14) / 2, 15.0),
                                      color: Colors.orange)
                                ]),
                            child: _presentationCard<StatisticsRoute>(
                                ctx: context,
                                color: Colors.orangeAccent,
                                content: "📊",
                                materialPageRoute: () => MaterialPageRoute<StatisticsRoute>(
                                    builder: (context) => const StatisticsRoute())))),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(12)),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.orangeAccent.shade100,
                                      Colors.orangeAccent.shade400
                                    ]),
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: -14.0,
                                      blurRadius: 5.0,
                                      offset: Offset.fromDirection((3.14) / 2, 15.0),
                                      color: Colors.orange)
                                ]),
                            child: Container(
                                child: _presentationCard<DbInteractRoute>(
                                    ctx: context,
                                    color: Colors.greenAccent,
                                    content: "🤓",
                                    materialPageRoute: () => MaterialPageRoute<DbInteractRoute>(
                                        builder:
                                            (context) => //todo make it a settings route instead
                                                const DbInteractRoute(dbFileName: "blabla.db")))))),
                  ],
                ),
              )),
              const SizedBox(
                height: 8,
              )
            ],
          ),
        ));
  }
}
