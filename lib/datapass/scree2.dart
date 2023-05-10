import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  var value;
  Screen2({required this.value});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('screen 2 data'),
      ),
      body: Center(child: Text(value)),
    );
  }
}
