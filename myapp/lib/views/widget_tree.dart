import 'package:flutter/material.dart';
import 'package:myapp/data/constants.dart';
import 'package:myapp/data/notifiers.dart';
import 'package:myapp/views/pages/home_page.dart';
import 'package:myapp/views/pages/profile_page.dart';
import 'package:myapp/views/pages/settings_page.dart';
import 'package:myapp/widgets/navbar_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Widget> pages = [HomePage(), ProfilePage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Mapp"),
        centerTitle: true,
        actions: [
          //Dark/Light mode
          IconButton(
            onPressed: () async {
              isDarkModeNotifier.value = !isDarkModeNotifier.value;
              final SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setBool(KConstant.themeModeKey, isDarkModeNotifier.value);
            },
            icon: ValueListenableBuilder(
              valueListenable: isDarkModeNotifier,
              builder: (context, isDarkMode, child) {
                return isDarkMode
                    ? Icon(Icons.light_mode)
                    : Icon(Icons.dark_mode_rounded);
              },
            ),
          ),

          // settings button
          IconButton(
            onPressed: () {
              // pushReplacement : no back button, as it replace all other pages, best use cases for auth pages
              // Navigator.pushReplacement(
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SettingsPage(title: "Settings page",);
                  },
                ),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, selectedPage, child) {
          return pages.elementAt(selectedPage);
        },
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
