# Flutter Column & Image.network Demo

A recipe card app demonstrating Column layout widget and Image.network for loading images from URLs.

## How to Run

1. Clone this repository
2. Make sure Flutter is installed on your system
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to start the app

## Widget Properties Demonstrated

### Column Widget
1. **crossAxisAlignment** - Controls horizontal alignment of children (start, center, end, stretch)
2. **mainAxisAlignment** - Controls vertical spacing and alignment of children (start, center, end, spaceEvenly, etc.)
3. **mainAxisSize** - Determines how much vertical space the Column should occupy (min, max)

### Image.network Widget
1. **height** - Sets the height of the image widget in logical pixels
2. **fit** - Controls how the image should be inscribed into the space (cover, contain, fill, fitWidth, etc.)
3. **loadingBuilder** - Provides a widget to show while the image is loading from the network

## Screenshot

![Recipe Card Demo](screenshot.png)

*A recipe card app showing multiple food items in a vertical layout with network images*

## Presentation

![Presentation Link](https://docs.google.com/presentation/d/1F6-xyEVuZhk22PWdIQT6_RYD8vSasW5Z6OjdmoiCAmU/edit?usp=sharing)

## Real-World Use Case

This demo simulates a recipe or food delivery app where:
- **Column** organizes multiple recipe cards vertically with proper spacing
- **Image.network** loads food photos from URLs with loading states and error handling
- Perfect for apps like food blogs, recipe collections, or restaurant menus
