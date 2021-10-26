import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      // ignore: prefer_const_constructors
      appBar: AppBar(title: Text('Titulo de la APP'), centerTitle: true),
      body: Center(child: Text('Curso de flutter = Mi primer widget')));
}
