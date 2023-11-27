import 'package:flutter/material.dart';
import 'package:productos_app/UI/input_decoration.dart';
import 'package:productos_app/providers/login_provider.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
   
  const RegisterScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [

              const SizedBox(height: 250),

              CardContainer(
                child: Column(
                  children: [

                    const SizedBox(height: 10),
                    Text('Crear cuenta', style: Theme.of(context).textTheme.headlineMedium),
                    const SizedBox(height: 30),

                    ChangeNotifierProvider(
                      create: (_) => LoginProvider(),
                      child: _LogginForm(),
                      ),
                    
                  ],
                ),
              ),

              const SizedBox(height: 60),
              TextButton(
                child: const Text('¿Ya tienes una cuenta?', style: TextStyle(fontSize: 18, color: Colors.black87)),
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all( Colors.indigo.withOpacity(0.1) ),
                  shape: MaterialStateProperty.all( const StadiumBorder() )
                ),
                onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
              ),
              const SizedBox(height: 60),
            ],
          ),
        )
      )
    );
  }
}

class _LogginForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final loginForm = Provider.of<LoginProvider>(context);

    return Container(
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [

            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'hogn.doe@gmail.com',
                labelText: 'Email',
                prefixIcon: Icons.alternate_email_rounded
              ),
              onChanged: (value) => loginForm.email = value,
              validator: (value) {
                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp  = new RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                  ? null
                  : 'The Email is not correct';
              },
            ),

            const SizedBox(height: 30),

            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: '*****',
                labelText: 'Password',
                prefixIcon: Icons.lock_outline
              ),
              onChanged: (value) => loginForm.password = value,
              validator: (value) {
                return (value != null && value.length >= 6)
                 ? null
                 : 'The password must be at least 6 characters long';
              },
            ),

            const SizedBox(height: 30),

            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 5,
                color: Colors.deepPurple,
                // ignore: sort_child_properties_last
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: Text(
                    loginForm.isLoading
                    ? 'Por favor espere...'
                    : 'Login', 
                    style: const TextStyle(color: Colors.white)
                    ),
                ),
              onPressed: loginForm.isLoading ? null : () async {

                //Para quitar el teclado en pantalla
                FocusScope.of(context).unfocus();
                final authService = Provider.of<AuthService>(context, listen: false);

                if(!loginForm.isValidForm()) return;

                loginForm.isLoading = true;

                final String? errorMessage = await authService.createUser(loginForm.email, loginForm.password);

                if( errorMessage == null){
                  Navigator.pushReplacementNamed(context, 'home');
                }else{
                 loginForm.isLoading = false; 
                }
              },
            )

          ],
        ),
      ),
    );
  }
}