import 'package:flutter/material.dart';
import '../models/pacientes.dart';

class PersonaCard extends StatelessWidget {
  final Paciente persona;

  const PersonaCard({super.key, required this.persona});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("${persona.primerNombre} ${persona.primerApellido}"),
        subtitle: Text("Documento: ${persona.numeroDocumento}"),
      ),
    );
  }
}

