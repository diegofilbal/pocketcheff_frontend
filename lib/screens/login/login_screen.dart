import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pockectcheff/screens/home/home_screen.dart';
import 'package:pockectcheff/screens/login/register_screen.dart';
import 'package:pockectcheff/screens/login/reset_password_screen.dart';

import '../search_recipe/ingredients_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  final _firebaseAuth = FirebaseAuth.instance;

  bool _isSelected = false;
  bool _isObscure = true;

  @override
  void initState() {
    _isObscure = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 227, 226, 1),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
          10,
          0,
          10,
          0,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Hey,",
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
                    "bem vinde!",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 78, 28, 24),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "Novo por aqui? ",
                      style: TextStyle(
                        color: Color.fromARGB(255, 118, 118, 118),
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                    ),
                    InkWell(
                      child: new Text(
                        'Crie uma conta.',
                        style: TextStyle(
                          color: Color.fromARGB(255, 185, 48, 39),
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        cursorColor: Color.fromARGB(255, 185, 48, 39),
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          labelText: "E-mail",
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        controller: emailController,
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        textAlign: TextAlign.center,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Insert your email";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        obscureText: _isObscure,
                        cursorColor: Color.fromARGB(255, 185, 48, 39),
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          labelText: "Password",
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 15,
                          ),
                          suffixIcon: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              }),
                        ),
                        controller: passwordController,
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        textAlign: TextAlign.center,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Insert your password";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          child: Row(
                            children: <Widget>[
                              Transform.scale(
                                scale: 0.8,
                                child: Checkbox(
                                  activeColor: Color.fromARGB(255, 185, 48, 39),
                                  checkColor: Colors.white,
                                  fillColor: MaterialStateProperty.all(
                                    Color.fromARGB(255, 185, 48, 39),
                                  ),
                                  value: _isSelected,
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      _isSelected = newValue!;
                                      print(_isSelected);
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                  child: Text(
                                "Salvar credenciais",
                                style: TextStyle(fontSize: 13),
                              )),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      ButtonTheme(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                            primary: Color.fromRGBO(255, 83, 71, 1),
                          ),
                          onPressed: () {
                            login();
                          },
                          child: Text("Login"),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Esqueceu senha? ",
                            style: TextStyle(
                              color: Color.fromARGB(255, 118, 118, 118),
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                            ),
                          ),
                          InkWell(
                            child: new Text(
                              'Redefina.',
                              style: TextStyle(
                                color: Color.fromARGB(255, 185, 48, 39),
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                              ),
                            ),
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ResetPasswordScreen(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        child: new Text(
                          'Usar sem login',
                          style: TextStyle(
                            color: Color.fromARGB(255, 118, 118, 118),
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                          ),
                        ),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
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
  }

  login() async{
    try{
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      if(userCredential != null){
          Navigator.pushReplacement(
            context, 
            MaterialPageRoute(
             builder: (context) => IngredientsScreen(),
            ),
        );
      }
    } on FirebaseAuthException catch(e){
      if(e.code == 'user-not-found'){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Usu??rio n??o encontrado!'),
          backgroundColor: Colors.redAccent,
          ),
        );
      }else if(e.code == 'wrong-password'){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Senha incorreta!'),
          backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }
}
