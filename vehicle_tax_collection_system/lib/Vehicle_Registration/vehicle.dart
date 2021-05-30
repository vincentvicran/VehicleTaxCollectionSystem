import 'package:flutter/material.dart';
import 'package:vehicle_tax_collection_system/Models/addVehicleModel.dart';
import 'package:vehicle_tax_collection_system/Vehicle_Registration/addVehicle.dart';

// List icon = [
//   Icons.account_circle,
//   Icons.calendar_today,
//   Icons.format_list_numbered_outlined,
//   Icons.print,
//   Icons.bolt,
//   Icons.calendar_today
// ];


Map vehicleInfo = {
  'Owner Name': 'Vikrant Shrestha',
  'Vehicle Registration date': '2014-01-22',
  'Vehicle Type': 'Two Wheeler',
  'Vehicle NUmber': 'BA 98 PA 1024',
  'Engine Capacity': '150 CC',
  'Latest Payment Date': '2014-01-22'
};

class Vehicle extends StatefulWidget {
  const Vehicle({Key key, this.vehicle}) : super(key: key);
  final AddVehicleModel vehicle;

  @override
  _VehicleState createState() => _VehicleState();
}

class _VehicleState extends State<Vehicle> {
  TextStyle homeStyle = TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400);

  // List <Map<String,dynamic>> vehicleInformation=[
  //   {"icon":"Icons.account_circle","title":"Owner Name","subtitle":"Vikrant Shrestha"},
  //   {"icon": "Icons.calendar_today", "title":"Vehicle Registration date" ,"subtitle": "2014-01-22"},
  //   {"icon": "Icons.format_list_numbered_outlined", "title":"Vehicle Type" ,"subtitle": "Two Wheeler"},
  //   {"icon":  "Icons.print", "title":"Vehicle Number" ,"subtitle": "BA 98 PA 1024"},
  //   {"icon":"Icons.bolt", "title":"Engine Capacity" ,"subtitle": "150 CC"},
  //   {"icon": "Icons.calendar_today", "title":"Latest Payment Date" ,"subtitle": "2014-01-22"},
  // ];


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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "INFO",
                      style: TextStyle(fontSize: 16.0, color: Colors.red),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                        itemCount: vehicleInfo.length,
                        itemBuilder: (context, index) {
                          return Text('${vehicleInfo.keys.toList()[index]} : ${vehicleInfo.values.toList()[index]}');
                        }),
                    // Row(
                    //   children: [
                    //     Text('Owner Name : '),
                    //     Text(widget.vehicle?.ownerName ?? 'NA '),
                    //   ],
                    // ),
                    // Row(
                    //   children: [
                    //     Text('Vehicle Registration Date : '),
                    //     Text(widget.vehicle?.vehicleregistrationDate ?? 'NA'),
                    //   ],
                    // ),
                    // Row(
                    //   children: [
                    //     Text('Vehicle Number : '),
                    //     Text(widget.vehicle?.vehicleNumber ?? 'NA '),
                    //   ],
                    // ),
                    // Row(
                    //   children: [
                    //     Text('Engine Capacity'),
                    //     Text(widget.vehicle?.engineCapacity ?? 'NA '),
                    //   ],
                    // ),
                    // Row(
                    //   children: [
                    //     Text('Latest Payment Date : '),
                    //     Text(widget.vehicle?.latestpaymentDate ?? 'NA '),
                    //   ],
                    // ),


                  ],
                ),
              ),
            ),

            SizedBox(
              height: 10.0,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddVehicle(),
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                      child: Text(
                        '+ Add Vehicle',
                        style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
