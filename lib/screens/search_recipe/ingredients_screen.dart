import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pockectcheff/screens/home/home_screen.dart';
import 'package:pockectcheff/screens/login/register_screen.dart';
import 'package:pockectcheff/screens/login/reset_password_screen.dart';
import 'package:pockectcheff/screens/search_recipe/food_restrictions_screen.dart';

import '../../models/SearchTopics.dart';

class IngredientsScreen extends StatefulWidget {
  const IngredientsScreen({super.key});

  @override
  _IngredientsScreenState createState() => _IngredientsScreenState();
}

class _IngredientsScreenState extends State<IngredientsScreen> {
  TextEditingController ingredientsController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  static SearchTopics IngredientsTopics = SearchTopics();

  static List<String> ingredients = [];
  String alert = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 227, 226, 1),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  15,
                  30,
                  15,
                  30,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          color: Color.fromARGB(255, 255, 67, 54),
                          height: 5,
                          width: 55,
                        ),
                        Container(
                          color: Colors.white,
                          height: 5,
                          width: 55,
                        ),
                        Container(
                          color: Colors.white,
                          height: 5,
                          width: 55,
                        ),
                        Container(
                          color: Colors.white,
                          height: 5,
                          width: 55,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Quais ingredientes",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 78, 28, 24),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "vamos usar hoje?",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 78, 28, 24),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 155,
                                child: TextFormField(
                                  cursorColor: Color.fromARGB(255, 185, 48, 39),
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: InputBorder.none,
                                    hintText: "Ingrediente",
                                    hintStyle: TextStyle(
                                      color: Color.fromARGB(255, 129, 129, 129),
                                      fontSize: 12,
                                    ),
                                    // labelStyle: TextStyle(
                                    //   color: Color.fromARGB(255, 129, 129, 129),
                                    //   fontSize: 12,
                                    // ),
                                  ),
                                  controller: ingredientsController,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                  textAlign: TextAlign.left,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Insert your ingredient";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              ButtonTheme(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color.fromRGBO(255, 83, 71, 1),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (ingredients.length < 30) {
                                        alert = '';
                                        ingredients
                                            .add(ingredientsController.text);
                                        ingredientsController.clear();
                                      } else {
                                        alert =
                                            'Não é possível adicionar mais ingredientes';
                                      }
                                    });
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ingredients.isNotEmpty
                        ? Column(
                            children: ingredients.map((ingredient) {
                            return Container(
                              width: 220,
                              child: Card(
                                child: ListTile(
                                  title: Text(ingredient),
                                  trailing: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.redAccent),
                                    child: Icon(Icons.delete),
                                    onPressed: () {
                                      setState(() {
                                        ingredients.removeWhere((element) {
                                          return element == ingredient;
                                        });
                                      });
                                    },
                                  ),
                                ),
                              ),
                            );
                          }).toList())
                        : Container(),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    ButtonTheme(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: ingredients.isEmpty
                              ? Colors.grey
                              : Color.fromRGBO(255, 83, 71, 1),
                        ),
                        onPressed: ingredients.isEmpty
                            ? () {}
                            : () {
                                setState(() {
                                  ingredients.clear();
                                });
                              },
                        child: Text("Excluir tudo"),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonTheme(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(255, 83, 71, 1),
                            ),
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            ),
                            child: Text("Voltar"),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ButtonTheme(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: ingredients.isEmpty
                              ? Colors.grey
                              : Color.fromRGBO(255, 83, 71, 1),
                            ),
                            onPressed:  ingredients.isEmpty
                            ? () {}
                            : () {
                              setState(() {
                                IngredientsTopics.ingredients = ingredients;
                              });
                              print(">>>>>>>>>>>>>>$ingredients");
                              print(">>>>>>>>>>>>>>:::::${IngredientsTopics.ingredients}");
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FoodRestrictionsScreen(topics: IngredientsTopics,),
                              ),
                            );},
                            child: Text("Avançar"),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
