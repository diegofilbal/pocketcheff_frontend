import 'package:cloud_firestore/cloud_firestore.dart';

enum RecipeType {
  food,
  drink,
}

class Recipe {
  String? id;
  String? name;
  List<String>? ingredients;
  List<String>? preparation;
  int? duration;
  int? servings;
  String? imageURL;

  Recipe({
    this.id,
    this.name,
    this.ingredients,
    this.preparation,
    this.duration,
    this.servings,
    this.imageURL,
  });

  factory Recipe.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Recipe(
      id: data?['id'],
      name: data?['name'],
      ingredients: data?['ingredients'] is Iterable
          ? List.from(data?['ingredients'])
          : null,
      preparation: data?['preparation'] is Iterable
          ? List.from(data?['preparation'])
          : null,
      duration: data?['duration'],
      servings: data?['servings'],
      imageURL: data?['imageURL'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (name != null) "name": name,
      if (ingredients != null) "ingredients": ingredients,
      if (preparation != null) "preparation": preparation,
      if (duration != null) "duration": duration,
      if (servings != null) "servings": servings,
      if (imageURL != null) "imageURL": imageURL,
    };
  }
}
