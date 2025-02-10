import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/pacientes.dart';

final pacienteProvider = FutureProvider<List<Paciente>>((ref) async {
  final String url = 'http://44.211.238.32:8570/clinica/api/pacientes';

  try {
    final response = await http.get(Uri.parse(url));

    // Verificar si la respuesta fue exitosa
    if (response.statusCode == 200) {
      // Intentar decodificar la respuesta JSON
      try {
        List<dynamic> data = jsonDecode(response.body);

        // Asegurarse de que la respuesta es una lista válida
        if (data is List) {
          return data.map((json) => Paciente.fromJson(json)).toList();
        } else {
          throw Exception('Formato de datos inesperado');
        }
      } catch (e) {
        throw Exception('Error al decodificar el JSON: $e');
      }
    } else {
      throw Exception('Error al obtener pacientes. Código de estado: ${response.statusCode}');
    }
  } catch (e) {
    // Capturar otros errores (por ejemplo, problemas de red)
    throw Exception('Error en la solicitud: $e');
  }
});

