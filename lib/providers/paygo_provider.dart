import 'package:flutter/material.dart';
import '../models/usuario_model.dart';
import '../models/servicio_model.dart';
import '../models/metodo_pago_model.dart';
import '../models/cita_model.dart';

class PayGoProvider extends ChangeNotifier {
  Usuario? _usuarioActual;

  Usuario? get usuarioActual => _usuarioActual;

  double get saldoDisponible => _usuarioActual?.saldoDisponible ?? 91167.00;

  final List<Servicio> _servicios = [
    Servicio(idServicio: 1, nombreServicio: 'Agua / CFE', numContratoReferencia: '1234567890/CFE', saldoPendiente: 670.00),
    Servicio(idServicio: 2, nombreServicio: 'Internet Telmex', numContratoReferencia: '9876543210/TEL', saldoPendiente: 450.00),
  ];

  final List<MetodoPago> _metodosPago = [];
  final List<Cita> _citas = [
    Cita(idCita: 1, fecHora: DateTime.now().add(const Duration(days: 1)), motivo: 'Aclaración de adeudo', estado: 'PENDIENTE')
  ];

  List<Servicio> get servicios => _servicios;
  List<MetodoPago> get metodosPago => _metodosPago;
  List<Cita> get citas => _citas;

  bool login(String correo, String contrasena) {
    if (correo.toLowerCase().contains('admin')) {
      _usuarioActual = Usuario(idUsuario: 1, nombre: 'Administrador General', correo: correo, rol: RolUsuario.ADMIN, saldoDisponible: 91167.00);
    } else if (correo.toLowerCase().contains('banquero') || correo.toLowerCase().contains('empleado')) {
      _usuarioActual = Usuario(idUsuario: 2, nombre: 'Banquero / Empleado', correo: correo, rol: RolUsuario.BANQUERO, saldoDisponible: 91167.00);
    } else {
      _usuarioActual = Usuario(idUsuario: 3, nombre: 'Cliente PayGo', correo: correo, rol: RolUsuario.COMUN, saldoDisponible: 91167.00);
    }
    notifyListeners();
    return true;
  }

  void logout() {
    _usuarioActual = null;
    notifyListeners();
  }

  void agregarServicio(String nombre, String contrato, double monto) {
    _servicios.add(Servicio(
      idServicio: _servicios.length + 1,
      nombreServicio: nombre,
      numContratoReferencia: contrato,
      saldoPendiente: monto,
    ));
    notifyListeners();
  }

  void agregarMetodoPago(String tipo, String numero, String vencimiento, int cvv) {
    _metodosPago.add(MetodoPago(
      idMetodo: _metodosPago.length + 1,
      tipoTarjeta: tipo,
      numTarjeta: numero,
      fecVencimiento: vencimiento,
      cvv: cvv,
    ));
    notifyListeners();
  }

  void realizarPago(double monto) {
    if (_usuarioActual != null && _usuarioActual!.saldoDisponible >= monto) {
      _usuarioActual!.saldoDisponible -= monto;
      notifyListeners();
    }
  }
}