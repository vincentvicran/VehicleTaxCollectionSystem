import 'package:flutter/material.dart';

List< Map<String,dynamic>> info = [
  {'icon':Icons.account_circle,'name':'Adit Dahal','title':'Name'},
  {'icon':Icons.email,'name':'dahaladit61@gmail.com','title':'Email'},
  {'icon':Icons.date_range,'name':'19 April,1999','title':'DOB'},
  {'icon':Icons.location_city,'name':'Kathmandu','title':'Address'},
];

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextStyle homeStyle = TextStyle( fontSize: 16.0,fontWeight: FontWeight.w400);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile',style: TextStyle(),),
      ),
      body: Container(
        child: ListView(
          children: [
            SizedBox(height: 10.0,),
            CircleAvatar(
              child: Image.network('https://cdn1.iconfinder.com/data/icons/material-core/20/account-circle-512.png',fit: BoxFit.cover,),
              radius: 60,
            ),
            SizedBox(height: 10.0,),
            Center(child: Text('Contact No.')),
            Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
              "General Information",
              style: TextStyle(fontSize: 16.0,color: Colors.blue),
            ),
                      SizedBox(height: 8.0,),

                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: info.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(info[index]['icon'],size: 25.0),
                                  SizedBox(width: 10.0,),
                                  Text(info[index]['title'],style: homeStyle,),
                                  Text(" : "),
                                  Text( info[index]['name'],style: homeStyle,),
                                ],
                              ),
                            );
                          }),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
