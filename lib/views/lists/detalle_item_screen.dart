// lib/views/lists/detalle_item_screen.dart
import 'package:flutter/material.dart';

class DetalleItemScreen extends StatelessWidget {
  final String titulo;
  final String descripcion;

  const DetalleItemScreen({super.key, required this.titulo, required this.descripcion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titulo)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Detalle del Registro', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.indigo)),
            const SizedBox(height: 15),
            Text('Título: $titulo', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Descripción: $descripcion', style: TextStyle(fontSize: 16, color: Colors.grey[700])),
          ],
        ),
      ),
    );
  }
}