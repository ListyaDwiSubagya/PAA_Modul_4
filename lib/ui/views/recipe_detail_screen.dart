import 'package:flutter/material.dart';
import 'package:mobilemandiri/data/models/recipes.dart';

const TextStyle customHeadlineStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);
class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailScreen({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(recipe.imageUrl),
              const SizedBox(height: 16.0),
              Text(
                'Ingredients:',
                style: customHeadlineStyle,
              ),
              const SizedBox(height: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: recipe.ingredients
                    .map((ingredient) => Text('- $ingredient'))
                    .toList(),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Instructions:',
                style: customHeadlineStyle,
              ),
              const SizedBox(height: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: recipe.instructions
                    .map((instruction) => Text('- $instruction'))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}