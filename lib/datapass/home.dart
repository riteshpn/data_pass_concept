import 'package:data_pass_concept/datapass/scree2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home1 extends StatefulWidget {
  const  Home1({super.key});

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
   var value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: Text('Screen1'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: TextField(
              autofocus: false,
              keyboardType: TextInputType.emailAddress,
              onChanged: (text){
                value = text;
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Screen2(value:value))); 
            },
            child: Text('Search'),
          )
        ],
      ),
    );
  }
}
