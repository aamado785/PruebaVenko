import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://44.211.238.32:8570/clinica/api';

  // Función para obtener la lista de personas
  static Future<List<dynamic>> getPeople() async {
    final response = await http.get(Uri.parse('$baseUrl/paciente'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load people');
    }
  }

  // Función para crear una persona
  static Future<void> createPerson(Map<String, dynamic> personData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/paciente'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(personData),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create person');
    }
  }

  // Función para editar una persona
  static Future<void> editPerson(int id, Map<String, dynamic> personData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/paciente/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(personData),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to edit person');
    }
  }
}

