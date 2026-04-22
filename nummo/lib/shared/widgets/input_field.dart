import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final bool isRequired;
  final bool isPassword;
  final Widget? suffixIcon; // Para poner el ícono del ojito si hace falta

  const CustomInputField({
    super.key,
    required this.label,
    this.isRequired = false, // Por defecto no es obligatorio
    this.isPassword = false, // Por defecto muestra el texto normal
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. TÍTULO Y ASTERISCO
        RichText(
          text: TextSpan(
            text: label,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            children: [
              if (isRequired)
                const TextSpan(
                  text: ' *',
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
            ],
          ),
        ),
        const SizedBox(height: 8), // Espacio entre el texto y la caja

        // 2. CAJA DE TEXTO
        TextField(
          obscureText: isPassword, // Si es true, pone los puntitos (***)
          decoration: InputDecoration(
            filled: true,
            // Aquí pones el color celestito de fondo de tu diseño
            fillColor: const Color(0xFFB3E5FC), 
            suffixIcon: suffixIcon,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            
            // Borde cuando NO está seleccionado
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.blueAccent, width: 1),
            ),
            // Borde cuando haces tap para escribir
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.blue, width: 2),
            ),
          ),
        ),
        const SizedBox(height: 16), // Espacio final para que no se peguen entre sí
      ],
    );
  }
}