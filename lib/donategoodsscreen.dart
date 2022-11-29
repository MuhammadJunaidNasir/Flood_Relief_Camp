import 'package:final_year_project/commonuserdashboardscreen.dart';
import 'package:flutter/material.dart';

class DonateGoodsScreen extends StatefulWidget {
  const DonateGoodsScreen({super.key});

  @override
  State<DonateGoodsScreen> createState() => _DonateGoodsScreenState();
}

class _DonateGoodsScreenState extends State<DonateGoodsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:   [
                         const Padding(
                           padding: EdgeInsets.only(left:10.0,top: 35),
                           child: Text('Donate Goods',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20)),
                         ),
                         const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter Name of Item",
                    labelText: "Item Name",
                    prefixIcon: const Icon(Icons.luggage),
                    iconColor:Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Goods Pickup Address",
                    labelText: "Pickup Address",
                    prefixIcon: const Icon(Icons.location_on),
                    iconColor:Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
               Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Your Contact Number",
                    labelText: "Mobile Number",
                    prefixIcon: const Icon(Icons.phone),
                    iconColor:Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD500F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:  Center(
                      child: InkWell(
                        child: const Text('DONATE',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                            onTap:(){
                                showDialog(
                        context: context,
                        builder: (context) {
                          return Container(
                              child: AlertDialog(
                            title: const Text('Thanks! \n Your donation data has been saved and sent to Admin'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                          context,MaterialPageRoute(builder: (context) => const CommonUserDashboardScreen()));
                                  },
                                  child: const Text('OK')),
                            ],
                          ));
                        });
                            }
                      )
                      ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}