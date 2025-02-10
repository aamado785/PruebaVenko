class Persona {
  final String tipoDocumento;
  final String numeroDocumento;
  final String primerNombre;

  Persona({required this.tipoDocumento, required this.numeroDocumento, required this.primerNombre});

  // Convierte el JSON a un objeto Persona
  factory Persona.fromJson(Map<String, dynamic> json) {
    return Persona(
      tipoDocumento: json['tipoDocumento'],
      numeroDocumento: json['numeroDocumento'],
      primerNombre: json['primerNombre'],
    );
  }
}

