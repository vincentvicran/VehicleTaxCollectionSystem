import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

List<String> _choicesList = ['Two Wheelers','Four Wheelers'];

class AddVehicle extends StatefulWidget {
  const AddVehicle({Key key}) : super(key: key);

  @override
  _AddVehicleState createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  GlobalKey<FormState> formkey =GlobalKey<FormState>();
  TextEditingController ownerName = TextEditingController();
  TextEditingController vehicleType = TextEditingController();
  TextEditingController vehicleNumber = TextEditingController();
  TextEditingController engineCapacity = TextEditingController();
  TextEditingController latestPaymentDate = TextEditingController();
  TextEditingController vehicleRegitrationDate = TextEditingController();
  // String _chosenValue;
  DateTime _selectedDate;
  DateTime _paymentDate;
  bool twoWheeler=true;
  bool fourWheeler=false;
 void initstate(){
   super.initState();
 }

  _selectDate() async {
    DateTime newSelectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime(2022),
    );

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;

      vehicleRegitrationDate
        ..text = DateFormat.yMMMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: vehicleRegitrationDate.text.length,
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

      latestPaymentDate
        ..text = DateFormat.yMMMd().format(_paymentDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: latestPaymentDate.text.length,
            affinity: TextAffinity.upstream));
      setState(() {

      });
    }
  }
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Add Vehicle'),
          centerTitle: true,
        ),
        body: Container(
          child: Form(
            key: formkey,
            child: ListView(
              children: [
                SizedBox(height: 12.0,),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 8,
                children: List.generate(_choicesList.length, (index) {
                  return ChoiceChip(
                    labelPadding: EdgeInsets.all(2.0),
                    label: Text(
                      _choicesList[index],
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(color: Colors.white, fontSize: 14),
                    ),

                    selected: index == 0 ? twoWheeler : fourWheeler,
                    selectedColor: Colors.black,
                    onSelected: (value) {
                      setState(() {
                        if(index==0){
                          if(twoWheeler){

                          }else{
                            twoWheeler =true;
                            fourWheeler=false;
                          }
                        }else{
                          if(fourWheeler){

                          }else{
                            fourWheeler =true;
                            twoWheeler=false;
                          }
                        }
                      });
                    },
                    // backgroundColor: color,
                    elevation: 1,
                    padding: EdgeInsets.all(8.0),
                  );
                }),
              ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: fields('Owner Name', ownerName, emptyValidator,null,Icons.account_circle,null),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    autocorrect: false,
                    controller: vehicleRegitrationDate,
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
                      labelText: 'Vehicle Registration Date',
                      prefixIcon: Icon(Icons.calendar_today, color: Colors.black),
                      labelStyle:
                      TextStyle(decorationStyle: TextDecorationStyle.solid),
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Container(
                //     height: 62,
                //     padding: const EdgeInsets.all(8.0),
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
                //       border: Border.all(
                //           color: Colors.grey ,
                //           width: 1.0 ),
                //     ),
                //     child: Row(
                //       children: [
                //         Icon(Icons.location_on),
                //         SizedBox(width: 10.0),
                //         Expanded(
                //           child:
                //           DropdownButtonFormField<String>(
                //             validator: (value)=>
                //             value == null ?   'Choose your Location' :  null,
                //
                //             icon: null,
                //             iconSize: 0.0,
                //             isExpanded: true,
                //             // focusColor:Colors.white,
                //             value: _chosenValue,
                //             //elevation: 5,
                //             // style: TextStyle(color: Colors.white),
                //             iconEnabledColor:Colors.black,
                //             items: <String>[ 'Two Wheeler','Four Wheeler'
                //             ].map<DropdownMenuItem<String>>((String value) {
                //               return DropdownMenuItem<String>(
                //                 value: value,
                //                 child: Text(value,style:TextStyle(color:Colors.black),),
                //               );
                //             }).toList(),
                //             hint:Text(
                //               "Select your address",
                //               style: TextStyle(
                //                   color: Colors.grey[600],
                //                   fontSize: 16,
                //                   fontWeight: FontWeight.w400),
                //             ),
                //             onChanged: (String value) async{
                //               setState(() {
                //                 _chosenValue = value;
                //               });
                //             },
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: fields('Vehicle Number', ownerName, emptyValidator,'Eg. BA 10 PA 1010 / BAGMATI PRADESH 3 2 003 PA 1111',Icons.format_list_numbered_outlined,null),
                ),
              TextFormField(
                  controller: engineCapacity,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      prefixIcon: Icon(Icons.bolt, color: Colors.black,),
                      prefixText: 'CC ',
                      labelText: 'Engine Capacity',
                      helperText: 'Eg. 125,150,200,220',
                  ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    autocorrect: false,
                    controller: latestPaymentDate,
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
                      labelText: 'Latest Payment Date',
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

  Widget fields(String label, TextEditingController controller,
      String Function(String) validator,helpertext,icon,prefix) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.grey),
        ),
        prefixIcon: Icon(icon, color: Colors.black,),
        prefixText: prefix,
        labelText: label,
        helperText: helpertext
      ),
      validator: validator
    );
  }

  String emptyValidator(String value) {
    if (value.isEmpty) {
      return "Name can't be empty";
    }
    return null;
  }

String engineCApacityValidator(String value) {
  if (value.isEmpty) {
    return "Value can't be empty";
  }else if(value.characters != null){
    return 'Invalid';
  }
  return null;
}


