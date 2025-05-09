import 'package:flutter/material.dart';
import 'recipe_detail.dart';
import 'recipe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      title: "Recipe Calculator",

      theme: theme.copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreenAccent),
      ),

      home: const MyHomePage(title: "Recipe Calculator"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SafeArea(
        child: ListView.builder(
          //5: Determines the number of rows the list has.
          itemCount: Recipe.samples.length,
          //6: itemBuilder builds the widget tree for each row
          itemBuilder: (BuildContext context, int index) {
            //7: updated, guestre detector
            return GestureDetector(
              onTap:
                  () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // builder create destination page widget
                        builder: (context) {
                          return RecipeDetail(recipe: Recipe.samples[index]);
                        },
                      ),
                    ),
                  },
              //defines the area where gesture is active
              child: buildRecipeCard(Recipe.samples[index]),
            );

            // // 7: updated
            // return buildRecipeCard(Recipe.samples[index]);

            // //7: A Text widget displays the name of the recipe
            // return Text(Recipe.samples[index].label);
          },
        ),
      ),
    );
  }

  // card for showing food image and name
  Widget buildRecipeCard(Recipe recipe) {
    return Card(
      elevation: 2.0, // for shadow
      // For shape
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Image(image: AssetImage(recipe.imageUrl)),
            //gap between image and text
            const SizedBox(height: 14.0),
            Text(
              recipe.label,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                fontFamily: "Palatino",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
