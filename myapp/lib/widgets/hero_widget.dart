import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({
    super.key,
    required this.title,
    this.nextPage,
  });

  final String title;
  final Widget? nextPage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          nextPage != null
              ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return nextPage!;
                    },
                  ),
                );
              }
              : null,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Hero(
            tag: 'Flutter Mapp',
            child: ClipRRect(
              //for rounded borders, use cliperrect
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                "assets/images/bg.jpg",
                color: Colors.teal,
                colorBlendMode: BlendMode.modulate,
              ),
            ),
          ),

          // put text on hero image
          FittedBox(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50.0,
                letterSpacing: 40.0,
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
