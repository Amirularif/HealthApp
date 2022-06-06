import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthapp/Dashboard.dart';
import 'package:healthapp/Profile/themes.dart';
import 'package:healthapp/Profile/user_preferences.dart';

AppBar buildAppBar(BuildContext context) {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;
  final icon = CupertinoIcons.moon_stars;
  var clr = Colors.white;

  if (isDarkMode){
    clr = Colors.white;
  }else{
    clr = Colors.grey.shade800;
  }
  return AppBar(
    leading: BackButton(
      color: clr,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashboardPage()),
        );
      },
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text('User Profile',
      style: GoogleFonts.pacifico(),
    ),
    titleTextStyle: TextStyle(
        color: clr,
        fontSize: 25.0),
    centerTitle: true,
    actions: [
      ThemeSwitcher(
        builder: (context) => IconButton(
          icon: Icon(icon),
          color: clr,
          onPressed: () {
            final theme = isDarkMode ? MyThemes.lightTheme : MyThemes.darkTheme;
            final switcher = ThemeSwitcher.of(context);
            switcher.changeTheme(theme: theme);
          },
        ),
      ),
    ],
  );
}