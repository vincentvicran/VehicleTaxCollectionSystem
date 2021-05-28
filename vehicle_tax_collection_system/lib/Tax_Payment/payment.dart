import 'package:flutter/material.dart';
import 'package:vehicle_tax_collection_system/Tax_Payment/addPayment.dart';

class Payment extends StatefulWidget {
  const Payment({Key key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Tax Payment'),
      ),
      body: Container(
        child: ListView(
          children: [
            SizedBox(height: 10.0,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddPayment(),));
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(child: Text('+ Add Payment',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w500),)),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}