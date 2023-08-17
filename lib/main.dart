import 'package:cats_breeds/src/config/router/app_router.dart';
import 'package:cats_breeds/src/providers/cat_api_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CatApiProvider(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.teal),
      ),
    );
  }
}
