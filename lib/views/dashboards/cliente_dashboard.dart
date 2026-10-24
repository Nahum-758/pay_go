// lib/views/dashboards/cliente_dashboard.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/paygo_provider.dart';
import '../services/anadir_servicio_screen.dart';
import '../services/metodos_pago_screen.dart';
import '../auth/login_screen.dart';

class ClienteDashboard extends StatelessWidget {
  const ClienteDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PayGoProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF0D2564),
      appBar: AppBar(
        title: Text('Bienvenido: ${provider.usuarioActual?.nombre ?? 'Cliente'}'),
        backgroundColor: const Color(0xFF0D2564),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              provider.logout();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Contenedor de Saldo Disponible (Reflejando tus wireframes)
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Saldo Disponible: \$${provider.saldoDisponible.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Panel de Opciones Rápidas
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(), // <-- Faltaban los paréntesis aquí ()
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: [
                _buildCard(context, Icons.note_add, 'Añadir servicio', () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const AnadirServicioScreen()));
                }),
                _buildCard(context, Icons.payment, 'Métodos de Pago', () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const MetodosPagoScreen()));
                }),
                _buildCard(context, Icons.list_alt, 'Servicios activos', () {
                  _mostrarServicios(context, provider);
                }),
                _buildCard(context, Icons.history, 'Historial de pago', () {
                  _mostrarHistorial(context);
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: const Color(0xFF0D2564)),
            const SizedBox(height: 10),
            Text(title, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  void _mostrarServicios(BuildContext context, PayGoProvider provider) {
    showModalBottomSheet(
      context: context,
      builder: (_) => ListView.builder(
        itemCount: provider.servicios.length,
        itemBuilder: (ctx, i) {
          final s = provider.servicios[i];
          return ListTile(
            title: Text(s.nombreServicio),
            subtitle: Text('Contrato: ${s.numContratoReferencia} - Pendiente: \$${s.saldoPendiente}'),
            trailing: ElevatedButton(
              child: const Text('Pagar'),
              onPressed: () {
                provider.realizarPago(s.saldoPendiente);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Pago realizado exitosamente')));
              },
            ),
          );
        },
      ),
    );
  }

  void _mostrarHistorial(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Historial de Pagos'),
        content: const Text('Transacciones realizadas de forma exitosa y guardadas correctamente en la base de datos.'),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cerrar'))],
      ),
    );
  }
}