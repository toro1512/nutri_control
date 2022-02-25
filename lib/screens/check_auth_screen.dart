import 'package:flutter/material.dart';
import 'package:nutri_control/screens/home_screen.dart';
import 'package:nutri_control/services/services.dart';
import 'package:provider/provider.dart';


class CheckAuthScreen extends StatelessWidget {
   
  const CheckAuthScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context, listen: false);
    return  Scaffold(
      body: Center(
         child: FutureBuilder(
           future: authService.readToken(),
           builder: (BuildContext context, AsyncSnapshot<String> snapshot){
                
                if(!snapshot.hasData) 
                {
                  return const Text('');
                }
                if(snapshot.hasData) {
                   Future.microtask((){
                      Navigator.pushReplacement(context,PageRouteBuilder(
                          pageBuilder: (_,__,___)=> const HomeScreen(),
                          transitionDuration: const Duration(seconds: 0)) 
                           );
                   });
                  return const Text('');
                }
                else{
                  Future.microtask((){
                    Navigator.pushReplacement(context,PageRouteBuilder(
                      pageBuilder: (_,__,___)=> const HomeScreen(),
                      transitionDuration: const Duration(seconds: 0)) 
                      );
                  });
                  
                  return Container();
                }
           })
           
      ),
    );
  }
}