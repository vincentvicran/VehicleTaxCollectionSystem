import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddPayment extends StatefulWidget {
  const AddPayment({Key key}) : super(key: key);

  @override
  _AddPaymentState createState() => _AddPaymentState();
}

class _AddPaymentState extends State<AddPayment> {
  TextEditingController vehicleNumber = TextEditingController();
  TextEditingController paymentAmount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Payment'),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: [
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
            TextFormField(
              controller: paymentAmount,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                prefixIcon: Icon(Icons.attach_money_outlined, color: Colors.black,),
                labelText: 'Payment Amount',
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly
              ],
            ),

          ],
        )
      ),
    );
  }
}
