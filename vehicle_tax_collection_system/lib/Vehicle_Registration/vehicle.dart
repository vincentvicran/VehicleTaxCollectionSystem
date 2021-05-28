import 'package:flutter/material.dart';
import 'package:vehicle_tax_collection_system/Vehicle_Registration/addVehicle.dart';


class Vehicle extends StatefulWidget {
  const Vehicle({Key key}) : super(key: key);

  @override
  _VehicleState createState() => _VehicleState();
}

class _VehicleState extends State<Vehicle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Vehicle Registration'),
      ),
      body: Container(
        child: ListView(
          children: [
            SizedBox(height: 10.0,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddVehicle(),));
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(child: Text('+ Add Vehicle',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w500),)),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
