import 'package:flutter/material.dart';
import 'recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetail({super.key, required this.recipe});

  @override
  State<RecipeDetail> createState() {
    return _RecipeDetailState();
  }
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _sliderValue = 1;

  @override
  Widget build(BuildContext context) {
    // Scaffold automatically add a back button on app bar
    return Scaffold(
      appBar: AppBar(title: Text(widget.recipe.label)),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity, // fit the aspect ratio
              child: Image(image: AssetImage(widget.recipe.imageUrl)),
            ),
            const SizedBox(height: 4),
            Text(widget.recipe.label, style: const TextStyle(fontSize: 18)),
            //  fill the remaining space in a Column
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(7.0),
                itemCount: widget.recipe.ingredients.length,
                itemBuilder: (BuildContext context, int index) {
                  final ingredient = widget.recipe.ingredients[index];
                  // // todo: add ingredient.quantaty
                  return Text(
                    '${ingredient.quantity * _sliderValue} ${ingredient.measure} ${ingredient.name}',
                  );
                },
              ),
            ),
            Slider(
              min: 1,
              max: 10,
              divisions: 9,
              label: '${_sliderValue * widget.recipe.servings} servings',
              value: _sliderValue.toDouble(),
              onChanged: (newValue) {
                setState(() {
                  _sliderValue = newValue.round();
                });
              },
              activeColor: Colors.green,
              inactiveColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
