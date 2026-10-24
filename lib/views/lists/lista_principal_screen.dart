// lib/views/lists/lista_principal_screen.dart
import 'package:flutter/material.dart';

class ListaPrincipalScreen extends StatelessWidget {
  final List<Map<String, String>> items; // Pasar lista vacía para captura de Estado Vacío

  const ListaPrincipalScreen({super.key, this.items = const []});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Historial de Transacciones')),
      body: items.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.inbox, size: 80, color: Colors.grey),
                  SizedBox(height: 10),
                  Text('No hay elementos registrados', style: TextStyle(fontSize: 18, color: Colors.grey)),
                ],
              ),
            )
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.payment),
                  title: Text(items[index]['titulo'] ?? ''),
                  subtitle: Text(items[index]['descripcion'] ?? ''),
                );
              },
            ),
    );
  }
}