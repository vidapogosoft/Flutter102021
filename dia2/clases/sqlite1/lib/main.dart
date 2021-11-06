// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:sqlite1/model/client_model.dart';
import 'package:sqlite1/add_editclient.dart';
import 'package:sqlite1/db/database.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter SqFlite',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Sqlite"),
          actions: <Widget>[
            RaisedButton(
              color: Theme.of(context).primaryColor,
              onPressed: () {
                ClientDatabaseProvider.db.deleteAllClient();
                setState(() {});
              },
              child: Text('Delete All',
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                      color: Colors.white)),
            )
          ],
        ),
        body: FutureBuilder<List<Client>>(
          //we call the method, which is in the folder db file database.dart
          future: ClientDatabaseProvider.db.getAllClients(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Client>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                //Count all records
                itemCount: snapshot.data.length,
                //all the records that are in the client table are passed to an item Client item = snapshot.data [index];
                itemBuilder: (BuildContext context, int index) {
                  Client item = snapshot.data[index];
                  //delete one register for id
                  return Dismissible(
                    key: UniqueKey(),
                    background: Container(color: Colors.red),
                    onDismissed: (diretion) {
                      ClientDatabaseProvider.db.deleteClientWithId(item.id);
                    },
                    //Now we paint the list with all the records, which will have a number, name, phone
                    child: ListTile(
                      title: Text(item.name),
                      subtitle: Text(item.phone),
                      leading: CircleAvatar(child: Text(item.id.toString())),
                      //If we press one of the cards, it takes us to the page to edit, with the data onTap:
                      //This method is in the file add_editclient.dart
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AddEditClient(
                                  true,
                                  //Here is the record that we want to edit
                                  client: item,
                                )));
                      },
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddEditClient(false)));
            },
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            child: Icon(Icons.refresh),
            onPressed: () {
              //ClientDatabaseProvider.db.getAllClients();
              _CrearLista();
              setState(() {});
            },
          )
        ]));
  }

  Widget _CrearLista() {
    FutureBuilder<List<Client>>(
      //we call the method, which is in the folder db file database.dart
      future: ClientDatabaseProvider.db.getAllClients(),
      builder: (BuildContext context, AsyncSnapshot<List<Client>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            //Count all records
            itemCount: snapshot.data.length,
            //all the records that are in the client table are passed to an item Client item = snapshot.data [index];
            itemBuilder: (BuildContext context, int index) {
              Client item = snapshot.data[index];
              //delete one register for id
              return Dismissible(
                key: UniqueKey(),
                background: Container(color: Colors.red),
                onDismissed: (diretion) {
                  ClientDatabaseProvider.db.deleteClientWithId(item.id);
                },
                //Now we paint the list with all the records, which will have a number, name, phone
                child: ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.phone),
                  leading: CircleAvatar(child: Text(item.id.toString())),
                  //If we press one of the cards, it takes us to the page to edit, with the data onTap:
                  //This method is in the file add_editclient.dart
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AddEditClient(
                              true,
                              //Here is the record that we want to edit
                              client: item,
                            )));
                  },
                ),
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
