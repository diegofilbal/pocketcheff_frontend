import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pockectcheff/screens/home/home_screen.dart';
import 'package:pockectcheff/screens/login/register_screen.dart';
import 'package:pockectcheff/screens/login/reset_password_screen.dart';
import 'package:pockectcheff/screens/search_recipe/ingredients_screen.dart';

class FoodRestrictions extends StatefulWidget {
  const FoodRestrictions({super.key});

  @override
  _FoodRestrictionsState createState() => _FoodRestrictionsState();
}

class _FoodRestrictionsState extends State<FoodRestrictions> {
  TextEditingController ingredientsController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  static List<String> restrictions = [];

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
                        "Adicione suas restrições",
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
                        "alimentares",
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
                                    hintText: "Restrições",
                                    hintStyle: TextStyle(
                                      color: Color.fromARGB(255, 129, 129, 129),
                                      fontSize: 12,
                                    ),
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
                                      restrictions
                                          .add(ingredientsController.text);
                                      ingredientsController.clear();
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
                    restrictions.isNotEmpty
                        ? Column(
                            children: restrictions.map((ingredient) {
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
                                        restrictions.removeWhere((element) {
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
                          primary: restrictions.isEmpty
                              ? Colors.grey
                              : Color.fromRGBO(255, 83, 71, 1),
                        ),
                        onPressed: restrictions.isEmpty
                            ? () {}
                            : () {
                                setState(() {
                                  restrictions.clear();
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
                                builder: (context) => IngredientsScreen(),
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
                            onPressed: () {},
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
