import 'package:flutter/material.dart';
import 'package:nutri_control/services/services.dart';
import 'package:nutri_control/ui/input_decorations.dart';
import 'package:nutri_control/widgets/widgets.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
   
  const RegisterScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child:SingleChildScrollView(
         child: Column(
          children:  [
           
             const SizedBox(height: 100),
           
             CardContainer(child:  Column(
               children: [
                
                 const SizedBox(height: 10),
                 Text('Registro ', style: Theme.of(context).textTheme.headline5),

                  const _FormLogin(),
               ],
             ),),

             const SizedBox(height: 50),

              TextButton(
                onPressed: () => Navigator.pushReplacementNamed(context, 'login'), 
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all( Colors.indigo.withOpacity(0.1)),
                  shape: MaterialStateProperty.all(const  StadiumBorder() )
                ),
                child: const Text('¿Ya tienes una cuenta?', style: TextStyle( fontSize: 18, color: Colors.black87 ),)
              ),
              const SizedBox( height: 50 ),
            ],
           )
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
              onPressed: () async {
                final authService = Provider.of<AuthService>(context, listen: false);
                final String? errorMessage = await authService.createrUser('toro@gmail.com', '123456');

                if ( errorMessage == null ) {
                  Navigator.pushReplacementNamed(context, 'home');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
                  
                }
                

                },
              child: Container(
                padding: const EdgeInsets.symmetric( horizontal: 40, vertical: 15),
                child: const Text('Registrarse',
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

