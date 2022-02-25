
import 'package:shared_preferences/shared_preferences.dart';

class Preferences{

  static late SharedPreferences _prefs;
  static String name='';
  static bool isDarkmode=false;
  static bool primeraVez= false;

  static Future init () async {
    _prefs = await SharedPreferences.getInstance();
  }
}