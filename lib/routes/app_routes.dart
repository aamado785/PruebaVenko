import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/login_screen.dart';
import '../screens/home_screen.dart';
import '../screens/personas_list_screen.dart';
import '../screens/persona_form_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/personas',
      builder: (context, state) => PersonasListScreen(),
    ),
    GoRoute(
      path: '/persona-form',
      builder: (context, state) => const PacienteFormScreen(),
    ),
  ],
);
