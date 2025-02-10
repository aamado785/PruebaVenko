import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/persona.dart';



final personasProvider = FutureProvider<List<Persona>>((ref) async {
  final response = await http.get(Uri.parse('http://44.211.238.32:8570/clinica/api/paciente'));

  if (response.statusCode == 200) {

    List<dynamic> data = json.decode(response.body);
    return data.map((personaJson) => Persona.fromJson(personaJson)).toList();
  } else {

    throw Exception('Error al cargar personas');
  }
});



