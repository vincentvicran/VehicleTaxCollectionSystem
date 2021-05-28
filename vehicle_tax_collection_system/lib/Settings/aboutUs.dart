import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('About Us'),
      ),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Container(
                  color: Colors.grey[400],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Just imagine: In this digital era, you making all your payments and transactions standing in a queue outside the office. It’s Nerve-wracking, right? To get you out of this situation, when the Internet was one of the luxurious things we Nepalese enjoyed, eSewa came into existence. With over a decade of operation, eSewa has been able to simplify the lives of various Nepalese assisting the simple payments to payments to the large corporate houses.Established in 2009, eSewa is a householdname today. South Asia’s first digital wallet, licensedPaymentService Provider from Nepal Rastra Bank (Central Bank ofNepal), and an ISO 27001:2013 certified, eSewa is asubsidiary company of F1Soft International, a leadingFinTech company of Nepal. Team eSewa has been working tirelessly to achieve its vision to create a cashless economy.For this, the company has on boarded more than 150k merchants,50 + Banks and Financial Institutions (BFIs) and established a wider network of agents nationwide. Customers of eSewa can make various bill payments easily from eSewa’s mobile app website login.Now,recharging mobile,paying utility bills(NEA, Khanepani, Landline, etc.),internet bills, TV bills, school fees, and many more are all on your fingertip.Being able to make the payment to government offices as In land Revenue Department,TrafficFinePayment,payment to Department of ForeignEmployment,and more act as acherry on top for our customers.",
                      style: TextStyle(fontWeight: FontWeight.w400,fontSize: 17.0),
                    ),
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
