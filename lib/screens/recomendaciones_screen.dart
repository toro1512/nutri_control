import 'package:flutter/material.dart';
import 'package:nutri_control/widgets/widgets.dart';

class RecomendacionesScreen extends StatelessWidget {
   
  const RecomendacionesScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
             children: const [
               Text('Recomenfaciones'),
               SizedBox(height: 5),
               CardTable(),
               SizedBox(height: 5),
             ],
      ),
     );
  }
}