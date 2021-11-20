import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Fade in images assets';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/jar-loading.gif',
            image:
                'https://admin-sysnnova.com/supplyguayaquil/Imagenes/Logos/bgportalsafety.jpg',
          ),
        ),
      ),
    );
  }
}
