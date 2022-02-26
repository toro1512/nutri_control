
import 'package:shared_preferences/shared_preferences.dart';

class Preferences{

  static late SharedPreferences _prefs;

  static  bool _seccion= false;
  static  bool _isDarkmode=false;
  static  bool _primeraVez= true;

  static Future init () async {
    _prefs = await SharedPreferences.getInstance();
  }


static bool get seccion{
  return _prefs.getBool('seccion') ?? _seccion;
  }

static set seccion (bool value){
  _prefs.setBool('seccion', value);
}
static bool get isDarkmode{
  return _prefs.getBool('isDarkmode') ?? _isDarkmode; 
}

static set isDarkmode (bool value){
  _prefs.setBool('isDarkmode', value);
}
static bool get primeraVez{
  return _prefs.getBool('primeraVez') ?? _primeraVez; 
}

static set primeraVez(bool value){
  _prefs.setBool('primeraVez', value);
}

}