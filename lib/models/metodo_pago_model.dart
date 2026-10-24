// lib/models/metodo_pago_model.dart
class MetodoPago {
  final int idMetodo;
  final String tipoTarjeta; // 'DEBITO' o 'CREDITO'
  final String numTarjeta;
  final String fecVencimiento;
  final int cvv;

  MetodoPago({
    required this.idMetodo,
    required this.tipoTarjeta,
    required this.numTarjeta,
    required this.fecVencimiento,
    required this.cvv,
  });
}