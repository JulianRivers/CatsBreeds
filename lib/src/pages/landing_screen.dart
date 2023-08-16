import 'package:cats_breeds/src/providers/cat_api_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatelessWidget {
  static const String name = 'landing_screen';
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final catApiProvider = context.watch<CatApiProvider>();
    catApiProvider.fetchCats();

    return Scaffold(
      appBar: AppBar(
        title: const Text('CatBreeds'),
      ),
      body: catApiProvider.cats.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: catApiProvider.cats.length,
              itemBuilder: (context, index) {
                final cat = catApiProvider.cats[index];
                return ListTile(
                  title: Text(cat.name),
                  subtitle: Text(cat.description),
                );
              },
            ),
    );
  }
}
