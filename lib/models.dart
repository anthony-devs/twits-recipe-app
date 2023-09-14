import 'package:hive/hive.dart';


enum Type{
  Breakfast,
  Lunch,
  Dinner,
  Snack,
  Dessert,
  Soup,
  Drink,
  Pastry
}

enum Ingredients {
  // Fruits
  Apple,
  Banana,
  Orange,
  Strawberry,
  Blueberry,
  Lemon,
  Lime,
  Pineapple,
  Avocado,

  // Vegetables
  Carrot,
  Broccoli,
  Tomato,
  Cucumber,
  Spinach,
  Onion,
  Garlic,
  BellPepper,

  // Meats
  Chicken,
  Beef,
  Pork,
  Bacon,
  Sausage,
  Turkey,
  Lamb,
  Fish,

  // Dairy
  Milk,
  Cheese,
  Butter,
  Yogurt,
  Cream,
  SourCream,

  // Grains and Legumes
  Rice,
  Pasta,
  Bread,
  Oatmeal,
  Quinoa,
  Lentils,
  Chickpeas,

  // Herbs and Spices
  Salt,
  Pepper,
  GarlicPowder,
  OnionPowder,
  Paprika,
  Cumin,
  Oregano,
  Basil,

  // Condiments and Sauces
  Ketchup,
  Mayonnaise,
  Mustard,
  SoySauce,
  Vinegar,
  HotSauce,
  Salsa,

  // Sweeteners
  Sugar,
  Honey,
  MapleSyrup,
  AgaveNectar,
  Stevia,

  // Oils and Vinegars
  OliveOil,
  VegetableOil,
  CoconutOil,
  BalsamicVinegar,
  AppleCiderVinegar,

  // Others
  Eggs,
  Tofu,
  Nuts,
  Seeds,
  Broth,
  Breadcrumbs,
  Chocolate,
  VanillaExtract,

  // Add more ingredients as needed
}



@HiveType(typeId: 0)
class Meal extends HiveObject {
  @HiveField(0)
  late String key;
  Type type;
  int cookingTime;
  String name;
  String instructions;
  String description;
  String linkToImage;
  DateTime dateAdded;
  List<Ingredients> ingredients;

  Meal({required this.type, required this.cookingTime, required this.dateAdded, required this.description, required this.ingredients, required this.instructions, this.linkToImage = "", required this.name, });

}