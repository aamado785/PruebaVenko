import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PacienteFormScreen extends StatefulWidget {
  const PacienteFormScreen({super.key});

  @override
  State<PacienteFormScreen> createState() => _PacienteFormScreenState();
}

class _PacienteFormScreenState extends State<PacienteFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _apellidoController = TextEditingController();
  final _documentoController = TextEditingController();

  Future<void> _guardarPaciente() async {
    final String url = 'http://44.211.238.32:8570/clinica/api/pacientes';

    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'primerNombre': _nombreController.text,
        'primerApellido': _apellidoController.text,
        'numeroDocumento': _documentoController.text,
      }),
    );

    if (response.statusCode == 201) {
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Error al guardar')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar Paciente')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(controller: _nombreController, decoration: const InputDecoration(labelText: 'Nombre')),
              TextFormField(controller: _apellidoController, decoration: const InputDecoration(labelText: 'Apellido')),
              TextFormField(controller: _documentoController, decoration: const InputDecoration(labelText: 'Documento')),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _guardarPaciente, child: const Text('Guardar')),
            ],
          ),
        ),
      ),
    );
  }
}
