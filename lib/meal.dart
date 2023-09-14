import 'dart:math';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import './models.dart';
import 'package:google_fonts/google_fonts.dart';

class Meals extends StatefulWidget {
  Meals({super.key});

  @override
  State<Meals> createState() => _MealsState();
}

class _MealsState extends State<Meals> {
  List<Meal> meals = [
    Meal(
      type: Type.Breakfast,
      cookingTime: 20,
      dateAdded: DateTime.now(),
      description: "A delicious and healthy breakfast option.",
      ingredients: [
        Ingredients.Oatmeal,
        Ingredients.Blueberry,
        Ingredients.Honey
      ],
      instructions:
          "1. Cook oatmeal according to package instructions.\n2. Top with fresh blueberries.\n3. Drizzle with honey.\n4. Enjoy!",
      linkToImage:
          "https://images.unsplash.com/photo-1640767485112-02da9fd009c6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGJsdWViZXJyeSUyMG9hdG1lYWx8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
      name: "Blueberry Oatmeal",
    ),
    Meal(
      type: Type.Lunch,
      cookingTime: 30,
      dateAdded: DateTime.now(),
      description: "A satisfying and flavorful lunch recipe.",
      ingredients: [
        Ingredients.Chicken,
        Ingredients.Spinach,
        Ingredients.Tomato,
        Ingredients.Avocado
      ],
      instructions:
          "1. Grill or bake the chicken until cooked through.\n2. Slice the chicken into strips.\n3. In a bowl, mix spinach, diced tomato, and sliced avocado.\n4. Top the salad with the chicken strips.\n5. Serve with your favorite dressing.\n6. Enjoy!",
      linkToImage:
          "https://images.unsplash.com/photo-1610057099431-d73a1c9d2f2f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8R3JpbGxlZCUyMENoaWNrZW4lMjBTYWxhZHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60",
      name: "Grilled Chicken Salad",
    ),
    Meal(
      type: Type.Dinner,
      cookingTime: 45,
      dateAdded: DateTime.now(),
      description: "A hearty and comforting dinner option.",
      ingredients: [
        Ingredients.Beef,
        Ingredients.Onion,
        Ingredients.Garlic,
        Ingredients.Tomato,
        Ingredients.Pasta
      ],
      instructions:
          "1. Cook the pasta according to package instructions.\n2. In a skillet, sauté onions and garlic until fragrant.\n3. Add ground beef and cook until browned.\n4. Stir in diced tomatoes and simmer for 10 minutes.\n5. Serve the sauce over cooked pasta.\n6. Enjoy!",
      linkToImage:
          "https://images.unsplash.com/photo-1515516969-d4008cc6241a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fEJlZWYlMjBQYXN0YSUyMEJvbG9nbmVzZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60",
      name: "Beef Pasta Bolognese",
    ),
  ];

  List<Meal> theMeal = [];
  List<Color?> colors = [
    Colors.blue[200],
    Colors.purple,
    Colors.red[200],
    Colors.amber[300],
    Colors.green[200]
  ];
  List<Type> types = [
    Type.Breakfast,
    Type.Dessert,
    Type.Dinner,
    Type.Drink,
    Type.Lunch,
    Type.Snack,
    Type.Soup
  ];
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 100,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            viewportFraction: 0.4,
            autoPlay: false,
            autoPlayInterval: Duration(seconds: 3),
          ),
          items: types.map((type) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  theMeal = meals.where((meal) => meal.type == type).toList();
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: colors[random.nextInt(colors.length)],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  width: 105,
                  height: 78,
                  child: Center(
                    child: Text(
                      type.toString().split('.').join().replaceAll('Type', ''),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1.0,
            height: 500,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            autoPlay: false,
            autoPlayInterval: Duration(seconds: 3),
          ),
          items: theMeal.map((meal) {
            return Builder(
              builder: (BuildContext context) {
                if (theMeal.isNotEmpty) {
                  return GestureDetector(
                    onTap: () {
                      // Handle meal onTap event
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => Scaffold(
                            floatingActionButtonLocation:
                                FloatingActionButtonLocation.centerDocked,
                            floatingActionButton: GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      // Add your bottom sheet content here
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Text("Ingredients",
                                                    textAlign: TextAlign.left,
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black)),
                                                for (var ing
                                                    in meal.ingredients)
                                                  Text(ing
                                                      .toString()
                                                      .split('.')
                                                      .join()
                                                      .replaceAll(
                                                          'Ingredients', '')),
                                                SizedBox(
                                                  height: 45,
                                                ),
                                                Text("Instructions",
                                                    textAlign: TextAlign.left,
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black)),
                                                Text(meal.instructions),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.purpleAccent,
                                      borderRadius: BorderRadius.circular(30)),
                                  width: 210,
                                  height: 78,
                                  child: Center(child: Text('Make Recipe')),
                                ),
                              ),
                            ),
                            body: Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: ListView(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child:
                                                    Icon(Icons.arrow_back_ios)))
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(1000),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                meal.linkToImage))),
                                  ),
                                  Text(meal.name,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                          fontSize: 34,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  Row(
                                    children: [
                                      Icon(Icons.timer),
                                      Text('${meal.cookingTime}')
                                    ],
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                  ),
                                  Text(
                                    meal.description,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 150.0, right: 150.0, top: 32, bottom: 32),
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(8.0),
                        width: 280,
                        height: 320,
                        child: Center(
                          child: Column(
                            children: [
                              // IMAGE
                              Container(
                                height: 150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    
                                    image: NetworkImage(meal.linkToImage.isEmpty
                                        ? 'https://img.freepik.com/free-vector/flat-design-no-photo-sign_23-2149272417.jpg?w=740&t=st=1688867348~exp=1688867948~hmac=1053615c0bda4dff8b6f80192b02af2f777dfef6bd1ea59d45a812dbb3c8ca8c'
                                        : meal.linkToImage),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                                ),
                              ),

                              // Text
                              Container(
                                height: 95,
                                
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10) ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(55, 158, 158, 45),
                                      blurRadius: 8.0,
                                      spreadRadius: 2.0,
                                      offset: Offset(0, 10),
                                    ),
                                  ],
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(height: 95 / 4),
                                    Text(
                                      meal.name,
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            meal.type
                                                .toString()
                                                .split('.')
                                                .join()
                                                .replaceAll('Type', ''),
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w200,
                                              color: Colors.black54,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(width: 50),
                                          Icon(
                                            Icons.timelapse,
                                            size: 12,
                                            color: Colors.black54,
                                          ),
                                          Text(
                                            meal.cookingTime.toString(),
                                            style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w100,
                                              color: Colors.black54,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      CircularProgressIndicator(),
                      GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: colors[random.nextInt(colors.length)],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            width: 185,
                            height: 78,
                            child: Center(
                              child: Text('Create One'),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                }
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
