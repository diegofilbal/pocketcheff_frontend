import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pockectcheff/screens/login/login_screen.dart';
import 'package:pockectcheff/screens/search_recipe/ingredients_screen.dart';
import 'package:pockectcheff/size_config.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: Center(child: buildHomeScreenBody(context)),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {},
      ),
      centerTitle: true,
      title: Image.asset("assets/images/logo.png"),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: () {},
        ),
        SizedBox(
          width: SizeConfig.defaultSize! * 0.5,
        )
      ],
    );
  }

  Widget buildHomeScreenBody(BuildContext buildContext) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            ButtonTheme(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 255, 67, 54)),
                onPressed: (() async => await Navigator.push(
                      buildContext,
                      MaterialPageRoute(
                        builder: (buildContext) => const IngredientsScreen(),
                      ),
                    )),
                child: Text(
                  "Procure por receitas",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            ButtonTheme(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 255, 67, 54)),
                onPressed: (() async => await Navigator.push(
                      buildContext,
                      MaterialPageRoute(
                        builder: (buildContext) => const LoginScreen(),
                      ),
                    )),
                child: Text(
                  "Já sou usuário",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
