import 'package:flutter/material.dart';
import 'package:vehicle_tax_collection_system/Insurance/addInsurance.dart';

class Insurance extends StatefulWidget {
  const Insurance({Key key}) : super(key: key);

  @override
  _InsuranceState createState() => _InsuranceState();
}

class _InsuranceState extends State<Insurance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Insurance'),
      ),
      body: Container(
        child: ListView(
          children: [
            SizedBox(height: 10.0,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddInsurance(),));
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(child: Text('+ Add Insurance',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w500),)),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}