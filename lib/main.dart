import 'package:flutter/material.dart';
import 'package:nutri_control/provider/provider.dart';
import 'package:nutri_control/screens/screens.dart';
import 'package:nutri_control/services/services.dart';
import 'package:nutri_control/share_preferences/preferences.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  await Preferences.init(); 
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({ Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,

      ]); 
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>AuthService()),
      ChangeNotifierProvider(create: (_)=>GeneralProvider()),
      ChangeNotifierProvider(create: (_)=>AlimentosService()),
      ChangeNotifierProvider(create: (_)=>ThemeProvider(isDarkmode: Preferences.isDarkmode)),
      
    ],
    child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String  pantalla = 'home';
    if(Preferences.primeraVez){
        pantalla ='home';
      }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: NotificationsService.messengerKey,
      title: 'Material App',
      initialRoute: pantalla,
      routes: {
        'login': ( _ ) => const LoginScreen(),
        'home':( _ ) => const HomeScreen(),
        'register':( _ ) => const RegisterScreen(),
        'checking':( _ ) => const CheckAuthScreen(),
        'alimentos':( _ ) => const AlimenstosScreen(),
        'estadisticas':( _ )=> const EstadisticasScreen(),
        'detalleAli':( _ ) => const DetallesAlimentosScreen(),
      },

      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}