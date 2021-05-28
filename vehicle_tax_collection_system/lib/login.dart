import 'package:flutter/material.dart';
import 'package:vehicle_tax_collection_system/navigation.dart';
import 'package:vehicle_tax_collection_system/register.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  bool _obscureText= true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightBlueAccent,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formkey,
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(height: 60.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 50.0),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, top: 15.0, right: 20.0, bottom: 15.0),
                          child: Column(
                            children: [
                              TextFormField(
                                  controller: controllerEmail,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0)),
                                      borderSide: BorderSide(
                                          color: Colors.grey),
                                    ),
                                    labelText: 'Email Address',
                                    prefixIcon: Icon(
                                        Icons.email, color: Colors.black),
                                  ),
                                  validator: (value) {
                                    if (RegExp(
                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                        .hasMatch(value)) {
                                      return null;
                                    } else {
                                      return "Invalid Email !";
                                    }
                                  }
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                 obscureText: _obscureText,
                                controller: controllerPassword,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  prefixIcon: Icon(Icons.vpn_key,
                                      color: Colors.black),
                                  labelText: 'Password',
                                  suffixIcon: GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                    child: Icon(
                                      _obscureText ? Icons.visibility  : Icons.visibility_off,color: Colors.black,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if(value.isEmpty){
                                    return "Required ";
                                  }else if(value.length<6) {
                                    return "Password should be 6 characters long";
                                  }else if(value.length>15) {
                                    return "Password shoud not be greater than 15 characters";
                                  }else
                                    return null;
                                },
                              ),
                              SizedBox(height: 15.0),
                              Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Register()));
                                      },
                                      child: Text(
                                        'Register Now',
                                        style: TextStyle(
                                            color: Colors.blue, fontSize: 15),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      'Forget Password?',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15.0),
                              InkWell(
                                onTap: () {
                                  if (formkey.currentState.validate()) {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => Navigation()));
                                  } else {
                                    print("Not Validated");
                                  }
                                },
                                child: Chip(
                                  padding: EdgeInsets.all(12.0),
                                  backgroundColor: Colors.blueAccent,
                                  label: Text(
                                    "LOGIN",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}