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

  void updateList(GroceryList newGroceryList, GroceryList oldGroceryList) {
    var isAuto = newGroceryList.hasAutoPayment;

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
