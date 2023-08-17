import 'package:cats_breeds/src/models/cat_model.dart';
import 'package:cats_breeds/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  static const String name = 'detail_screen';
  final CatModel cat;

  const DetailScreen({Key? key, required this.cat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
    const spacing = SizedBox(height: 20);

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(cat.name)),
      ),
      body: Column(
        children: [
          CatImage(cat: cat),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cat.description,
                      style: textStyle,
                    ),
                    spacing,
                    Text(
                      'Country: ${cat.origin}',
                      style: textStyle,
                    ),
                    spacing,
                    Text(
                      'Intelligence: ${cat.intelligence}',
                      style: textStyle,
                    ),
                    spacing,
                    Text(
                      'Adaptability: ${cat.adaptability}',
                      style: textStyle,
                    ),
                    spacing,
                    Text(
                      'Affection Lvl: ${cat.affectionLevel}',
                      style: textStyle,
                    ),
                    spacing,
                    Text(
                      'Energy Lvl: ${cat.energyLevel}',
                      style: textStyle,
                    ),
                    spacing,
                    Text(
                      'Experimental Lvl: ${cat.experimental}',
                      style: textStyle,
                    ),
                    spacing,
                    Text(
                      'Grooming Lvl: ${cat.grooming}',
                      style: textStyle,
                    ),
                    spacing,
                    Text(
                      'Child friendly Lvl: ${cat.childFriendly}',
                      style: textStyle,
                    ),
                    spacing,
                    Text(
                      'Dog friendly Lvl: ${cat.dogFriendly}',
                      style: textStyle,
                    ),
                    spacing,
                    Text(
                      'Hairless: ${cat.hairless}',
                      style: textStyle,
                    ),
                    spacing,
                    Text(
                      'Healt issues: ${cat.healthIssues}',
                      style: textStyle,
                    ),
                    spacing,
                    Text(
                      'Hypoallergenic: ${cat.hypoallergenic}',
                      style: textStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
