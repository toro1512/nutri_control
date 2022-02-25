import 'package:flutter/material.dart';
import 'package:nutri_control/widgets/widgets.dart';

class EstadisticasScreen extends StatelessWidget {
   
  const EstadisticasScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
         child: Text('EstadisticasScreen'),
      ),
      bottomNavigationBar:   CustomBottomNavigation(
        iconUno: Icons.home_max_outlined, labelUno: 'Home',
        iconDos: Icons.bike_scooter_outlined, labelDos: 'Ejercicios',
        iconTres: Icons.food_bank_sharp, labelTres: 'Alimentos', 
        iconCuatro: Icons.padding, labelCuatro: 'Noticias', 
        
        ),
    );
  }
}