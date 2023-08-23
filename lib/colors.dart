import 'package:flutter/material.dart';

const Color firstPlotColor = Color.fromARGB(255, 89, 92, 241);
const Color secondPlotColor = Color.fromARGB(255, 53, 184, 255);

const Color startGradientColor  = Color.fromARGB(255, 100, 255, 255);
const Color middleGradientColor = Color.fromARGB(255, 77, 199, 243);
const Color bottomGradientColor = Color.fromARGB(255, 0, 100, 150);

const Gradient trainingGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [startGradientColor, middleGradientColor]);
const Color trainingShadow = middleGradientColor;

const Gradient homeBottomGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [middleGradientColor, bottomGradientColor]);
const Color homeBottomShadow = bottomGradientColor;