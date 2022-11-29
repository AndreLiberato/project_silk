import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vish/widgets/list_product_item.dart';

import '../models/list_product.dart';
import '../models/product.dart';
import '../providers/groceries_lists_provider.dart';
import '../widgets/products_list_selection.dart';
import '/models/grocery_list.dart';
import '../widgets/my_appbar.dart';

class ListFormScreen extends StatefulWidget {
  const ListFormScreen({super.key});

  @override
  State<ListFormScreen> createState() => _ListFormScreenState();
}

class _ListFormScreenState extends State<ListFormScreen> {
  GroceryList? groceryList;
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final FocusNode _nameNode = FocusNode();
  final FocusNode _descriptionNode = FocusNode();
  bool _hasAutoPayment = false;
  DateTime? _autoPaymentDate = DateTime.now();
  List<ListProduct> _products = [];
  final _formKey = GlobalKey<FormState>();

  @override
  void initialState() {
    super.initState();
    _nameController.text = '';
    _descriptionController.text = '';
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

  void _updateProductsInList(List<Product> updatedProducts) {
    setState(() {
      _products = updatedProducts.map((product) {
        if (_products.any((listProduct) => listProduct.product == product)) {
          return _products
              .firstWhere((myProduct) => myProduct.product == product);
        } else {
          return ListProduct(product, 1);
        }
      }).toList();
    });
  }

  void _unfocusAllTextFields() {
    _nameNode.unfocus();
    _descriptionNode.unfocus();
  }

  void _updateProductQuantity(ListProduct listProduct) {
    var updatedProducts = _products.map((product) {
      if (product.product == listProduct.product) {
        return listProduct;
      } else {
        return product;
      }
    }).toList();
    setState(() {
      _products = updatedProducts;
    });
  }

  void _validateForm() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    _saveGroceryList();
  }

  void _saveGroceryList() {
    var newGroceryList = GroceryList(
      name: _nameController.text,
      creatorId: "",
      id: Random().nextInt(1000).toString(),
      description: _descriptionController.text,
      hasAutoPayment: _hasAutoPayment,
      listProducts: _products,
      creationDate: DateTime.now(),
      paymentDate: _hasAutoPayment ? _autoPaymentDate : null,
    );
    groceryList == null
        ? Provider.of<GroceriesListsProvider>(context, listen: false)
            .addList(newGroceryList)
        : Provider.of<GroceriesListsProvider>(context, listen: false)
            .updateList(newGroceryList, groceryList!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments != null &&
        groceryList == null) {
      groceryList = ModalRoute.of(context)!.settings.arguments as GroceryList;
      _nameController.text = groceryList!.name;
      _descriptionController.text = groceryList!.description;
      _products = groceryList!.listProducts;
      _hasAutoPayment = groceryList!.hasAutoPayment;
      _autoPaymentDate = groceryList!.paymentDate;
    }

    return Scaffold(
      appBar: MyAppBar(
        title: groceryList == null ? "Crie sua lista" : "Editando lista",
        actions: [
          IconButton(
              onPressed: () => _validateForm(), icon: const Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Form(
          key: _formKey,
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
              SizedBox(
                height: 60,
                child: TextFormField(
                  style: const TextStyle(color: Colors.black),
                  maxLength: 12,
                  focusNode: _nameNode,
                  cursorColor: Theme.of(context).primaryColor,
                  controller: _nameController,
                  onTap: () {
                    setState(() {
                      _descriptionNode.unfocus();
                      _nameNode.requestFocus();
                    });
                  },
                  decoration: InputDecoration(
                    labelText: "Nome da lista",
                    labelStyle: TextStyle(
                        color: _nameNode.hasFocus
                            ? Theme.of(context).primaryColor
                            : Colors.black54),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 3,
                        )),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  validator: (name) {
                    if (name!.isEmpty) {
                      return "Insira um nome para a lista";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 60,
                child: TextFormField(
                  style: const TextStyle(color: Colors.black),
                  maxLength: 30,
                  controller: _descriptionController,
                  focusNode: _descriptionNode,
                  cursorColor: Theme.of(context).primaryColor,
                  onTap: () {
                    setState(() {
                      _nameNode.unfocus();
                      _descriptionNode.requestFocus();
                    });
                  },
                  decoration: InputDecoration(
                    labelText: "Descrição",
                    labelStyle: TextStyle(
                        color: _descriptionNode.hasFocus
                            ? Theme.of(context).primaryColor
                            : Colors.black54),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 3,
                        )),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (description) {
                    if (description!.isEmpty) {
                      return "Insira uma descrição para a lista";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              CheckboxListTile(
                  dense: true,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text(
                    "Pagamento automático",
                    style: TextStyle(color: Colors.grey),
                  ),
                  value: _hasAutoPayment,
                  contentPadding: const EdgeInsets.only(right: 130),
                  activeColor: Theme.of(context).primaryColor,
                  onChanged: (value) {
                    setState(() {
                      _nameNode.unfocus();
                      _descriptionNode.unfocus();
                      _hasAutoPayment = value!;
                      _autoPaymentDate = DateTime.now();
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
                                    if (paymentDate != null) {
                                      _autoPaymentDate = paymentDate;
                                    } else {
                                      _autoPaymentDate = DateTime.now();
                                    }
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
                        fontSize: 20,
                        fontFamily: "Acme"),
                  ),
                  IconButton(
                      onPressed: () {
                        _unfocusAllTextFields();
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          builder: ((context) {
                            return Container(
                              height: 550,
                              padding: const EdgeInsets.only(
                                  left: 5, right: 5, top: 30),
                              child: ProductsListSelection(
                                  _products
                                      .map((listProduct) => listProduct.product)
                                      .toList(),
                                  _updateProductsInList),
                            );
                          }),
                        );
                      },
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
                    itemBuilder: ((context, index) =>
                        ListProductItem(_products[index], true))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
