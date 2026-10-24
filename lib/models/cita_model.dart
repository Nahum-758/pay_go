// lib/models/cita_model.dart
class Cita {
  final int idCita;
  final DateTime fecHora;
  final String motivo;
  final String estado; // 'PENDIENTE', 'ATENDIDA', 'CANCELADA'

  Cita({
    required this.idCita,
    required this.fecHora,
    required this.motivo,
    required this.estado,
  });
}