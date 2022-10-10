import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({super.key});

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      height: 45,
      child: Material(
        shadowColor: Colors.black,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        elevation: 3,
        child: TextField(
            controller: _searchController,
            cursorColor: Colors.black26,
            textAlignVertical: TextAlignVertical.center,
            style: const TextStyle(
              color: Colors.black54,
            ),
            decoration: const InputDecoration(
                hintText: "Procurar produtos",
                prefixIcon: Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.black38,
                ),
                fillColor: Colors.black12,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(15))))),
      ),
    );
  }
}
