import 'package:favlocation/Screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

int tmp;

class LocationDetails extends StatelessWidget {
  LocationDetails(int id_tmp) {
    tmp = id_tmp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location Details"),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(getList().listobj.elementAt(tmp).name.toString()),
            ),
          ),
          Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
              child: Image.network(
                  getList().listobj.elementAt(tmp).imageUrl.toString()),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child:
                  Text(getList().listobj.elementAt(tmp).description.toString()),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            launch(getList().listobj.elementAt(tmp).locationUrl.toString()),
        child: Icon(Icons.map_rounded),
      ),
    );
  }
}
