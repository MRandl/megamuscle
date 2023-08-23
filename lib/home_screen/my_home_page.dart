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
          margin: EdgeInsets.zero,
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
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width - 16,
                  height: MediaQuery.of(context).size.height / 4,
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
              SizedBox(
                  width: MediaQuery.of(context).size.width - 16,
                  height: MediaQuery.of(context).size.height / 4,
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
              SizedBox(
                  width: MediaQuery.of(context).size.width - 16,
                  height: MediaQuery.of(context).size.height / 8,
                  child: _presentationCard<ActivityPicker>(
                      ctx: context,
                      color: Colors.lightBlueAccent,
                      content: "bouton principal",
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
                        child: _presentationCard<StatisticsRoute>(
                            ctx: context,
                            color: Colors.orangeAccent,
                            content: "content",
                            materialPageRoute: () => MaterialPageRoute<StatisticsRoute>(
                                builder: (context) =>
                                    const StatisticsRoute()))),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                        child: _presentationCard<DbInteractRoute>(
                            ctx: context,
                            color: Colors.greenAccent,
                            content: "content",
                            materialPageRoute: () => MaterialPageRoute<DbInteractRoute>(
                                builder: (context) => //todo make it a settings route instead
                                    const DbInteractRoute(dbFileName: "blabla.db")))),
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
