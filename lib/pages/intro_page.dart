import 'package:flutter/material.dart';

import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              Padding(
                padding: const EdgeInsets.all(25),
                child: Image.asset(
                  'lib/images/nike.png',
                  height: 200,
                ),
              ),
              // title
              const SizedBox(height: 48),
              const Text('Just do It.', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              const SizedBox(height: 48),
              // sub title
              const Text('Brand new sneakers and custom kicks made with premium quality.', style: TextStyle(fontSize: 16, color: Colors.grey), textAlign: TextAlign.center),
              const SizedBox(height: 48),
              // start now button
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage())),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(25),
                  child: const Center(child: Text('Shop now', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
