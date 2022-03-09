import 'package:flutter/material.dart';

import 'package:nutri_control/models/models.dart';
import 'package:nutri_control/provider/provider.dart';
import 'package:nutri_control/search/search_delegate.dart';
import 'package:provider/provider.dart';


class AlimenstosScreen extends StatelessWidget {
   
  const AlimenstosScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
   
    List<Alimentos> aux=[];
    List<Alimentos> auxSuger=[]; 

    final generalProvider = Provider.of<GeneralProvider>(context);
      
      final String _titulo = ModalRoute.of(context)!.settings.arguments as String;
      generalProvider.tituloG=_titulo;

      switch( _titulo ) {

      case 'Almuerzo':
        aux=generalProvider.almuerosLista;
        auxSuger=generalProvider.almuerosSuge;
        break;
      case 'Cena': 
          aux=generalProvider.cenasLista;
          auxSuger=generalProvider.cenasSuge;
        break;
      case 'Desayuno': 
          aux=generalProvider.desayunosLista;
          auxSuger=generalProvider.desayunosSuge;
        break;
      case 'Meriendas': 
          aux=generalProvider.meriendasLista;
          auxSuger=generalProvider.meriendasSuge;
        break;
   
    }
      int mostrar=aux.length;
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
               readOnly: true,
               style: const TextStyle(fontSize: 14),
               onTap: () {

                 showSearch(context: context, delegate: AlimentosSearchDelegate(titulo: _titulo));
              
              },
               decoration: InputDecoration(
                 isDense: true,
                 contentPadding: const EdgeInsets.all(4), 
                 hintText: 'Buscar Alimentos',
                 border: const OutlineInputBorder(),
                 prefixIcon: IconButton(icon: const Icon(Icons.search_rounded) ,
                  onPressed: () => showSearch(context: context, delegate: AlimentosSearchDelegate(titulo: _titulo)),
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
                        if(aux.isNotEmpty) ...[
                       const  SizedBox(height: 5,),
                       const  SizedBox(height:10),
                         Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                          child: SizedBox(
                            height: 200,
                            child: ListView.builder(
                               itemCount: aux.length,
                               shrinkWrap: true,
                               itemExtent: 60,
                               itemBuilder: (_, index) => 
                               Container(
                                
                                 margin:const EdgeInsets.symmetric(vertical: 3, horizontal:1,),
                                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.red),
                                 padding:const  EdgeInsets.only(left: 10, top:5),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [  
                                     Column(
                                       children: [
                                       Expanded(child: Text(aux[index].name, style: const TextStyle(fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis,)),
                                       const SizedBox(height: 3,),
                                       const Text('100 gr', style: TextStyle(fontSize: 10),),
                                     
                                     ],
                                       ),
                                     IconButton(
                                       onPressed:(){},
                                        icon: const Icon(Icons.clear_rounded))
                                   ],
                                 ),
                               ),
                       ),
                          ),
                        ),
                        ]
                        else ...[
                        
                        Container(
                          height: 200,
                          color: Colors.amber,
                          child: 
                          const Center(
                            child: 
                            Text('Cargue Los Alimentos', style: TextStyle(fontSize: 14),))),
                        

                        ] 
                      ]

                )
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
                child: Column(
                      children:[
                        const SizedBox(height: 5,),
                        const Text('Recomdaciones Desayuno', style: TextStyle(fontSize: 14),),
                        const SizedBox(height:10),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                          child: SizedBox(
                            height: 200,
                            child: ListView.builder(
                               itemCount: auxSuger.length,
                               shrinkWrap: true,
                               itemExtent: 60,
                               itemBuilder: (_, index) => 
                               Container(
                                 margin: const EdgeInsets.symmetric(vertical: 3, horizontal:1,),
                                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.red),
                                 padding: const EdgeInsets.only(left: 10, top:5),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [  
                                     Column(
                                       children: [
                                       Expanded(child: Text(auxSuger[index].name, style: const TextStyle(fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis,)),
                                       const SizedBox(height: 3,),
                                       const Text('consumo 150 gr', style: TextStyle(fontSize: 10),),
                                     
                                     ],
                                       ),
                                     IconButton(
                                       onPressed:(){
                                        // generalProvider.addAlmuerzos(auxSuger[index]);
                                        aux.add(auxSuger[index]);
                                        generalProvider.notiCambios();
                                       },
                                       icon: const Icon(Icons.clear_rounded))
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

         ],
           

         )
      ),
     floatingActionButton: FloatingActionButton(onPressed: () {  },)
    );
     
  }
    
 
}