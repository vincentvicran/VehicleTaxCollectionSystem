import 'package:flutter/material.dart';
import 'package:vehicle_tax_collection_system/Insurance/insurance.dart';
import 'package:vehicle_tax_collection_system/Tax_Payment/payment.dart';
import 'package:vehicle_tax_collection_system/profile.dart';

import 'Vehicle_Registration/vehicle.dart';

// List< Map<String,dynamic>> data = [
//   {'title': 'Vehicle Registration', 'subtitle': 'New vehicle registration'},
//   {'title': 'Insurance', 'subtitle': 'Insurance department'},
//   {'title': 'Tax payment', 'subtitle': 'Tax Payment Related concerns'},
// ];

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blueAccent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.notifications, size: 30, color: Colors.black),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 0.0),
          child: IconButton(
            icon: Icon(
              Icons.account_circle,
              size: 50.0,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profile(),
                  ));
            },
          ),
          // child: (Icon(
          //   Icons.account_circle_outlined, size: 55, color: Colors.black,),)
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.indigo,
            Colors.teal,
          ],
        )),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(image: AssetImage("assets/Government.png"),height: 220.0,),
            ),
            InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Vehicle(),
                          ));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Card(
                        elevation: 6,
                        child: ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 9.0),
                            child: Text('1',style: TextStyle(fontSize: 18.0),),
                          ),
                          title: Text('Vehicle Registration'),
                          subtitle:
                              Text('New vehicle registration'),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),
                  ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Insurance(),
                    ));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Card(
                  elevation: 6,
                  child: ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 9.0),
                      child: Text('2',style: TextStyle(fontSize: 18.0),),
                    ),
                    title: Text('Insurance'),
                    subtitle:
                    Text('Insurance department'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Payment(),
                    ));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Card(
                  elevation: 6,
                  child: ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 9.0),
                      child: Text('3',style: TextStyle(fontSize: 18.0),),
                    ),
                    title: Text('Tax payment'),
                    subtitle:
                    Text('Tax Payment Related concerns'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
