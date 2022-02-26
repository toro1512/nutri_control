import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  const CardTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      
      children: const [
        TableRow(
          
          children: [
            
            _SigleCard( color: Colors.blue, icon: Icons.breakfast_dining, text: 'Desayuno' ,ruta: 'alimentos',),
            _SigleCard( color: Colors.pinkAccent, icon: Icons.lunch_dining_rounded, text: 'Almuerzo',ruta: 'alimentos' ),
          ]
        ),

        TableRow(
          children: [
            _SigleCard( color: Colors.purple, icon: Icons.cloud, text: 'Meriendas',ruta: 'alimentos' ),
            _SigleCard( color: Colors.purpleAccent, icon: Icons.dinner_dining_outlined, text: 'Cena' ,ruta: 'alimentos'),
          ]
        ),
      ],
    );
  }
}


class _SigleCard extends StatelessWidget {

  final IconData icon;
  final Color color;
  final String text;
  final String ruta;

  const _SigleCard({
    Key? key,
    required this.icon,
    required this.color,
    required this.text,
    required this.ruta,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size= MediaQuery.of(context).size;

      return Container(
          margin: const EdgeInsets.all(5),
          child: GestureDetector(
           
            onTap: () => Navigator.pushNamed(context, ruta, arguments: text),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur( sigmaX: 5, sigmaY: 5 ),
                child: Container(
                    height: size.height*0.25,
                    decoration: BoxDecoration(
                          color: const Color.fromRGBO(62, 66, 107, 0.7),
                          borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                       CircleAvatar(
                         backgroundColor: color,
                         child: Icon( icon, size: 20, color: Colors.white, ),
                         radius: 30,
                       ),
                       const SizedBox( height: 5 ),
                       Text( text , style: TextStyle( color: color, fontSize: 12, fontWeight: FontWeight.bold), maxLines: 2, textAlign: TextAlign.center, )
                      ],
                    )
                ),
              ),
            ),
          ),
    );
  }
}


