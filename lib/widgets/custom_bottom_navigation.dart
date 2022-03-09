import 'package:flutter/material.dart';
import 'package:nutri_control/provider/provider.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigation extends StatelessWidget {

  
  const CustomBottomNavigation({Key? key, }) : super(key: key);

  
  @override
  Widget build(BuildContext context) {

    final generalProvider= Provider.of<GeneralProvider>(context);
    final currentIndexBo =generalProvider.indexBottom;
    return BottomNavigationBar(
      onTap: (int i)=>generalProvider.indexBottom=i,
      currentIndex: currentIndexBo,
      type: BottomNavigationBarType.fixed,
      items: const [
        
        BottomNavigationBarItem(

          icon: Icon(Icons.home_max_outlined ),
          label: 'Home'
        ),
         BottomNavigationBarItem(
          icon: Icon( Icons.note_alt),
          label: 'Recomendaciones'
        ),
        BottomNavigationBarItem(
          icon: Icon( Icons.food_bank_sharp ),
          label: 'Estadisticas'
        ),
       
      ],
    );
  }
}