import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// MyApp es un StatefulWidget. Nos permite actualizar el estado del Widget
// cada vez que se elimine un elemento.
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final items = List<String>.generate(5, (i) => "Item ${i + 1}");

  @override
  Widget build(BuildContext context) {
    final title = 'Dismissing Items';

    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return Dismissible(
              // Cada Dismissible debe contener una llave. Las llaves permiten a Flutter
              // identificar de manera única los Widgets.
              key: Key(item),
              // También debemos proporcionar una función que diga a nuestra aplicación
              // qué hacer después de que un elemento ha sido eliminado.
              onDismissed: (direction) {
                // Remueve el elemento de nuestro data source.
                setState(() {
                  items.removeAt(index);
                });

                // Luego muestra un snackbar!
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text("$item dismissed")));
              },
              // Muestra un background rojo a medida que el elemento se elimina
              background: Container(color: Colors.red),
              child: ListTile(title: Text('$item')),
            );
          },
        ),
      ),
    );
  }
}
