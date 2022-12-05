import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pockectcheff/models/Recipe.dart';

class FirestoreSnippets {
  final FirebaseFirestore db;

  FirestoreSnippets(this.db);

  void readData() async {
    List<Recipe>? recipes;
    await db.collection("receitas").get().then((event) {
      for (var doc in event.docs) {
        recipes?.add(Recipe.fromFirestore(doc, null));
      }
    });
  }
}
