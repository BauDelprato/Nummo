import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nummo/features/auth/auth_screens/login_screen.dart';

import 'package:nummo/shared/widgets/custom_button.dart';
import 'package:nummo/shared/widgets/input_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8DE2FF), 
      
      body: SafeArea(
        child: Padding(
         
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            // Column apila las cosas de arriba hacia abajo
            crossAxisAlignment: CrossAxisAlignment.stretch, // Estira los botones a lo ancho
            children: [
              
              // TÍTULO SUPERIOR
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Crear Cuenta:',
                  style: GoogleFonts.lexend(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              
              const Spacer(), 

              //BOTÓN REGISTRARSE CON GOOGLE
              CustomButton(
                text: 'Registrarse con Google',
                onPressed: () {
                  // Aquí irá el código para registrar con Google
                  print('Registrar con Google');
                },
              ),
              const Spacer(), 

              //input nombre
              const CustomInputField(
                label: 'Nombre Completo',
                isRequired: true,
              ),

              //INPUT CONTRASEÑA 
              const CustomInputField(
                label: 'Contraseña',
                isRequired: true,
              ),

              //CONFIRMAR CONTRASEÑA
              const CustomInputField(
                label: 'Confirmar Contraseña',
                isRequired: true,
              ),
              //input correo
              const CustomInputField(
                label: 'Correo Electrónico',
                isRequired: true,
              ),
              

              // 6. BOTÓN DE REGISTRO
              CustomButton(
                text: 'Registrarse',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(), 
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}