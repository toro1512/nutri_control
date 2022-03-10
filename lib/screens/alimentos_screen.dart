import 'package:flutter/material.dart';

import 'package:nutri_control/models/models.dart';
import 'package:nutri_control/provider/provider.dart';
import 'package:nutri_control/search/search_delegate.dart';
import 'package:nutri_control/themes/app_theme.dart';
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
                        const  SizedBox(height: 10),
                         Text('Tu '+_titulo+' es:', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black) ),
                         Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                          child: SizedBox(
                            height: 220,
                            child: ListView.builder(
                               itemCount: aux.length,
                               shrinkWrap: true,
                               
                               itemBuilder: (_, index) =>
                               _CuerpoListBuil(aux: aux, index:index, generalProvider: generalProvider), 
                               
                            ),
                          ),
                         ),
                        ]
                        else ...[
                        
                        Container(
                          height: 220,
                          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
                          child: 
                          const Center(
                            child: 
                            Text('Lista de Alimentos a Cargar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: AppTheme.primary),))),
                        

                        ] 
                      ]

                )
              ),
            ),
             if(aux.isNotEmpty)
             ElevatedButton.icon(
               style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red), shape:  MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder())),
               icon: const Icon(Icons.ac_unit_outlined), label: Text('Guardar el ' + _titulo, style: const TextStyle(fontSize: 16)),
               onPressed: (){},
               ),
             Text('Sugerencias Para el '+ _titulo, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: 
              ListView.builder(
                
              itemCount: auxSuger.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (_, index) => _CuerpoSugerencias(index:index, auxSuger: auxSuger, aux: aux, generalProvider: generalProvider),
            ),
              /*Container(
                                
                                 margin:const EdgeInsets.symmetric(vertical: 3, horizontal:1,),
                                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.red),
                                 padding:const  EdgeInsets.only(left: 10, top:5),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [  
                                     Column(
                                       children: [
                                       Expanded(child: Text(aux[index].nombre, style: const TextStyle(fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis,)),
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
                                       Expanded(child: Text(auxSuger[index].nombre, style: const TextStyle(fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis,)),
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
              ),*/
            ),

         ],
           

         )
      ),
    
    );
   
     
  }
    
 
}

class _CuerpoSugerencias extends StatelessWidget {
  const _CuerpoSugerencias({
    Key? key,
    required this.auxSuger,
    required this.index,
    required this.aux,
    required this.generalProvider,
  }) : super(key: key);

  final List<Alimentos> auxSuger;
  final List<Alimentos> aux;
  final GeneralProvider generalProvider;
  final int index;

  @override
  Widget build(BuildContext context) {
    Color color=Colors.white;
     switch (auxSuger[index].semaforo) {
       case 1:
         color=Colors.green.shade200;
         break;
        case 2:
         color=Colors.yellow.shade200;
         break;
         case 3:
         color=Colors.red.shade200;
         break;   
     }
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: color),
        child: ListTile(
          onTap: () => Navigator.pushNamed(context, 'detalleAli', arguments: auxSuger[index]),
          contentPadding: const EdgeInsets.only(left: 5,right: 2,top: 2,bottom: 2),
          dense: true,
          title: Text(auxSuger[index].nombre),
          subtitle: Text('cal: '+auxSuger[index].calorias.toString()+' grs: '+auxSuger[index].grasas.toString()+' pro: '+auxSuger[index].proteina.toString() +' car: '+auxSuger[index].carbohidrato.toString() , style: const TextStyle(fontSize: 10)),
          leading: const Icon(Icons.dinner_dining_rounded, color:Colors.red, size:40),
          trailing: IconButton( 
            padding: const EdgeInsets.only(right: 3),
            alignment: Alignment.centerRight,
            icon: const Icon(Icons.add_circle, color: AppTheme.primary,), onPressed: (){
              aux.add(auxSuger[index]);
              generalProvider.notiCambios();
            },),
        
        
        ),
      ),
    );
  }
}

class _CuerpoListBuil extends StatelessWidget {
  const _CuerpoListBuil({
    Key? key,
    required this.aux,
    required this.index,
    required this.generalProvider,
  }) : super(key: key);

  final List<Alimentos> aux;
  final int index;
  final GeneralProvider generalProvider;

  

  @override
  Widget build(BuildContext context) {
    Color color=Colors.white;
     switch (aux[index].semaforo) {
       case 1:
         color=Colors.green.shade200;
         break;
        case 2:
         color=Colors.yellow.shade200;
         break;
         case 3:
         color=Colors.red.shade200;
         break;   
     }
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Dismissible(
        key: UniqueKey(),
        background: Container(
        color: Colors.red,
        child: const Icon(Icons.delete_rounded),),
        onDismissed: (DismissDirection direction){
          generalProvider.borrarAlimento(index, true);        
        },
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: color),
          child: ListTile(
             onTap: () => Navigator.pushNamed(context, 'detalleAli', arguments: aux[index]),
            contentPadding:const EdgeInsets.only(left: 5,right: 2,top: 2,bottom: 2),
            dense: true,
            title: Text(aux[index].nombre,style: const TextStyle(fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis,),
           // subtitle: Text('cal: '+auxSuger[index].calorias.toString()+' grs: '+auxSuger[index].grasas.toString()+' pro: '+auxSuger[index].proteina.toString() +' car: '+auxSuger[index].carbohidrato.toString() , style: TextStyle(fontSize: 10)),
            leading: const Icon(Icons.dining_rounded, color:Colors.red, size:40),
            trailing: IconButton( 
              padding: const EdgeInsets.only(right: 3),
            alignment: Alignment.centerRight,
            icon: const Icon(Icons.close_rounded, color: AppTheme.primary,), onPressed: (){
               generalProvider.borrarAlimento(index, true);
           },),
                    
                    
         ),
        ),
      ), 
    );
  }
}

