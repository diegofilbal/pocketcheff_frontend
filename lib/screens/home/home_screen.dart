import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pockectcheff/size_config.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
    );
  }

  AppBar buildAppBar(){
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

}
