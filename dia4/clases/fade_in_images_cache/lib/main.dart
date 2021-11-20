import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Imágenes en caché';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Stack(
          children: <Widget>[
            Center(child: CircularProgressIndicator()),
            Center(
              child: CachedNetworkImage(
                imageUrl:
                    'https://admin-sysnnova.com/supplyguayaquil/Imagenes/Logos/bgportalsafety.jpg',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
