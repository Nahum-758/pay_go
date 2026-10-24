enum RolUsuario { COMUN, ADMIN, EMPLEADO, BANQUERO }

class Usuario {
  final int idUsuario;
  final String nombre;
  final String correo;
  final RolUsuario rol;
  double saldoDisponible;

  Usuario({
    required this.idUsuario,
    required this.nombre,
    required this.correo,
    required this.rol,
    required this.saldoDisponible,
  });
}