import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vehicle_tax_collection_system/Settings/aboutUs.dart';
import 'package:vehicle_tax_collection_system/Settings/password.dart';
import 'package:vehicle_tax_collection_system/login.dart';


class Settings extends StatefulWidget {
  const Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Settings'),
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
            SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Password()));
                },
                child: Card(
                  elevation: 6,
                  child: ListTile(
                    leading: Icon(Icons.warning_rounded, size: 35.0,),
                    title: Text(
                      'Change Password', style: TextStyle(fontSize: 18.0),),
                    subtitle:
                    Text('Change User Password'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutUs()));
                },
                child: Card(
                  elevation: 6,
                  child: ListTile(
                    leading: Icon(Icons.comment, size: 35.0,),
                    title: Text('About Us', style: TextStyle(fontSize: 18.0),),
                    subtitle:
                    Text('Know about Vehicle tax collection app'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                onTap: () {
                  Fluttertoast.showToast(msg: "Logged Out Successful");
                  Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (BuildContext context) => Login()),
                  (Route<dynamic> route) => false);
                },
                child: Card(
                  elevation: 6,
                  child: ListTile(
                    leading: Icon(Icons.account_circle_outlined, size: 35.0,),
                    title: Text('Log Out', style: TextStyle(fontSize: 18.0),),
                    subtitle:
                    Text('End User Session'),
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