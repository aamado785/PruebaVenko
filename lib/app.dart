import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Mi App Flutter',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}