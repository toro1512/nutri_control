import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {

  final IconData iconUno, iconDos, iconTres;
  final IconData? iconCuatro;
  final String labelUno, labelDos, labelTres;
  final String? labelCuatro;
  const CustomBottomNavigation({Key? key, 
      required this.iconUno,
      required this.labelUno,
      required this.iconDos,
      required this.labelDos,
      required this.iconTres,
      required this.labelTres,
       this.iconCuatro,
       this.labelCuatro,
      
       }) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items:  [
        
        BottomNavigationBarItem(
          icon: Icon(iconUno ),
          label: labelUno
        ),
        BottomNavigationBarItem(
          icon: Icon( iconDos ),
          label: labelDos
        ),
        BottomNavigationBarItem(
          icon: Icon( iconTres ),
          label: labelTres
        ),
        BottomNavigationBarItem(
          icon: Icon( iconCuatro ),
          label: labelCuatro
        ),
      ],
    );
  }
}