import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

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
                Align(alignment: Alignment.centerLeft, child:
                Text(
                  "Hey,",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 78, 28, 24),
                  ),
                ),),
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
                          builder: (context) => const LoginScreen(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: "E-mail",
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        controller: emailController,
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
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
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 15,
                          ),
                        ),
                        controller: passwordController,
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
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
                        height: 20,
                      ),
                      ButtonTheme(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(255, 83, 71, 1)),
                          onPressed: () {},
                          child: Text("Login"),
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
}
