class Paciente {
  final String tipoDocumento;
  final String numeroDocumento;
  final String primerNombre;
  final String? segundoNombre; // Puede ser nulo
  final String primerApellido;
  final String? segundoApellido; // Puede ser nulo
  final DateTime fechaExpedicion;

  Paciente({
    required this.tipoDocumento,
    required this.numeroDocumento,
    required this.primerNombre,
    this.segundoNombre,
    required this.primerApellido,
    this.segundoApellido,
    required this.fechaExpedicion,
  });

  factory Paciente.fromJson(Map<String, dynamic> json) {
    return Paciente(
      tipoDocumento: json['tipoDocumento'],
      numeroDocumento: json['numeroDocumento'],
      primerNombre: json['primerNombre'],
      segundoNombre: json['segundoNombre'],
      primerApellido: json['primerApellido'],
      segundoApellido: json['segundoApellido'],
      fechaExpedicion: DateTime.parse(json['fechaExpedicion']),
    );
  }

  Map<String, dynamic> toJson() => {
    'tipoDocumento': tipoDocumento,
    'numeroDocumento': numeroDocumento,
    'primerNombre': primerNombre,
    'segundoNombre': segundoNombre,
    'primerApellido': primerApellido,
    'segundoApellido': segundoApellido,
    'fechaExpedicion': fechaExpedicion.toIso8601String(),
  };
}