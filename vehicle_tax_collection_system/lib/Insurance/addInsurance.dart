import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddInsurance extends StatefulWidget {
  const AddInsurance({Key key}) : super(key: key);

  @override
  _AddInsuranceState createState() => _AddInsuranceState();
}

class _AddInsuranceState extends State<AddInsurance> {
  GlobalKey<FormState> formkey =GlobalKey<FormState>();
  String _chosenValue;
  TextEditingController vehicleNumber = TextEditingController();
  TextEditingController insuranceDOI = TextEditingController();
  TextEditingController insuranceDOE = TextEditingController();
  DateTime _selectedDate;
  DateTime _paymentDate;

  _selectDate() async {
    DateTime newSelectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime(2022),
    );

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;

      insuranceDOI
        ..text = DateFormat.yMMMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: insuranceDOI.text.length,
            affinity: TextAffinity.upstream));
      setState(() {

      });
    }
  }

  _latestPaymentDate() async {
    DateTime newSelectedDate = await showDatePicker(
      context: context,
      initialDate: _paymentDate != null ? _paymentDate : DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime(2022),
    );

    if (newSelectedDate != null) {
      _paymentDate = newSelectedDate;

      insuranceDOE
        ..text = DateFormat.yMMMd().format(_paymentDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: insuranceDOE.text.length,
            affinity: TextAffinity.upstream));
      setState(() {

      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insurance'),
        centerTitle: true,
      ),
      body: Container(
        child: Form(
          key: formkey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 62,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    border: Border.all(
                        color: Colors.grey ,
                        width: 1.0 ),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.local_hospital),
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
                          items: <String>[ 'Full Insurance','Third Party'].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,style:TextStyle(color:Colors.black),),
                            );
                          }).toList(),
                          hint:Text(
                            "Insurance Type",
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
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: vehicleNumber,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    prefixIcon: Icon(Icons.format_list_numbered_outlined, color: Colors.black,),
                    labelText: 'Vehicle Number',
                    helperText:'Eg. BA 10 PA 1010 / BAGMATI PRADESH 3 2 003 PA 1111',
                  ),
                  validator: (value){
                    if(value.isEmpty){
                      return "Name can't be empty";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  autocorrect: false,
                  controller: insuranceDOI,
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
                    labelText: 'Insurance Date of Issue',
                    prefixIcon: Icon(Icons.calendar_today, color: Colors.black),
                    labelStyle:
                    TextStyle(decorationStyle: TextDecorationStyle.solid),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  autocorrect: false,
                  controller: insuranceDOE,
                  onTap: () {
                    _latestPaymentDate();
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
                    labelText: 'Insurance Date of Expiry',
                    prefixIcon: Icon(Icons.calendar_today, color: Colors.black),
                    labelStyle:
                    TextStyle(decorationStyle: TextDecorationStyle.solid),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      if (formkey.currentState.validate()) {
                        Navigator.pop(context);
                      } else {
                        print("Not Validated");
                      }
                    },
                    child: Chip(
                      label: Text('Submit',style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.w500),),
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
    );
  }
}
