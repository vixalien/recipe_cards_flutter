import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Card Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: RecipeCardScreen(),
    );
  }
}

// Recipe data model
class Recipe {
  final String title;
  final String imageUrl;
  final String description;
  final String cookTime;
  final String difficulty;
  
  Recipe({
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.cookTime,
    required this.difficulty,
  });
}

class RecipeCardScreen extends StatelessWidget {
  // List of recipe objects - this is how real apps store data
  final List<Recipe> recipes = [
    Recipe(
      title: 'Classic Margherita Pizza',
      imageUrl: 'https://images.unsplash.com/photo-1604068549290-dea0e4a305ca?w=400&h=300&fit=crop',
      description: 'Traditional Italian pizza with fresh tomatoes, mozzarella, and basil.',
      cookTime: '25 mins',
      difficulty: 'Easy',
    ),
    Recipe(
      title: 'Chicken Teriyaki Bowl',
      imageUrl: 'https://images.unsplash.com/photo-1546833999-b9f581a1996d?w=400&h=300&fit=crop',
      description: 'Delicious grilled chicken with teriyaki sauce over steamed rice.',
      cookTime: '30 mins',
      difficulty: 'Medium',
    ),
    Recipe(
      title: 'Fresh Garden Salad',
      imageUrl: 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=400&h=300&fit=crop',
      description: 'Crisp lettuce, tomatoes, cucumbers with homemade vinaigrette.',
      cookTime: '10 mins',
      difficulty: 'Easy',
    ),
    Recipe(
      title: 'Beef Stir Fry',
      imageUrl: 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=400&h=300&fit=crop',
      description: 'Quick and flavorful beef stir fry with fresh vegetables.',
      cookTime: '20 mins',
      difficulty: 'Medium',
    ),
  ];

  RecipeCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Cards'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          // Property 1: crossAxisAlignment - Controls horizontal alignment
          crossAxisAlignment: CrossAxisAlignment.start,
          // Property 2: mainAxisAlignment - Controls vertical spacing between children
          mainAxisAlignment: MainAxisAlignment.start,
          // Property 3: mainAxisSize - Controls how much vertical space the Column takes
          mainAxisSize: MainAxisSize.min,
          children: [
            // Generate RecipeCard widgets from the recipes list
            ...recipes.map((recipe) => Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: RecipeCard(
                title: recipe.title,
                imageUrl: recipe.imageUrl,
                description: recipe.description,
                cookTime: recipe.cookTime,
                difficulty: recipe.difficulty,
              ),
            )).toList(),
          ],
        ),
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;
  final String cookTime;
  final String difficulty;
  
  const RecipeCard({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.cookTime,
    required this.difficulty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        // Property 3: mainAxisSize - Controls how much vertical space the Column takes
        mainAxisSize: MainAxisSize.min, // Try: MainAxisSize.max
        children: [
          // Image.network widget demonstration
          Image.network(
            imageUrl,
            // Property 1: height - Controls the image height
            height: 200,
            width: double.infinity,
            // Property 2: fit - Controls how image fills the container
            fit: BoxFit.cover, // Try: BoxFit.fill, BoxFit.contain, BoxFit.fitWidth
            // Property 3: loadingBuilder - Shows loading indicator while image loads
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                height: 200,
                child: Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                ),
              );
            },
            // Error handling for failed image loads
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 200,
                color: Colors.grey[300],
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error, color: Colors.red, size: 40),
                      Text('Failed to load image'),
                    ],
                  ),
                ),
              );
            },
          ),
          
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.access_time, size: 16, color: Colors.orange),
                        SizedBox(width: 4),
                        Text(cookTime, style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: difficulty == 'Easy' ? Colors.green[100] : Colors.orange[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        difficulty,
                        style: TextStyle(
                          fontSize: 12,
                          color: difficulty == 'Easy' ? Colors.green[800] : Colors.orange[800],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
