class Medico {
  final String tipoDocumento;
  final String numeroDocumento;
  final String primerNombre;
  final String primerApellido;
  final String? segundoNombre;
  final String? segundoApellido;
  // ... otros campos que puedan ser relevantes ...

  Medico({
    required this.tipoDocumento,
    required this.numeroDocumento,
    required this.primerNombre,
    required this.primerApellido,
    this.segundoNombre,
    this.segundoApellido,
    // ... otros campos ...
  });

  factory Medico.fromJson(Map<String, dynamic> json) {
    return Medico(
      tipoDocumento: json['tipoDocumento'],
      numeroDocumento: json['numeroDocumento'],
      primerNombre: json['primerNombre'],
      primerApellido: json['primerApellido'],
      segundoNombre: json['segundoNombre'],
      segundoApellido: json['segundoApellido'],
      // ... otros campos ...
    );
  }

  Map<String, dynamic> toJson() => {
    'tipoDocumento': tipoDocumento,
    'numeroDocumento': numeroDocumento,
    'primerNombre': primerNombre,
    'primerApellido': primerApellido,
    'segundoNombre': segundoNombre,
    'segundoApellido': segundoApellido,
    // ... otros campos ...
  };
}