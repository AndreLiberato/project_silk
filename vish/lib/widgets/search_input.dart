import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({super.key});

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
          cursorColor: Colors.grey,
          decoration: InputDecoration(
              hintText: "Procurar produtos",
              prefixIcon: const Icon(
                Icons.search,
                size: 30,
                color: Colors.black38,
              ),
              fillColor: Theme.of(context).primaryColor,
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))))),
    );
  }
}
