import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/product.dart';
import '/models/grocery_list.dart';
import '../widgets/my_appbar.dart';

class ListFormScreen extends StatefulWidget {
  const ListFormScreen({super.key});

  @override
  State<ListFormScreen> createState() => _ListFormScreenState();
}

class _ListFormScreenState extends State<ListFormScreen> {
  GroceryList? groceryList = GroceryList(name: "", id: "1");
  final FocusNode _nameNode = FocusNode();
  final FocusNode _descriptionNode = FocusNode();
  bool _hasAutoPayment = false;
  DateTime? _autoPaymentDate = DateTime.now();
  List<Product> _products = [];
  final GlobalKey _formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _nameNode.addListener(() {
      setState(() {});
    });
    _descriptionNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _nameNode.dispose();
    _descriptionNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      groceryList = ModalRoute.of(context)!.settings.arguments as GroceryList;
    } else {
      groceryList = null;
    }

    return Scaffold(
      appBar: MyAppBar(
          title: groceryList == null ? "Crie sua lista" : "Editando lista"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Informações",
                style: TextStyle(
                    color: Colors.black87, fontSize: 24, fontFamily: "Acme"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                focusNode: _nameNode,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                    labelText: "Nome da lista",
                    labelStyle: TextStyle(
                        color: _nameNode.hasFocus
                            ? Theme.of(context).primaryColor
                            : Colors.grey),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 3,
                        )),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                focusNode: _descriptionNode,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                    labelText: "Descrição",
                    labelStyle: TextStyle(
                        color: _descriptionNode.hasFocus
                            ? Theme.of(context).primaryColor
                            : Colors.grey),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 3,
                        )),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              const SizedBox(
                height: 15,
              ),
              CheckboxListTile(
                  dense: true,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text(
                    "Pagamento automático",
                    style: TextStyle(color: Colors.grey),
                  ),
                  value: _hasAutoPayment,
                  activeColor: Theme.of(context).primaryColor,
                  onChanged: (value) {
                    setState(() {
                      _hasAutoPayment = value!;
                    });
                  }),
              _hasAutoPayment
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Data da cobrança recorrente: ",
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextButton.icon(
                            icon: const Icon(
                              Icons.timer,
                              color: Colors.green,
                            ),
                            onPressed: () => showDatePicker(
                                  builder: (context, child) => Theme(
                                      data: Theme.of(context).copyWith(
                                          colorScheme: ColorScheme.light(
                                            primary:
                                                Theme.of(context).primaryColor,
                                            onPrimary: Colors.black87,
                                          ),
                                          textButtonTheme: TextButtonThemeData(
                                              style: TextButton.styleFrom(
                                                  foregroundColor:
                                                      Colors.grey))),
                                      child: child!),
                                  keyboardType: TextInputType.datetime,
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2050, 12, 31),
                                ).then((paymentDate) {
                                  setState(() {
                                    _autoPaymentDate = paymentDate;
                                  });
                                }),
                            label: _autoPaymentDate != null
                                ? Text(
                                    DateFormat("dd/MM/yyyy", "pt-BR")
                                        .format(_autoPaymentDate!),
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor),
                                  )
                                : Text(
                                    DateFormat("dd/MM/yyyy", "pt-BR")
                                        .format(DateTime.now()),
                                    style: const TextStyle(color: Colors.grey),
                                  )),
                      ],
                    )
                  : const SizedBox(
                      height: 0,
                    ),
              const Divider(
                color: Colors.black,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Produtos",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 24,
                        fontFamily: "Acme"),
                  ),
                  IconButton(
                      onPressed: () => showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: ((context) {
                            return SizedBox(
                              height: 500,
                              child: Text(
                                "Produtos",
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          })),
                      icon: const Icon(
                        Icons.add,
                        size: 36,
                      ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                flex: 4,
                fit: FlexFit.tight,
                child: ListView.builder(
                    itemCount: _products.length,
                    itemBuilder: ((context, index) => ListTile(
                          leading: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              backgroundImage:
                                  NetworkImage(_products[index].imageUrl[0])),
                        ))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
