import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pockectcheff/models/SearchTopics.dart';
import 'package:pockectcheff/screens/home/home_screen.dart';
import 'package:pockectcheff/screens/login/register_screen.dart';
import 'package:pockectcheff/screens/login/reset_password_screen.dart';
import 'package:pockectcheff/screens/search_recipe/food_restrictions_screen.dart';
import 'package:pockectcheff/screens/search_recipe/ingredients_screen.dart';
import 'package:pockectcheff/screens/search_recipe/resume_screen.dart';

class SpecialDishesScreen extends StatefulWidget {
  SpecialDishesScreen({super.key, required this.topics});

  SearchTopics topics;

  @override
  _SpecialDishesScreenState createState() => _SpecialDishesScreenState(topics);
}

class _SpecialDishesScreenState extends State<SpecialDishesScreen> {
  _SpecialDishesScreenState(this.specialDishesTopics);

  SearchTopics specialDishesTopics;
  
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
                        "Deseja buscar por",
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
                        "um prato específico?",
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
                                    hintText: "Prato",
                                    hintStyle: TextStyle(
                                      color: Color.fromARGB(255, 129, 129, 129),
                                      fontSize: 12,
                                    ),
                                  ),
                                  controller: specialDishesController,
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
                                    primary: dishes.isNotEmpty ? Colors.grey :  Color.fromRGBO(255, 83, 71, 1),
                                  ),
                                  onPressed: dishes.isNotEmpty ? () {} : () {
                                    setState(() {
                                      if(dishes.isEmpty) {
                                        dishes.add(specialDishesController.text);
                                        specialDishesController.clear();
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
                    dishes.isNotEmpty
                        ? Column(
                            children: dishes.map((dishe) {
                            return Container(
                              width: 220,
                              child: Card(
                                child: ListTile(
                                  title: Text(dishe),
                                  trailing: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.redAccent),
                                    child: Icon(Icons.delete),
                                    onPressed: () {
                                      setState(() {
                                        dishes.removeWhere((element) {
                                          return element == dishe;
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
                          primary: dishes.isEmpty
                              ? Colors.grey
                              : Color.fromRGBO(255, 83, 71, 1),
                        ),
                        onPressed: dishes.isEmpty
                            ? () {}
                            : () {
                                setState(() {
                                  dishes.clear();
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
                                builder: (context) => FoodRestrictionsScreen(topics: specialDishesTopics,),
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
                              primary: Color.fromRGBO(255, 83, 71, 1),
                            ),
                            onPressed: () {
                              setState(() {
                                specialDishesTopics.specialDishes = dishes;                                
                              });
                              print(">>>>>>>>>>>>>>$dishes");
                              print(">>>>>>>>>>>>>>::::::${specialDishesTopics.specialDishes}");
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResumeScreen(topics: specialDishesTopics,),
                              ),
                            );
                            },
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
