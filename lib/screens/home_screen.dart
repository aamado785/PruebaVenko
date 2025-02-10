import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/paciente_provider.dart';
import '../models/pacientes.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pacientesAsync = ref.watch(pacienteProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Pacientes')),
      body: pacientesAsync.when(
        data: (pacientes) => ListView.builder(
          itemCount: pacientes.length,
          itemBuilder: (context, index) {
            final paciente = pacientes[index];
            return Card(
              child: ListTile(
                title: Text('${paciente.primerNombre} ${paciente.primerApellido}'),
                subtitle: Text(paciente.numeroDocumento),
                onTap: () {
                  // Acción al tocar
                },
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
