import 'package:cats_breeds/src/models/cat_model.dart';
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
          Container(
            constraints: const BoxConstraints(minHeight: 50.0),
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: TextField(
              onChanged: (value) {
                final List<CatModel> filteredCats =
                    catApiProvider.getFilteredCats(value);
                catApiProvider.updateFilteredCats(filteredCats);
              },
              decoration: const InputDecoration(
                hintText: 'Search cats...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10.0),
              ),
            ),
          ),
          catApiProvider.isInitialized
              ? Expanded(
                  child: Consumer<CatApiProvider>(
                    builder: (context, provider, child) {
                      final List<CatModel> filteredCats = provider.catsData;
                      return ListView.builder(
                        itemCount: filteredCats.length,
                        itemBuilder: (context, index) {
                          final cat = filteredCats[index];
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
                        child: Hero(
                          tag: 'cat_image_${cat.id}',
                          child: CardsCats(
                            cat: cat,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailScreen(cat: cat),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ],
      ),
    );
  }
}
