import 'package:flutter/material.dart';
import 'package:yummy/models/food_category.dart';

class CategoryCard extends StatelessWidget {
  final FoodCategory category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(
      context,
    ).textTheme.apply(displayColor: Theme.of(context).colorScheme.onSurface);

    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8.0),
                ),
                child: Image.asset(category.imageUrl),
              ),
              Positioned(
                left: 16.0,
                top: 16.0,
                child: Text('Yummy', style: textTheme.headlineLarge),
              ),
              Positioned(
                bottom: 16.0,
                right: 16.0,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Text('Smoothies', style: textTheme.headlineLarge),
                ),
              ),
            ],
          ),
          ListTile(
            title: Text(category.name, style: textTheme.titleSmall),
            subtitle: Text(
              '${category.numberOfRestaurants} places',
              style: textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
