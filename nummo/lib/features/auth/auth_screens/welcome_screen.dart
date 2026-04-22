import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:nummo/shared/widgets/custom_button.dart';
import 'package:nummo/features/auth/auth_screens/register_screen.dart'; 
import 'package:nummo/features/auth/auth_screens/login_screen.dart'; 


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold es el lienzo en blanco de toda pantalla de Flutter
    return Scaffold(
      // Usamos un color hexadecimal para el fondo celeste. 
      // En Flutter, "0xFF" indica opacidad total, seguido del código de color.
      backgroundColor: const Color(0xFF8DE2FF), 
      
      // SafeArea evita que el diseño se meta debajo del notch del reloj o la batería del celular
      body: SafeArea(
        child: Padding(
          // Un padding general para que nada quede pegado a los bordes de la pantalla
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            // Column apila las cosas de arriba hacia abajo
            crossAxisAlignment: CrossAxisAlignment.stretch, // Estira los botones a lo ancho
            children: [
              
              // TÍTULO SUPERIOR
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Bienvenido...',
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

              // 2. EL LOGO CENTRAL
              // Como aún no hemos configurado imágenes reales, simulamos el logo 
              // con un círculo blanco y un ícono de Flutter.
              Container(
                height: 250,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(
                    'assets/logo.png',
                    width: 150,
                    height: 150,
                  ),
                ),
              ),

              const SizedBox(height: 40), 

              // 3. TEXTO CENTRAL
              Text(
                '¿Listo para emprender\neste viaje?', // \n hace un salto de línea
                textAlign: TextAlign.center,
                style: GoogleFonts.lexend(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const Spacer(), // Otro resorte para empujar los botones hacia abajo

              // 4. BOTÓN DE INICIAR SESIÓN (Tu Widget Reutilizable)
              CustomButton(
                text: 'Iniciar Sesión',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(), // <-- Aquí llamas a tu pantalla
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),

              // 5. TEXTO PEQUEÑO ENTRE BOTONES
              Text(
                '¿No tienes una cuenta?',
                textAlign: TextAlign.center,
                style: GoogleFonts.lexend(
                  color: Colors.blueAccent, 
                  fontSize: 12,
                  fontWeight: FontWeight.w600
                ),
              ),

              const SizedBox(height: 8),

              // 6. BOTÓN DE REGISTRO
              CustomButton(
                text: 'Registrarse',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen(), // <-- Aquí llamas a tu pantalla
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