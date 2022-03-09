import 'package:flutter/material.dart';
import 'package:nutri_control/screens/screens.dart';
import 'package:nutri_control/widgets/widgets.dart';
import 'package:charts_flutter/flutter.dart' as charts;


class PrincipalScreen extends StatelessWidget {
  const PrincipalScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
  
   
    

    return Scaffold(
      appBar: AppBar( 
        title: const Text('NutriControl'),
        actions: [
          PopupMenuButton<int>(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))
              ),
            color: Colors.grey,            
            onSelected: (item)=> _onSelected(context, item),
            itemBuilder: (context)=>[
              PopupMenuItem(
                value: 0,
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Row(
                         children:const[
                           Icon(Icons.settings, color: Colors.black),
                           SizedBox(width:8),
                           Text('Setting', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                         ],
                       ),
                ),
               ),
               PopupMenuItem(
                value: 1,
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Row(
                         children:const[
                           Icon(Icons.person, color: Colors.black),
                           SizedBox(width:8),
                           Text('Perfil', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                         ],
                       ),
                ),
               ),
              PopupMenuItem(
                value: 2,
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Row(
                         children:const[
                           Icon(Icons.logout, color: Colors.black),
                           SizedBox(width:8),
                           Text('Cerrar Sesion', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                         ],
                       ),
                ),
               ),
                

            ])
        ],
      ),
       body: const BodyHome(),
      
      
    );
          // Home Body
       
      
      
   
  }
}

void _onSelected(BuildContext context, int item) {
  
  switch(item){

    case 0:
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context)=> const EstadisticasScreen()),
      );
      break;
     case 1:
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context)=> const LoginScreen()),
      );
      break;  
  }

}

class BodyHome extends StatelessWidget {
  const BodyHome({
    Key? key,
  }) : super(key: key);
  
  static final List<GraficCalorias> caloriasData=[
    GraficCalorias('Consumidas',50, Colors.red),
    GraficCalorias('Quemadas',70, Colors.blue)
  ];

  @override
  Widget build(BuildContext context) {
    
    List <charts.Series<GraficCalorias, String>> series =[
      charts.Series(
        id: "Calorias",
        data: caloriasData,
        domainFn: (GraficCalorias calorias, _ )=> calorias.calorias,
        measureFn: (GraficCalorias calorias, _ )=> calorias.cantidad,
        colorFn: (GraficCalorias calorias, _ )=> 
        charts.ColorUtil.fromDartColor(calorias.barraColor),
        labelAccessorFn: (GraficCalorias calorias, _ ) => '${calorias.calorias} :${calorias.cantidad.toString()} '
        )

    ];
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration:_decorationGra() ,
              child: Column(
                children: [
                  const Text('Tu Historial Calorico'),
                  const SizedBox(height: 5),
                  SizedBox(
                     height: 100,
                     width: double.infinity,
                    child: charts.BarChart(
                      series,
                      vertical: false,
                      barRendererDecorator:  charts.BarLabelDecorator<String>(),
                      domainAxis: const charts.OrdinalAxisSpec(renderSpec: charts.NoneRenderSpec()),
                    ),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
            const SizedBox(height: 5),
             Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration:_decorationGra() ,
              width: double.infinity,
              child: Column(
                children: const [
                  Text('Carga tus Comidas'),
                  SizedBox(height: 5),
                  CardTable(),
                  SizedBox(height: 5),
                ],
              ),
            ),
            const SizedBox(height: 5),
             Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration:_decorationGra() ,
              width: double.infinity,
              child: Column(
                children: [
                  const Text('Carga Actividad Fisica'),
                  const SizedBox(height: 5),
                  GestureDetector(
                    onTap: () {},
                   child:Container(
                     padding: const EdgeInsets.symmetric(horizontal: 10),
                     width: double.infinity,
                     height: 50,
                     decoration: BoxDecoration( color:Colors.grey,borderRadius: BorderRadius.circular(10),),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children:const[
                         Text('Recreacional', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                         Icon(Icons.add_box, size: 30),
                       ],

                     ),

                    )
                   ),
                  const SizedBox(height: 5),
                  GestureDetector(
                    onTap: () {},
                    child:Container(
                     padding: const EdgeInsets.symmetric(horizontal: 10),
                     alignment: FractionalOffset.center, 
                     width: double.infinity,
                     height: 50,
                     decoration: BoxDecoration( color:Colors.grey,borderRadius: BorderRadius.circular(10),),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children:const[
                         Text('Trabajo', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                         Icon(Icons.add_box, size: 30),
                       ],

                     ),
                    )
                  ),
                  
                  const SizedBox(height:10),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
   
  BoxDecoration _decorationGra() {
    return BoxDecoration( 
        color:Colors.white,borderRadius: BorderRadius.circular(25),
        boxShadow:const [
        BoxShadow(
         color: Colors.black12,
         blurRadius: 15,
         offset: Offset(0, 5),
        )
       ]  
    );
  }
}
class GraficCalorias{
  
  final String calorias;
  final int cantidad;
  final Color  barraColor;

  GraficCalorias(this.calorias, this.cantidad, this.barraColor);
}

