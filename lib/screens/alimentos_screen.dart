import 'package:flutter/material.dart';
import 'package:nutri_control/provider/provider.dart';
import 'package:nutri_control/search/search_delegate.dart';
import 'package:nutri_control/widgets/widgets.dart';
import 'package:provider/provider.dart';


class AlimenstosScreen extends StatelessWidget {
   
  const AlimenstosScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final mProvider = Provider.of<GeneralProvider>(context);
      
      final String _titulo = ModalRoute.of(context)!.settings.arguments as String;
      int mostrar=mProvider.almuerzosList.length;
      return  Scaffold(
      appBar: AppBar(
        title: Text(_titulo),
        actions: [      
          Container(
             padding: const EdgeInsets.all(10),
             decoration: const BoxDecoration(shape: BoxShape.circle,color:Colors.red),
             margin:const  EdgeInsets.symmetric(horizontal: 10),
             child: Center(child: Text('$mostrar', style: const TextStyle(color: Colors.white),)),
         )
        ],
      ),
      body: SingleChildScrollView(child: 
         Column( children: [
            Padding(
             padding: const EdgeInsets.all(8.0),
             child: TextField(
               style: const TextStyle(fontSize: 14),
               autocorrect: true,
               onTap: () => showSearch(context: context, delegate: AlimentosSearchDelegate()),
               decoration: InputDecoration(
                 isDense: true,
                 contentPadding: const EdgeInsets.all(4), 
                 hintText: 'Buscar Alimentos',
                 border: const OutlineInputBorder(),
                 prefixIcon: IconButton(icon: const Icon(Icons.search_rounded) ,
                  onPressed: () => showSearch(context: context, delegate: AlimentosSearchDelegate()),
                   )
               ),
              
             ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
                child: Column(
                      children:[
                        SizedBox(height: 5,),
                        Text('Alimentos en el Desayuno', style: TextStyle(fontSize: 14),),
                        SizedBox(height:10),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                          child: Container(
                            height: 200,
                            child: ListView.builder(
                               itemCount: 10,
                               shrinkWrap: true,
                               itemExtent: 60,
                               itemBuilder: (_, index) => 
                               Container(
                                 margin: EdgeInsets.symmetric(vertical: 3, horizontal:1,),
                                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.red),
                                 padding: EdgeInsets.only(left: 10, top:5),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [  
                                     Column(
                                       children: [
                                       Expanded(child: Text(_titulo, style: TextStyle(fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis,)),
                                       SizedBox(height: 3,),
                                       Text('consumo 150 gr', style: TextStyle(fontSize: 10),),
                                     
                                     ],
                                       ),
                                     IconButton(
                                       onPressed:(){},
                                        icon: Icon(Icons.clear_rounded))
                                   ],
                                 ),
                               ),
                       ),
                          ),
                        ),

                      ]

                )
              ),
            ),
            Container(


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