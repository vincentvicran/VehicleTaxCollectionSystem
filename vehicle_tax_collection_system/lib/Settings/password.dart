import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Password extends StatefulWidget {
  const Password({Key key}) : super(key: key);

  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Change Password"),
      ),
      body: Container(
        child: Form(
          key: formkey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Container(
                    child: ListView(
                  shrinkWrap: true,
                  children: [
                    SizedBox(
                      height: 5.0,
                    ),
                    // Text(
                    //   'Create your new password',
                    //   style: TextStyle(fontSize: 16.0),
                    // ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: formFields("Old Password", oldPassword, validator),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: formFields("New Password", newPassword, validator),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: formFields("Confirm Password", confirmPassword,
                          confirmPassValidator),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    InkWell(
                      onTap: () {
                        if (formkey.currentState.validate()) {
                          Fluttertoast.showToast(msg: "Password Changed Successful");
                          Navigator.pop(context);
                        }else{
                          return Fluttertoast.showToast(msg: "Error",backgroundColor: Colors.grey,);

                        }

                      },
                      child: Chip(
                        padding: EdgeInsets.all(12.0),
                        backgroundColor: Colors.blueAccent,
                        label: Text(
                          "Submit",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget formFields(String label, TextEditingController controller,
      String Function(String) validator) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.grey),
        ),
        labelText: label,
        prefixIcon: Icon(Icons.warning_rounded, color: Colors.black),
      ),
      obscureText: true,
      validator: validator,
    );
  }

  String validator(String value) {
    if (value.isEmpty) {
      return "Required ";
    } else if (value.length < 6) {
      return "Password should be 6 characters long";
    } else if (value.length > 15) {
      return "Password shoud not be greater than 15 characters";
    } else
      return null;
  }

  String confirmPassValidator(String value) {
    if(value.isEmpty){
      return 'Required';
    }else if (newPassword.text != confirmPassword.text) {
    return 'Password must be same as above';
    }
    else {
    return null;
    }
  }
}
