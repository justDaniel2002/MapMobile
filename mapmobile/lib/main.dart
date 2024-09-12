import 'package:flutter/material.dart';
import 'package:mapmobile/models/kios_model.dart';
import 'package:mapmobile/models/map_model.dart';
import 'package:mapmobile/routers/route.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MapModel()),
      ChangeNotifierProvider(create: (context) => KiosModel())
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
          ),
          fontFamily: 'Roboto'),
    );
  }
}
