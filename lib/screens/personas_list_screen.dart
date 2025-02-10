import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/personas_provider.dart';
import '../widgets/persona_card.dart';

class PersonasListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personasAsyncValue = ref.watch(personasProvider);  // Usar ref.watch en lugar de ScopedReader

    return Scaffold(
      appBar: AppBar(title: Text('Lista de Personas')),
      body: personasAsyncValue.when(
        data: (personas) {
          return ListView.builder(
            itemCount: personas.length,
            itemBuilder: (context, index) {
              final persona = personas[index];
              return ListTile(
                title: Text(persona.primerNombre),
                subtitle: Text('Documento: ${persona.numeroDocumento}'),
              );
            },
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}

