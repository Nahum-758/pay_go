// lib/views/auth/register_screen.dart
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crear Cuenta PayGo')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(decoration: const InputDecoration(labelText: 'Nombre completo', border: OutlineInputBorder())),
            const SizedBox(height: 15),
            TextField(decoration: const InputDecoration(labelText: 'Correo electrónico', border: OutlineInputBorder())),
            const SizedBox(height: 15),
            TextField(obscureText: true, decoration: const InputDecoration(labelText: 'Contraseña', border: OutlineInputBorder())),
            const SizedBox(height: 25),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
              onPressed: () => Navigator.pop(context),
              child: const Text('Registrarse'),
            )
          ],
        ),
      ),
    );
  }
}