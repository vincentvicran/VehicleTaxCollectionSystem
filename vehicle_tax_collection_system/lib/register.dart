import 'package:vehicle_tax_collection_system/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> formkey =GlobalKey<FormState>();
  var confirmPass;
  String _chosenValue;

  TextEditingController dateController = TextEditingController();
  DateTime _selectedDate;

  _selectDate() async {
    DateTime newSelectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2040),
    );

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;

      dateController
        ..text = DateFormat.yMMMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: dateController.text.length,
            affinity: TextAffinity.upstream));
      setState(() {

      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Form(
            key: formkey,
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sign Up', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),),
                SizedBox(height: 15),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    prefixIcon: Icon(Icons.account_circle,color: Colors.black,),
                    labelText: 'User Name',
                  ),
                  validator: (value){
                    if(value.isEmpty){
                      return "Name can't be empty";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15,),
                TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        prefixIcon: Icon(Icons.email,color: Colors.black),
                        labelText: 'Email Address'
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
                SizedBox(height: 15),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  autocorrect: false,
                  controller:dateController ,
                  onTap: () {
                    _selectDate();
                  },
                  validator: (value) {
                    if (value.isEmpty || value.length < 1) {
                      return 'Choose Date';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: 'DOB',
                    prefixIcon: Icon(Icons.calendar_today,color: Colors.black),
                    labelStyle:
                    TextStyle(decorationStyle: TextDecorationStyle.solid),
                  ),
                ),

                SizedBox(height: 15),
                Container(
                  height: 62,
                    // width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    border: Border.all(
                      color: Colors.grey ,
                      width: 1.0 ),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.location_city),
                      SizedBox(width: 10.0),
                      Expanded(
                        child:
                        DropdownButtonFormField<String>(
                          icon: null,
                          iconSize: 0.0,
                          isExpanded: true,
                          // focusColor:Colors.white,
                          value: _chosenValue,
                          //elevation: 5,
                          // style: TextStyle(color: Colors.white),
                          iconEnabledColor:Colors.black,
                          items: <String>[
                            'Kathmandu','Lalitpur' , 'Bhaktapur', 'Dhankuta' , 'Ilam' ,'Jhapa' ,'Khotang' ,'Morang' ,'Okhaldhunga' ,'Panchthar' ,'Sankhuwasabha', 'Solukhumbu',
                            'Sunsari'  ,'Taplejung', 'Tehrathum' ,
                            'Udayapur', 'Bara' ,'Parsa' ,'Dhanusha' ,'Mahottari', 'Rautahat' ,'Saptari', 'Sarlahi' 'Siraha' ,'Chitwan' ,'Dhading' ,'Dolakha' ,
                             'Kavrepalanchok' ,'Makwanpur' ,'Nuwakot' ,'Ramechhap' ,'Rasuwa' ,'Sindhuli' ,'Sindhupalchok',
                            'Baglung' ,'Gorkha' ,'Kaski' ,'Lamjung', 'Manang' ,'Mustang' ,'Myagdi' ,'Nawalpur' ,'Parbat', 'Syangja' ,'Tanahun',
                            'Arghakhanchi' ,'Banke','Bardiya' ,'Dang' ,'Eastern Rukum' ,'Gulmi' ,'Kapilavastu' ,'Parasi' ,'Palpa' ,'Pyuthan' ,'Rolpa','Rupandehi',
                            'Dailekh' ,'Dolpa','Humla' ,'Jajarkot' ,'Jumla' ,'Kalikot', 'Mugu' ,'Salyan' ,'Surkhet', 'Western Rukum',
                            'Achham' ,'Baitadi', 'Bajhang' ,'Bajura', 'Dadeldhura', 'Darchula' ,'Doti' ,'Kailali','Kanchanpur',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,style:TextStyle(color:Colors.black),),
                            );
                          }).toList(),
                          hint:Text(
                            "Select your address",
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          onChanged: (String value) async{
                            setState(() {
                              _chosenValue = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      prefixText: "+977 ",
                      prefixIcon: Icon(Icons.phone_callback,color: Colors.black),
                      labelText: 'Phone number'),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Phone number (+xxx xxx-xxxxxxx)';
                    } else if (value.length>10 || value.length<10) {
                      return 'Invalid Phone Number !';
                    }else
                      return null;
                  },
                ),

                SizedBox(height: 15),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.warning_rounded,color: Colors.black),
                  ),
                  obscureText: true,
                  validator: (value) {
                    confirmPass = value;
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
                SizedBox(height: 15,),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      labelText: 'Confirm Password',
                    prefixIcon: Icon(Icons.warning_rounded,color: Colors.black),
                  ),
                  obscureText: true,
                  validator: (value){
                    if(value.isEmpty){
                      return"Required";
                    }else if(value!=confirmPass){
                      return"Password must be same as above";
                    }else
                      return null;
                  },
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        if (formkey.currentState.validate()) {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                        } else {
                          print("Not Validated");
                        }
                      },
                      child: Chip(
                        label: Text('Signup',style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.w500),),
                        backgroundColor: Colors.blue[300],
                        padding: EdgeInsets.all(9.0),
                        elevation: 5.0,

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