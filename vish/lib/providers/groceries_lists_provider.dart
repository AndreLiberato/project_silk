import 'package:flutter/material.dart';

import '../data/groceries_lists.dart';
import '../models/grocery_list.dart';

class GroceriesListsProvider extends ChangeNotifier {
  final List<GroceryList> _manualLists = groceriesLists
      .where((groceryList) => groceryList.hasAutoPayment == false)
      .toList();
  final List<GroceryList> _autoLists = groceriesLists
      .where((groceryList) => groceryList.hasAutoPayment == true)
      .toList();

  List<GroceryList> get manualLists => _manualLists;
  List<GroceryList> get autoLists => _autoLists;

  void addList(GroceryList groceryList) {
    if (groceryList.hasAutoPayment) {
      _autoLists.add(groceryList);
    } else {
      _manualLists.add(groceryList);
    }
    notifyListeners();
  }

  void removeList(GroceryList groceryList) {
    if (groceryList.hasAutoPayment) {
      _autoLists.remove(groceryList);
    } else {
      _manualLists.remove(groceryList);
    }
    notifyListeners();
  }
}
