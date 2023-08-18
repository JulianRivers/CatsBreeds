import 'package:cats_breeds/src/models/cat_model.dart';
import 'package:cats_breeds/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                    AttrbCat(
                      text: 'Origin: ${cat.origin}',
                      svgName: 'assets/images/flag.svg',
                    ),
                    spacing,
                    AttrbCat(
                      text: 'Life span: ${cat.lifeSpan}',
                      svgName: 'assets/images/life-span.svg',
                    ),
                    spacing,
                    AttrbCat(
                      text: 'Intelligence: ${cat.intelligence}',
                      svgName: 'assets/images/idea.svg',
                    ),
                    spacing,
                    AttrbCat(
                      text: 'Adaptability: ${cat.adaptability}',
                      svgName: 'assets/images/adaptability.svg',
                    ),
                    spacing,
                    AttrbCat(
                      text: 'Affection Lvl: ${cat.affectionLevel}',
                      svgName: 'assets/images/love.svg',
                    ),
                    spacing,
                    AttrbCat(
                      text: 'Energy Lvl: ${cat.energyLevel}',
                      svgName: 'assets/images/energy.svg',
                    ),
                    spacing,
                    AttrbCat(
                      text: 'Grooming Lvl: ${cat.grooming}',
                      svgName: 'assets/images/grooming.svg',
                    ),
                    spacing,
                    AttrbCat(
                      text: 'Experimental Lvl: ${cat.experimental}',
                      svgName: 'assets/images/experimental.svg',
                    ),
                    spacing,
                    AttrbCat(
                      text: 'Child friendly Lvl: ${cat.childFriendly}',
                      svgName: 'assets/images/child.svg',
                    ),
                    spacing,
                    AttrbCat(
                      text: 'Dog frindly Lvl: ${cat.affectionLevel}',
                      svgName: 'assets/images/dog.svg',
                    ),
                    spacing,
                    AttrbCat(
                      text: 'Hairless: ${cat.hairless}',
                      svgName: 'assets/images/hair-brush.svg',
                    ),
                    spacing,
                    AttrbCat(
                      text: 'Heakth Issues: ${cat.affectionLevel}',
                      svgName: 'assets/images/health-outline.svg',
                    ),
                    spacing,
                    AttrbCat(
                      text: 'Hypoallergenic: ${cat.hypoallergenic}',
                      svgName: 'assets/images/hypoallergenic.svg',
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

class AttrbCat extends StatelessWidget {
  const AttrbCat({
    super.key,
    required this.text,
    required this.svgName,
  });
  final String text;

  final String svgName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          svgName,
          width: 25,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ],
    );
  }
}
