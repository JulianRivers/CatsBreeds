import 'package:cats_breeds/src/models/cat_model.dart';
import 'package:flutter/material.dart';

class CardsCats extends StatelessWidget {
  final CatModel cat;

  const CardsCats({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cat.name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextButton(onPressed: () {}, child: const Text('Más...'))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Image(
            image: NetworkImage(
                'https://cdn2.thecatapi.com/images/${cat.referenceImageId}.jpg'),
            height: media.height * 0.4,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Country: ${cat.origin}'),
              Text('Int: ${cat.intelligence}')
            ],
          ),
        ]),
      ),
    );
  }
}
