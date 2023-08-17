import 'package:cats_breeds/src/models/cat_model.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final CatModel cat;

  const DetailScreen({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(cat.name)),
      ),
      body: Column(children: [
        Image(
          image: const AssetImage('assets/images/cat_loading.png'),
          height: media.height * 0.3,
          fit: BoxFit.cover,
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(cat.description),
                Text('Country: ${cat.description}'),
                Text('Intelligence: ${cat.intelligence}'),
                Text('adaptability: ${cat.adaptability}'),
                Text('Affection Lvl: ${cat.affectionLevel}'),
                Text('Energy Lvl: ${cat.energyLevel}'),
                Text('Experimental Lvl: ${cat.experimental}'),
                Text('Grooming Lvl: ${cat.grooming}'),
                Text('Child friendly Lvl: ${cat.childFriendly}'),
                Text('Dog friendly Lvl: ${cat.dogFriendly}'),
                Text('Hairless: ${cat.hairless}'),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
