import 'package:flutter/material.dart';
import 'package:nutri_control/search/search_delegate.dart';
import 'package:nutri_control/widgets/widgets.dart';


class AlimenstosScreen extends StatelessWidget {
   
  const AlimenstosScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
      return  Scaffold(
      appBar: AppBar(
        actions: const[
         
           CirculoContador(),
        ],
      ),
      body: SingleChildScrollView(child: 
         Column( children: [
            Padding(
             padding: const EdgeInsets.all(8.0),
             child: TextField(
               autocorrect: true,
               decoration: InputDecoration(
                 hintText: 'Buscar Alimentos',
                 border: const OutlineInputBorder(),
                 prefixIcon: IconButton(icon: const Icon(Icons.search_rounded) ,
                  onPressed: () => showSearch(context: context, delegate: AlimentosSearchDelegate()),
                   )
               ),
              
             ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              color: Colors.red,
            ),

         ],
           

         )
      ),
      
      bottomNavigationBar:  const CustomBottomNavigation(
        iconUno: Icons.home_max_outlined, labelUno: 'Home',
        iconDos: Icons.bike_scooter_outlined, labelDos: 'Ejercicios',
        iconTres: Icons.food_bank_sharp, labelTres: 'Estadisticas', 
        iconCuatro: Icons.padding, labelCuatro: 'Recomendaciones', 
        ),
    );
  }
}