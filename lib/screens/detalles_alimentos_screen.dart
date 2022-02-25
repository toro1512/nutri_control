import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutri_control/models/models.dart';

class DetallesAlimentosScreen extends StatefulWidget {
   
  const DetallesAlimentosScreen({Key? key}) : super(key: key);

  @override
  State<DetallesAlimentosScreen> createState() => _DetallesAlimentosScreenState();
}

class _DetallesAlimentosScreenState extends State<DetallesAlimentosScreen> {
   String selectedValue = 'Four';


  @override
  Widget build(BuildContext context) {
    
    final Alimentos alimento = ModalRoute.of(context)!.settings.arguments as Alimentos;
    final items = ['One', 'Two', 'Three', 'Four'];

     
    return  Scaffold(
      appBar: AppBar(title: Text(alimento.name),),
      body:  CuerpoBody(alimento: alimento), 
      bottomSheet:
        Container(
           height: 60,
           padding:const  EdgeInsets.symmetric(horizontal: 10, vertical: 5),
           decoration: BoxDecoration(
                
                 borderRadius: BorderRadius.circular(10)),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               
               Container(
                 
                 width: 100,
                 child: Center(
                   child: TextFormField(
                     
                   autofocus: true,
                   keyboardType: const TextInputType.numberWithOptions(decimal: true),
                   initialValue: '100',
                   inputFormatters: [
                     FilteringTextInputFormatter.allow(RegExp(r'^(\d{0,4})?\.?\d{0,2}'))

                   ],))),
               Container(
                
                
                 width: 200,
                 child: DropdownButtonFormField<String>(
                     
                     value: selectedValue,
                     decoration: const InputDecoration(
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.only(
                         bottomRight:Radius.circular(10) ,
                         bottomLeft: Radius.circular(10)
                         
                       )
                     ), 
                      
                     labelText: 'Cantidad a Consumir', 
                      
                     ),
                     onChanged: ( newValue) =>setState(() => selectedValue = newValue!),
                     items: items.map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                       .toList(),
                     icon:const Icon(Icons.arrow_drop_down),
                     iconSize: 42,
                    
                 ),
               ),
             ],
           ),
      ),

      
      
     
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
        children: <Widget>[
        Stack(
          children: [

          const FadeInImage(
           width: double.infinity,
           height: 200,
           placeholder:  AssetImage('assets/no-image.jpg'),
           image: NetworkImage( 'https://via.placeholder.com/300x400.jpg'),
           fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:  [                      
                    const Text('Kcalorias...'),
                    Text('${alimento.kcalo}'),
                    const Text('gr'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [                      
                     const Text('grasas...'),
                     Text('${alimento.grasas}'),
                     const Text('gr'),

                  ],
                ),
              ],

            ),

          )
          

         ],
         
         
        ), //Flexible
        const SizedBox(
          height: 20,
        ), //SixedBox
        Container(
          width: 380,
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue), //BoxDecoration
        ), //Flexible
        const SizedBox(
          height: 20,
        ), //SixedBox
        Row(
          children: <Widget>[
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Container(
                child:const Text('hollaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'),
                width: 180,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.cyan,
                ), //BoxDecoration
              ), //Container
            ), //Flexible
            const SizedBox(
              width: 20,
            ), //SizedBox
            Container(
                child: Text(alimento.name),
                width: 180,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.cyan,
                  
                ) //BoxDecoration
                ) //Flexible
          ], //<Widget>[]
          mainAxisAlignment: MainAxisAlignment.center,
        ), //Flexible
        
         const SizedBox(
              width:150),        
        ], //<Widget>[]
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        
        ), //Container
      );
  }
}