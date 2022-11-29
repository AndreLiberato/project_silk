import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/grocery_list.dart';

class GroceriesListsProvider extends ChangeNotifier {
  // final List<GroceryList> _manualLists = groceriesLists
  //     .where((groceryList) => groceryList.hasAutoPayment == false)
  //     .toList();
  // final List<GroceryList> _autoLists = groceriesLists
  //     .where((groceryList) => groceryList.hasAutoPayment == true)
  //     .toList();

  final List<GroceryList> _manualLists = [];
  final List<GroceryList> _autoLists = [];

  List<GroceryList> get manualLists => _manualLists;
  List<GroceryList> get autoLists => _autoLists;

  var firebaseCollectionRef =
      FirebaseFirestore.instance.collection("grocerylists");

  Future<void> addList(GroceryList groceryList) async {
    var auth = FirebaseAuth.instance;
    var user = auth.currentUser;
    groceryList.creatorId = user!.uid;
    try {
      FirebaseFirestore.instance
          .collection("grocerylists")
          .add(groceryList.toJson())
          .then((document) => groceryList.id = document.id);
      if (groceryList.hasAutoPayment) {
        _autoLists.add(groceryList);
      } else {
        _manualLists.add(groceryList);
      }
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> updateList(
      GroceryList newGroceryList, GroceryList oldGroceryList) async {
    var isAuto = newGroceryList.hasAutoPayment;
    var auth = FirebaseAuth.instance;
    var user = auth.currentUser;
    newGroceryList.creatorId = user!.uid;

    try {
      FirebaseFirestore.instance
          .collection("grocerylists")
          .doc(oldGroceryList.id)
          .update(newGroceryList.toJson());
      if (isAuto) {
        if (oldGroceryList.hasAutoPayment) {
          var index = _autoLists.indexOf(oldGroceryList);
          _autoLists.removeAt(index);
          _autoLists.insert(index, newGroceryList);
        } else {
          var index = _manualLists.indexOf(oldGroceryList);
          _manualLists.removeAt(index);
          _autoLists.add(newGroceryList);
        }
      } else {
        if (oldGroceryList.hasAutoPayment) {
          var index = _autoLists.indexOf(oldGroceryList);
          _autoLists.removeAt(index);
          _manualLists.add(newGroceryList);
        } else {
          var index = _manualLists.indexOf(oldGroceryList);
          _manualLists.removeAt(index);
          _manualLists.insert(index, newGroceryList);
        }
      }
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> removeList(GroceryList groceryList) async {
    var auth = FirebaseAuth.instance;
    var user = auth.currentUser;

    try {
      FirebaseFirestore.instance
          .collection("grocerylists")
          .doc(groceryList.id)
          .delete();
      if (groceryList.hasAutoPayment) {
        _autoLists.remove(groceryList);
      } else {
        _manualLists.remove(groceryList);
      }
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> fetchGroceryLists() async {
    var auth = FirebaseAuth.instance;
    var user = auth.currentUser;

    try {
      _autoLists.clear();
      _manualLists.clear();
      await firebaseCollectionRef
          .get()
          .then((snapshot) => snapshot.docs.forEach((doc) {
                if (doc.data()["creatorId"] == user!.uid) {
                  if (doc.data()["hasAutoPayment"]) {
                    _autoLists.add(GroceryList.fromJson(doc.id, doc.data()));
                  } else {
                    _manualLists.add(GroceryList.fromJson(doc.id, doc.data()));
                  }
                }
              }));
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
