import 'package:flutter/material.dart';
import 'package:nutri_control/widgets/widgets.dart';

class ComidasScreen extends StatelessWidget {
   
  const ComidasScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
             children: const [
               Text('Carga tus Comidas'),
               SizedBox(height: 5),
               CardTable(),
               SizedBox(height: 5),
             ],
      ),
     );
  }
}