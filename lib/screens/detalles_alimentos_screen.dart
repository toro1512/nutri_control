import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutri_control/models/models.dart';
import 'package:nutri_control/provider/general_provider.dart';
import 'package:provider/provider.dart';

class DetallesAlimentosScreen extends StatefulWidget {
   
  const DetallesAlimentosScreen({Key? key}) : super(key: key);

  @override
  State<DetallesAlimentosScreen> createState() => _DetallesAlimentosScreenState();
}

class _DetallesAlimentosScreenState extends State<DetallesAlimentosScreen> {
  final textController = TextEditingController(); 
  String selectedValue= "gr";
  int indiceConversion=0;
  int buscar=0;
   
@override
void initState() {
  
  textController.text="100";
  super.initState();
  
}

  @override
  Widget build(BuildContext context) {

   final generalProvider=Provider.of<GeneralProvider>(context); 
   final Alimentos alimento = ModalRoute.of(context)!.settings.arguments as Alimentos;
   
   final String  tituloS=generalProvider.tituloG;
   List<String>  itemsS = [];
   void llenar(List<Tipo> lis){
        for (var name in lis) {
          itemsS.add(name.name);
        }
   }
   switch(alimento.semaforo){
        case 0 :
        llenar(generalProvider.tipoLiquido);
        selectedValue = 'ml';
        buscar=0;

        break;
        case 1 :
        llenar(generalProvider.tipoSolido);
        selectedValue = 'gr';
        buscar=1;
        break;
        case 2 :
        llenar(generalProvider.tipoLiquido);
        selectedValue = 'ml';
        buscar=0;
        break;
        case 3 :
        llenar(generalProvider.tipoSolido);
        selectedValue = 'gr';
        buscar=1;
        break;
        case 4 :
        llenar(generalProvider.tipoLiquido);
        selectedValue = 'ml';
        buscar=0;
        break;
        case 5 :
        llenar(generalProvider.tipoLiquido);
        selectedValue = 'ml';
        buscar=0;
        break;
        case 6 :
        llenar(generalProvider.tipoSolido);
        selectedValue = 'gr';
        buscar=1;
        break;
        case 7 :
        llenar(generalProvider.tipoLiquido);
        selectedValue = 'ml';
        buscar=0;
        break;
        case 8 :
        llenar(generalProvider.tipoSolido);
        selectedValue = 'gr';
        buscar=1;
        break;
        case 9 :
        llenar(generalProvider.tipoLiquido);
        selectedValue = 'ml';
        buscar=0;
        
        break;
      }
   

     
    return  Scaffold(
      appBar: AppBar(title: Text(tituloS),),
      body:  CuerpoBody(alimento: alimento), 
      bottomSheet:
        Container(
           height:70,
           padding:const  EdgeInsets.symmetric(horizontal: 10, vertical: 5),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               
               SizedBox(
                 
                 width: 100,
                 child: Center(
                   child: TextFormField(
                   textAlign:TextAlign.center,
                   controller: textController,
                   keyboardType: const TextInputType.numberWithOptions(decimal: true),  
                   onChanged: (value) {
                     
                   },                
                  
                   inputFormatters: [
                     FilteringTextInputFormatter.allow(RegExp(r'^(\d{0,4})?\.?\d{0,2}'))

                   ],))),
               SizedBox(
                
                
                 width: 200,
                 
                 child: DropdownButtonFormField<String>(
                     
                     value: selectedValue,
                     decoration: const InputDecoration(
                     border: OutlineInputBorder( gapPadding: 0,borderRadius: BorderRadius.only(bottomRight:Radius.circular(10), bottomLeft: Radius.circular(10)),), 
                     labelText: 'Unidad a Consumir', 
                      
                     ),
                     onChanged: ( newValue){
                         selectedValue = newValue!;
                           textController.text="5";

                          setState(() {});
                     },
                     items: itemsS.map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                       .toList(),
                     icon:const Icon(Icons.arrow_drop_down),
                     iconSize: 30,
                    
                 ),
               ),
             ],
           ),
      ),
     floatingActionButton: Align(
          child: FloatingActionButton.extended( onPressed: () {},
        icon: const Icon(Icons.save),
        label: const Text("Gargar alimento"),),
          alignment: const Alignment(0.5,0.7)),
     
    
      
     
    );
  }
}


class CuerpoBody extends StatelessWidget {
  const CuerpoBody({
    Key? key,
    required this.alimento,
  }) : super(key: key);

  final Alimentos alimento;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start, 
        children: <Widget>[
        Stack(
          children: [
          Image.asset(
            'assets/fondoDetalle.jpg',
            height:180,
            width:double.infinity,
            fit: BoxFit.cover,
          ),
          Column(
           
            children: [
               const SizedBox(height: 70,),
               Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  padding: const EdgeInsets.symmetric(vertical: 3, horizontal:5),
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,), 
                  child: Text(alimento.nombre, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white), maxLines: 1, overflow: TextOverflow.ellipsis,)),
              ),
            ],
          )
        ],
        ), 
        
        Table(
         
          columnWidths: {
            0:FractionColumnWidth(0.7)
          },
          children: [
            
            TableRow(
              children:[ 
                _EtiquetaTabla(valorEti:'Carbohidratos en la porcion: '),
                _EtiquetaTabla(valorEti: alimento.carbohidrato.toString()+' gr') 
              ]
            ),
            TableRow(
              children:[ 
                _EtiquetaTabla(valorEti:'KCalorias en la porcion: '),
                _EtiquetaTabla(valorEti: alimento.calorias.toString()+' gr') 
              ]
            ),
            TableRow(
              children:[ 
                _EtiquetaTabla(valorEti:'Grasas en la porcion: '),
                _EtiquetaTabla(valorEti: alimento.grasas.toString()+' gr') 
              ]
            ),
            TableRow(
              children:[ 
                _EtiquetaTabla(valorEti:'Proteinas en la porcion: '),
                _EtiquetaTabla(valorEti: alimento.proteina.toString()+' gr') 
              ]
            )
          ],),//Flexible
        SizedBox(height: 50),
       
        ], //<Widget>[]
       
        
        ), //Container
      );
  }
}

class _EtiquetaTabla extends StatelessWidget {
  const _EtiquetaTabla({
    Key? key,
    required this.valorEti,
  }) : super(key: key);

  final String valorEti;

  @override
  Widget build(BuildContext context) {
    return Container(
               
               margin: const EdgeInsets.only(left: 5, right: 5, top: 5 ),
               padding: const EdgeInsets.symmetric(vertical: 3, horizontal:5),
               decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
               color: Colors.black,), 
               child: Text(valorEti , style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white), maxLines: 1, overflow: TextOverflow.ellipsis,));
  }
}
/*Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:  [                      
                    const Text('Kcalorias...'),
                    Text('${alimento.kcal}'),
                    const Text('gr'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [                      
                     const Text('grasas'),
                     Text('${alimento.lipids}'),
                     const Text('gr'),

                  ],
                ),
              ],

            ),

          )
          
 */