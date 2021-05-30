import 'package:flutter/material.dart';
import 'package:vehicle_tax_collection_system/Insurance/addInsurance.dart';

List icon =[
  Icons.local_hospital,
  Icons.format_list_numbered,
  Icons.calendar_today,
  Icons.calendar_today
];

Map insuranceInfo={
  "Insurance Type":"Third Party",
  "Vehicle Number":"BA 10 PA 1024 ",
  "Insurance DOI":"1998-10-15",
  "Insurance DOE":"1998-10-15",
};

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
                      "First Data",
                      style: TextStyle(fontSize: 16.0, color: Colors.red),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: insuranceInfo.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              Icon(icon[index]),
                              SizedBox(width:5.0),
                              Text('${insuranceInfo.keys.toList()[index]} : ${insuranceInfo.values.toList()[index]}'),
                            ],
                          );
                        }

                    ),

                  ],
                ),
              ),
            ),
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