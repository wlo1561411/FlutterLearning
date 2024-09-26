import 'package:flutter/material.dart';
import 'package:coffee/styled_body_text.dart';

import 'h_row.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'coffee',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.brown[700],
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.brown[100],
            padding: const EdgeInsets.all(20),
            child: const StyledBodyText('one...'),
          ),
          Container(
            color: Colors.brown[200],
            padding: const EdgeInsets.all(20),
            child: const HRow(),
          ),
          Expanded(
              child: Image.asset(
            'assets/img/coffee_bg.jpg',
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
          ))
        ],
      ),
    );
  }
}
