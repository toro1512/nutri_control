import 'package:flutter/material.dart';
import 'package:nutri_control/screens/screens.dart';
import 'package:nutri_control/services/services.dart';
import 'package:nutri_control/share_preferences/preferences.dart';
import 'package:nutri_control/themes/app_theme.dart';
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
      ChangeNotifierProvider(create: (_)=>AlimentosService())
    ],
    child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: NotificationsService.messengerKey,
      title: 'Material App',
      initialRoute: 'alimentos',
      routes: {
        'login': ( _ ) => const LoginScreen(),
        'home':( _ ) => const HomeScreen(),
        'register':( _ ) => const RegisterScreen(),
        'checking':( _ ) => const CheckAuthScreen(),
        'alimentos':( _ ) => const AlimenstosScreen(),
        'estadisticas':( _ )=> const EstadisticasScreen(),
        'detalleAli':( _ ) => const DetallesAlimentosScreen(),
      },

      theme: AppTheme.lightTheme,
    );
  }
}