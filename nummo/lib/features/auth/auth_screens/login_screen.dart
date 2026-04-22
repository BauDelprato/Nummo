import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:nummo/shared/widgets/custom_button.dart';
import 'package:nummo/shared/widgets/input_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              
              // El Spacer() funciona como un resorte que empuja los elementos, 
              // distribuyendo el espacio vacío dinámicamente.
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

              const CustomInputField(
                label: 'Correo Electrónico',
                isRequired: true,
              ),

              //INPUT CONTRASEÑA 
              const CustomInputField(
                label: 'Contraseña',
                isRequired: true,
              ),
          

              // 6. BOTÓN DE REGISTRO
              CustomButton(
                text: 'Iniciar Sesión',
                onPressed: () {
                  // Aquí irá el código para navegar a la RegisterScreen
                  print('Ir a Registro');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}