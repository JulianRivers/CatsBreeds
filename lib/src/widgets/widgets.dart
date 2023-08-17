import 'package:animate_do/animate_do.dart';
import 'package:cats_breeds/src/models/cat_model.dart';
import 'package:cats_breeds/src/service/cats_service.dart';
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
              const Text('Mas...')
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          FutureBuilder<String?>(
            future: CatsService().validateImageURL(cat.referenceImageId),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return SpinPerfect(
                  duration: const Duration(milliseconds: 1200),
                    child: Image(
                  image: const AssetImage('assets/images/cat_loading.png'),
                  fit: BoxFit.cover,
                  height: media.height * 0.3,
                  width: media.width*0.5,
                ));
              }

              return Image.network(
                snapshot.data!,
                height: media.height * 0.3,
                fit: BoxFit.cover,
              );
            },
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
