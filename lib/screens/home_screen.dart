import 'package:flutter/material.dart';
import 'package:nutri_control/provider/general_provider.dart';
import 'package:nutri_control/screens/screens.dart';
import 'package:nutri_control/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeScreenBody(),
      bottomNavigationBar: const  CustomBottomNavigation(),
    );
  }
}
class _HomeScreenBody extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final generalProvider = Provider.of<GeneralProvider>(context);
    // Cambiar para mostrar la pagina respectiva
    final currentIndex = generalProvider.indexBottom;

    
    switch( currentIndex ) {

      case 0:
        return const PrincipalScreen();

      case 1: 
         return const ComidasScreen();
      case 2:
         return const FisicasScreen();

      case 3: 
         return const EstadisticasScreen();

      default:
        return const PrincipalScreen();
    }


  }
}