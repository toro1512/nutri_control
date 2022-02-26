import 'package:flutter/material.dart';


class AppTheme{
 
 static const Color primary = Color.fromRGBO(50, 97, 133, 1);

 static final ThemeData lightTheme = ThemeData.light().copyWith(
    
    primaryColor: const Color.fromRGBO(50, 97, 133, 1),

    appBarTheme: const AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      color: primary,
      elevation:0
    ),
    scaffoldBackgroundColor: Colors.grey[300],
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: Colors.white,
      unselectedIconTheme: IconThemeData(
        color: Colors.white,
        opacity: 1),
      
      backgroundColor:  Color.fromRGBO(50, 97, 133, 1),
      unselectedItemColor:  Colors.white,
      selectedIconTheme: IconThemeData(
        color: Colors.white,
        opacity: 1,

      ),

    ),

 );
 static final ThemeData darkTheme = ThemeData.dark().copyWith(
    
    primaryColor: const Color.fromRGBO(50, 97, 133, 1),

    appBarTheme: const AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      color: primary,
      elevation:0
    ),
    scaffoldBackgroundColor: Colors.grey[300],
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: Colors.white,
      unselectedIconTheme: IconThemeData(
        color: Colors.white,
        opacity: 1),
      
      backgroundColor:  Color.fromRGBO(50, 97, 133, 1),
      unselectedItemColor:  Colors.white,
      selectedIconTheme: IconThemeData(
        color: Colors.white,
        opacity: 1,

      ),

    ),

 );

}