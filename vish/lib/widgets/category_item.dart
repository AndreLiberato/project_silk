import 'dart:math';

import 'package:flutter/material.dart';

import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  Category category;

  CategoryItem(this.category);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 20,
      child: Card(
        color: Colors.primaries.elementAt(category.id).withOpacity(0.4),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: Image.asset(category.image),
            ),
            Flexible(
              child: Text(
                category.name,
                style: const TextStyle(
                    fontFamily: "Acme", fontSize: 20, color: Colors.black87),
              ),
            ),
            const SizedBox(
              width: 5,
            )
          ],
        ),
      ),
    );
  }
}
