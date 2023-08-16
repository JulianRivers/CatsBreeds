import 'package:flutter/material.dart';

class LandingPageScreen extends StatelessWidget {
  static const String name = 'landingpage_screen';
  const LandingPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CatBreeds'),
      ),
    );
  }
}
