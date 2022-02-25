import 'package:flutter/material.dart';
import 'package:nutri_control/ui/input_decorations.dart';
import 'package:nutri_control/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
   
  const LoginScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child:SingleChildScrollView(
         child: Column(
          children:  [
           
             const SizedBox(height:50),
           
             CardContainer(child:  Column(
               children: [
                
                 const SizedBox(height: 10),
                 Text('Login ', style: Theme.of(context).textTheme.headline5),

                  const _FormLogin(),
               ],
             ),),

             const SizedBox(height: 50),
             TextButton(
                onPressed: () => Navigator.pushReplacementNamed(context, 'register'), 
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all( Colors.indigo.withOpacity(0.1)),
                  shape: MaterialStateProperty.all(const  StadiumBorder() )
                ),
                child: const Text('Crear una nueva cuenta', style: TextStyle( fontSize: 18, color: Colors.black87 ),)
              ),
             const SizedBox(height: 50),
           ],)
          )
         ),
    );
  }
}

class _FormLogin extends StatelessWidget {
  const _FormLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container (
      padding: const EdgeInsets.all(5),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column
        (children: [

          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
              hintText: 'Correo',
              labelText: 'Correo Usuario',
              prefixIcon: Icons.alternate_email_rounded
              ),
                           
           ),

           const  SizedBox( height: 30 ),

            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: '*****',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock_outline
              ),
            ), 
             const  SizedBox( height: 30 ),

             MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.deepPurple,
              onPressed: () {  },
              child: Container(
                padding: const EdgeInsets.symmetric( horizontal: 40, vertical: 15),
                child: const Text('Ingresar',
                  style: TextStyle( color: Colors.white ),
                )
              ),
              ), 
        ],
        ),
      ),
    );
  }
}

