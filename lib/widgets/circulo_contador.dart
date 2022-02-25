import 'package:flutter/material.dart';

class CirculoContador extends StatelessWidget {
   
  const CirculoContador({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    int mostrar =0;
    return  Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(shape: BoxShape.circle,color:Colors.red),
      margin:const  EdgeInsets.symmetric(horizontal: 10),
      
      child: Center(child: Text('$mostrar', style: const TextStyle(color: Colors.white),)),
    );
  }
}