import 'package:flutter/material.dart';
import 'package:pokedex/core/config/application.dart';
import 'package:pokedex/core/config/router.dart';
import 'package:pokedex/core/config/theme.dart';

class PokedexApp extends StatefulWidget {
  const PokedexApp({super.key});

  @override
  State<PokedexApp> createState() => _PokedexAppState();
}

class _PokedexAppState extends State<PokedexApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState? get _navigator => _navigatorKey.currentState;

  @override
  void initState() {
    super.initState();
  }

  void onNavigate(String route) {
    _navigator!.pushNamedAndRemoveUntil(route, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      debugShowCheckedModeBanner: Application.debug,
      title: Application.title,
      theme: AppTheme().theme,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
