import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobilemandiri/data/models/recipes.dart';

class Recipeshttp {
  static const String apiUrl = 'https://dummyjson.com/recipes';

  Future<List<Recipe>> fetchRecipes() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final recipes = (jsonData['recipes'] as List)
          .map((recipe) => Recipe.fromJson(recipe))
          .toList();
      return recipes;
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}