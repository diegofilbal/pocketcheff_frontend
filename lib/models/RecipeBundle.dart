import 'package:flutter/material.dart';

class RecipeBundle {
  final int id, chefs, recipes;
  final String title, description, imageSrc;
  final Color color;

  RecipeBundle(
      {this.id,
      this.chefs,
      this.recipes,
      this.title,
      this.description,
      this.imageSrc,
      this.color});
}

// Demo list
List<RecipeBundle> recipeBundles = [
  RecipeBundle(
    id: 1,
    chefs: 16,
    recipes: 95,
    title: "Cozinhe algo novo todos os dias",
    description: "Receitas novas e saborosas a cada minuto",
    imageSrc: "assets/images/cook_new@2x.png",
    color: Color(0xFFD82D40),
  ),
  RecipeBundle(
    id: 2,
    chefs: 8,
    recipes: 26,
    title: "O melhor de 2022",
    description: "Cozinhar receitas para ocasiões especiais",
    imageSrc: "assets/images/best_2020@2x.png",
    color: Color(0xFF90AF17),
  ),
  RecipeBundle(
    id: 3,
    chefs: 10,
    recipes: 43,
    title: "Praça de alimentação",
    description: "Qual é o seu prato de comida favorito faça agora",
    imageSrc: "assets/images/food_court@2x.png",
    color: Color(0xFF2DBBD8),
  ),
];
