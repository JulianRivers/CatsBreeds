import 'package:cats_breeds/src/pages/detail_screen.dart';
import 'package:cats_breeds/src/providers/cat_api_provider.dart';
import 'package:cats_breeds/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatelessWidget {
  static const String name = 'landing_screen';

  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final catApiProvider = context.watch<CatApiProvider>();

    if (!catApiProvider.isInitialized) {
      catApiProvider.fetchCats();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('CatBreeds'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {},
              decoration: const InputDecoration(
                labelText: 'Search cats',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: catApiProvider.cats.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: catApiProvider.cats.length,
                    itemBuilder: (context, index) {
                      final cat = catApiProvider.cats[index];
                      return CardsCats(
                        cat: cat,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(cat: cat),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
