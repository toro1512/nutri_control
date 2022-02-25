import 'package:flutter/material.dart';
import 'package:nutri_control/screens/screens.dart';
import 'package:nutri_control/services/services.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
  
    final alimentService = Provider.of<AlimentosService>(context);
     if(alimentService.isLoadingCom ) return const LoadingScreen();

    return Scaffold(
      appBar: AppBar( 
       title: const Text('NutriControl'),),
      body:ListView(children: [
        Container(
          height: 50,
          width: 60,
          color: Colors.redAccent,
        ),
        Row(children: [
           Container(
          height: 50,
          width: 60,
          color: Colors.redAccent,
        ),
         Container(
          height: 50,
          width: 60,
          color: Colors.green,
        ),

        ],)


      ],)
          // Home Body
       
      );
      
   
  }
}

