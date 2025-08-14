import 'package:flutter/material.dart';
import 'package:todo_evently/Core/Color/dark_colors.dart';
import 'package:todo_evently/Core/Color/light_colors.dart';
import 'package:todo_evently/Core/Color/main_colors.dart';

MainColors light=LightColors();
MainColors dark=DarkColors();

class AppTheming{
    static final ThemeData lightTheme=ThemeData(
      scaffoldBackgroundColor: light.getBackgroundColor(),
        appBarTheme: AppBarTheme(
          backgroundColor: light.getBackgroundColor(),
        )
    );

    static final ThemeData darkTheme=ThemeData(
      scaffoldBackgroundColor: dark.getBackgroundColor(),
      appBarTheme: AppBarTheme(
        backgroundColor: dark.getBackgroundColor(),
      )
    );
}