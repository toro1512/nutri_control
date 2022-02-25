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
            
            _SigleCard( color: Colors.blue, icon: Icons.border_all, text: 'Carga Alimenticias' ,ruta: 'alimentos',),
            _SigleCard( color: Colors.pinkAccent, icon: Icons.car_rental, text: 'Actividad Fisica',ruta: 'alimentos' ),
          ]
        ),

        TableRow(
          children: [
            _SigleCard( color: Colors.purple, icon: Icons.shop, text: 'Noticias',ruta: 'alimentos' ),
            _SigleCard( color: Colors.purpleAccent, icon: Icons.cloud, text: 'Estadisticas' ,ruta: 'estadisticas'),
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
          margin: const EdgeInsets.all(15),
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(context, ruta),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur( sigmaX: 5, sigmaY: 5 ),
                child: Container(
                  height: size.height*0.3,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(62, 66, 107, 0.7),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: color,
              child: Icon( icon, size: 35, color: Colors.white, ),
              radius: 30,
            ),
            const SizedBox( height: 10 ),
            Text( text , style: TextStyle( color: color, fontSize: 16,  ), maxLines: 2, textAlign: TextAlign.center, )
          ],
        )
            ),
                  ),
                ),
          ),
    );
  }
}


