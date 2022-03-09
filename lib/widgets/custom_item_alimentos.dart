import 'package:flutter/material.dart';
import 'package:nutri_control/models/models.dart';

class CustomItemAlimentos extends StatelessWidget {
  const CustomItemAlimentos({
    Key? key,
    required this.alimento,
  }) : super(key: key);

  final Alimentos alimento;

  @override
  Widget build(BuildContext context) {
    
    final size= MediaQuery.of(context).size;

    return Row(
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.green),
          width:80,
          height: 80,),
        const SizedBox(width: 10,)  ,
        ConstrainedBox(
          constraints:  BoxConstraints(maxWidth: size.width-130),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              Text(alimento.name, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold ) ,),
              const SizedBox(height: 10,),
              Text('Kcal:${alimento.kcal} grasas:${alimento.lipids} Kcal:${alimento.kcal} grasas:${alimento.protein} potasio:${alimento.lipids}', maxLines: 2,overflow: TextOverflow.ellipsis,style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.normal )),
           
            ],
          ),
        ),
      ],
    );
  }
}