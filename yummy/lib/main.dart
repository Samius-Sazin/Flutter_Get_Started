import 'package:flutter/material.dart';
import 'package:yummy/constants.dart';
import 'package:yummy/home.dart';

void main() {
  // runApp() function initializes the app by accepting the root widget
  // in this case an instance of Yummy class or widget
  runApp(const Yummy());
}

class Yummy extends StatefulWidget {
  const Yummy({super.key});

  @override
  State<Yummy> createState() => _YummyState();
}

class _YummyState extends State<Yummy> {
  // create default mode
  ThemeMode themeMode = ThemeMode.light;
  //default color
  ColorSelection colorSelected = ColorSelection.pink;

  // Theme toggle
  void changeThemeMode(bool useLightMode) {
    setState(() {
      themeMode = useLightMode ? ThemeMode.light : ThemeMode.dark;
    });
  }

  // color toggle
  void changeColor(int value) {
    setState(() {
      colorSelected = ColorSelection.values[value];
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Setup default theme

    return MaterialApp(
      title: 'Yummy',

      //debugShowCheckedModeBanner: false, // Uncomment to remove Debug banner
      themeMode: themeMode,
      theme: ThemeData(
        colorSchemeSeed: colorSelected.color,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: colorSelected.color,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),

      home: Home(
        changeTheme: changeThemeMode,
        changeColor: changeColor,
        colorSelected: colorSelected,
      ),
    );
  }
}
