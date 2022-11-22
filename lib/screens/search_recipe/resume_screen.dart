import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pockectcheff/models/SearchTopics.dart';
import 'package:pockectcheff/screens/home/home_screen.dart';
import 'package:pockectcheff/screens/login/register_screen.dart';
import 'package:pockectcheff/screens/login/reset_password_screen.dart';
import 'package:pockectcheff/screens/search_recipe/food_restrictions_screen.dart';
import 'package:pockectcheff/screens/search_recipe/ingredients_screen.dart';
import 'package:pockectcheff/screens/search_recipe/special_dishes_screen.dart';

class ResumeScreen extends StatefulWidget {
  ResumeScreen({super.key, required this.topics});

  SearchTopics topics;

  @override
  _ResumeScreenState createState() => _ResumeScreenState(topics);
}

class _ResumeScreenState extends State<ResumeScreen> {
  _ResumeScreenState(this.resumeTopics);

  SearchTopics resumeTopics;
  
  TextEditingController specialDishesController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  static List<String> dishes = [];

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
                          color: Color.fromARGB(255, 255, 67, 54),
                          height: 5,
                          width: 55,
                        ),
                        Container(
                          color: Color.fromARGB(255, 255, 67, 54),
                          height: 5,
                          width: 55,
                        ),
                        Container(
                          color: Color.fromARGB(255, 255, 67, 54),
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
                        "Resumo",
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
                    resumeTopics.ingredients != []
                        ? Column(
                            children: dishes.map((ingredient) {
                            return Container(
                              width: 220,
                              child: Card(
                                child: ListTile(
                                  title: Text(ingredient),
                                ),
                              ),
                            );
                          }).toList())
                        : Container(),
                    SizedBox(
                      height: 20,
                    ),
                    resumeTopics.restrictions != []
                        ? Column(
                            children: dishes.map((restriction) {
                            return Container(
                              width: 220,
                              child: Card(
                                child: ListTile(
                                  title: Text(restriction),
                                ),
                              ),
                            );
                          }).toList())
                        : Container(),
                    SizedBox(
                      height: 20,
                    ),
                    resumeTopics.specialDishes != []
                        ? Column(
                            children: dishes.map((dishes) {
                            return Container(
                              width: 220,
                              child: Card(
                                child: ListTile(
                                  title: Text(dishes),
                                ),
                              ),
                            );
                          }).toList())
                        : Container(),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonTheme(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(255, 83, 71, 1),
                            ),
                            onPressed: () {
                                Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SpecialDishesScreen(topics: resumeTopics,),
                              ),
                            );},
                            child: Text("Voltar"),
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
                                print(":::::::::::::::::: ${resumeTopics.ingredients} ${resumeTopics.restrictions} ${resumeTopics.specialDishes}");},
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
