import 'package:final_year_project/commonuserdashboardscreen.dart';
import 'package:final_year_project/donategoodsscreen.dart';
import 'package:flutter/material.dart';

class DonateMoneyScreen extends StatefulWidget {
  const DonateMoneyScreen({super.key});

  @override
  State<DonateMoneyScreen> createState() => _DonateMoneyScreenState();
}

class _DonateMoneyScreenState extends State<DonateMoneyScreen> {
  String paymentMethod = 'debit_card';

  DateTime? expiry_date;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text('Donate Money ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white)),
                  ),
                  const Text('| ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white)),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: InkWell(
                      child: const Text('Donate Goods ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white)),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const DonateGoodsScreen()));
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 280),
                child: Text('Pay With:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white)),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Radio(
                    value: 'debit_card',
                    groupValue: paymentMethod,
                    onChanged: (value) {
                      setState(() {
                        paymentMethod = 'debit_card';
                      });
                    },
                  ),
                  const Text('Debit Card',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white)),
                  Radio(
                    value: 'bank',
                    groupValue: paymentMethod,
                    onChanged: (value) {
                      setState(() {
                        paymentMethod = 'bank';
                      });
                    },
                  ),
                  const Text('Bank',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              paymentMethod == 'debit_card'
                  ? Container(
                      height: 520,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "4702 010 932 432",
                                labelText: "Card Number",
                                prefixIcon: const Icon(Icons.numbers_sharp),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: InkWell(
                              child: Container(
                                height: 60,
                                width: 310,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(children:  [
                                  const Text('   Expiry Date:   '),
                                  expiry_date==null? const Text('Pick Expiry Date'):Text(expiry_date.toString()),
                                ]),
                              ),
                              onTap: ()async{
                                 expiry_date= await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1990),
                                      lastDate: DateTime(2030),
                                      );
                                      setState(() {
                                        
                                      });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "550",
                                labelText: "CVV Number",
                                prefixIcon: const Icon(Icons.numbers),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: TextFormField(
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                hintText: "10000",
                                labelText: "Amount",
                                prefixIcon:
                                    const Icon(Icons.attach_money_outlined),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30, right: 30),
                            child: Container(
                              height: 50,
                              width: 300,
                              decoration: BoxDecoration(
                                color: const Color(0xFFD500F9),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: InkWell(
                                child: const Text('PAY',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                            child: AlertDialog(
                                          title: const Text(
                                              'Transaction has been done successfully!'),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const CommonUserDashboardScreen()));
                                                },
                                                child: const Text('OK')),
                                          ],
                                        ));
                                      });
                                },
                              )),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      height: 520,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0, top: 10),
                            child: Text(
                              'Bank Name:',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Padding(
                            padding: EdgeInsets.only(left: 125.0),
                            child: Text('Meezan Bank'),
                          ),
                          const SizedBox(height: 30),
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0, top: 10),
                            child: Text(
                              'Account Number:',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Padding(
                            padding: EdgeInsets.only(left: 125.0),
                            child: Text('4702-010-6538694'),
                          ),
                          const SizedBox(height: 30),
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0, top: 10),
                            child: Text(
                              'Account Title:',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Padding(
                            padding: EdgeInsets.only(left: 125.0),
                            child: Text('Muhammad Junaid Nasir'),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30, right: 30),
                            child: Container(
                              height: 50,
                              width: 300,
                              decoration: BoxDecoration(
                                color: const Color(0xFFD500F9),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: InkWell(
                                child: const Text('DONE',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                            child: AlertDialog(
                                          title: const Text(
                                              'Thank You for your contribution!'),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const CommonUserDashboardScreen()));
                                                },
                                                child: const Text('OK')),
                                          ],
                                        ));
                                      });
                                },
                              )),
                            ),
                          ),
                        ],
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
