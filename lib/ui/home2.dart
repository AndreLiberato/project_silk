import 'package:flutter/material.dart';
import 'home.dart';

class Home2 extends StatefulWidget {
  @override
  _Home2State createState() => _Home2State();
}
 
  class _Home2State extends State<Home2> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset(
                "images/logo.png",
                fit: BoxFit.cover,
                height: 330.0,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30.0, left: 15.0),
                child: Container(
                  child: Text(
                    "Crie sua conta",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color:Colors.black, 
                        fontSize:25.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30.0, left: 15.0, right: 15.0),
                child: Container(
                  child:TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        prefixIconColor: Color.fromARGB(255, 250, 102, 46),
                        iconColor: Color.fromARGB(255, 232, 236, 242),
                        hintText: "Informe o seu nome",
                        labelStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Color.fromARGB(255, 232, 236, 242),
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 250, 102, 46)),
                            borderRadius: BorderRadius.circular(15.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 232, 236, 242)),
                            borderRadius: BorderRadius.circular(15.0),
                        ),
                        errorBorder: OutlineInputBorder( 
                          borderSide: BorderSide(
                              width: 3, color: Colors.redAccent), 
                              borderRadius: BorderRadius.circular(15.0),
                        ),
                        contentPadding:
                          EdgeInsets.only(bottom: 20, top: 20, right: 15),
                    ),
                    
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                    controller: nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Insira seu nome!";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30.0, left: 15.0, right: 15.0),
                child: Container(
                  child:TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.mail),
                        iconColor: Color.fromARGB(255, 232, 236, 242),
                        prefixIconColor: Color.fromARGB(255, 250, 102, 46),
                        hintText: "Informe o seu e-mail",
                        labelStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Color.fromARGB(255, 232, 236, 242),
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 250, 102, 46)),
                            borderRadius: BorderRadius.circular(15.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 232, 236, 242)),
                            borderRadius: BorderRadius.circular(15.0),
                        ),
                        errorBorder: OutlineInputBorder( 
                          borderSide: BorderSide(
                              width: 3, color: Colors.redAccent), 
                              borderRadius: BorderRadius.circular(15.0),
                        ),
                        contentPadding:
                          EdgeInsets.only(bottom: 20, top: 20, right: 15),
                    ),
                    
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Insira seu e-mail!";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30.0, left: 15.0, right: 15.0),
                child: Container(
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(                        
                              _isObscure ? Icons.visibility : Icons.visibility_off
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          }),
                        iconColor: Color.fromARGB(255, 232, 236, 242),
                        hintText: "Informe sua senha",
                        labelStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Color.fromARGB(255, 232, 236, 242),
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 250, 102, 46)),
                            borderRadius: BorderRadius.circular(15.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 232, 236, 242)),
                            borderRadius: BorderRadius.circular(15.0),
                        ),
                        errorBorder: OutlineInputBorder( 
                          borderSide: BorderSide(
                              width: 3, color: Colors.redAccent), 
                              borderRadius: BorderRadius.circular(15.0),
                        ),
                        contentPadding:
                          EdgeInsets.only(bottom: 20, top: 20, right: 15),
                    ),
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                    controller: passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Insira sua senha!";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0, left: 15.0, right: 15.0),
                child: Container(
                  height: 60.0,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        
                      }
                    },
                    child: Text(
                      "CRIAR CONTA",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 250, 102, 46),
                        textStyle: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Container(
                  child: CheckboxListTile(
                    title: Text("Ao clicar em “Criar Conta” você aceita nossos termos e condições?"),
                    value: isChecked,
                    activeColor: Color.fromARGB(255, 250, 102, 46), 
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (newBool){
                      setState(() {
                        isChecked = newBool;
                      });
                    }
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  Text(
                    "Já tem uma conta?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color:Colors.grey, 
                      fontSize:16.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () { 
                      _redirect2();
                    },
                    child: Text(
                      "Entre",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color:Color.fromARGB(255, 250, 102, 46), 
                        fontSize:16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _redirect2(){
    Navigator.pop(context);
  }
}
