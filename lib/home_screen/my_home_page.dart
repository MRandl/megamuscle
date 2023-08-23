import 'package:flutter/material.dart';
import 'package:megamuscle/colors.dart';
import 'package:megamuscle/home_screen/containerized_plotter.dart';
import 'package:megamuscle/home_screen/home_button.dart';
import 'package:megamuscle/settings/settings.dart';
import 'package:megamuscle/statistics/statistics.dart';
import 'package:megamuscle/training/activity_picker.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  MaterialPageRoute<ActivityPickerRoute> goToEntrainement() {
    return MaterialPageRoute<ActivityPickerRoute>(
        builder: (context) => const ActivityPickerRoute());
  }

  MaterialPageRoute<StatisticsRoute> goToStats() {
    return MaterialPageRoute<StatisticsRoute>(builder: (context) => const StatisticsRoute());
  }

  MaterialPageRoute<SettingsRoute> goToSettings() {
    return MaterialPageRoute<SettingsRoute>(builder: (context) => const SettingsRoute());
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

              const ContainerizedPlotter(color: firstPlotColor),
              const SizedBox(
                height: 8,
              ),
              const ContainerizedPlotter(color: secondPlotColor),
              const SizedBox(
                height: 8,
              ),
              HomeButton(
                  width: MediaQuery.of(context).size.width - 16,
                  height: MediaQuery.of(context).size.height / 8,
                  shadowColor: trainingShadow,
                  colorGradient: trainingGradient,
                  title: "Commencer l'entraînement",
                  toNext: goToEntrainement),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width - 16,
                      child: Row(children: [
                        Expanded(
                            child: HomeButton(
                                shadowColor: homeBottomShadow,
                                colorGradient: homeBottomGradient,
                                title: "Stats",
                                toNext: goToStats)),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                            child: HomeButton(
                                shadowColor: homeBottomShadow,
                                colorGradient: homeBottomGradient,
                                title: "Settings",
                                toNext: goToSettings))
                      ]))),
              const SizedBox(
                height: 8,
              )
            ],
          ),
        ));
  }
}
