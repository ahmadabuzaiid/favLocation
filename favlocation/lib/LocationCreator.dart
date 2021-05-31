import 'package:flutter/material.dart';
import 'models/Location.dart';
import 'Screen.dart';

final _validatform = GlobalKey<FormState>();
String tmp_name;
String tmp_theme;
String tmp_description;
String tmp_imageUrl;
String tmp_locationUrl;

class LocationCreator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Create New Location"),
        ),
        body: LocationCreatorForm());
  }
}

class LocationCreatorForm extends StatelessWidget {
  Widget build(BuildContext context) {
    return Form(
      key: _validatform,
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the location name';
                }
                tmp_name = value;
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                hintText: 'name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the location theme';
                }
                tmp_theme = value;
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                hintText: 'theme',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the location description';
                }
                tmp_description = value;
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                hintText: 'description',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the location imageUrl';
                }
                tmp_imageUrl = value;
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                hintText: 'imageUrl',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the location locationUrl';
                }
                tmp_locationUrl = value;
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                hintText: 'locationUrl',
              ),
            ),
          ),
          Center(
            child: FloatingActionButton(
              child: Icon(Icons.check_circle),
              onPressed: () {
                if (_validatform.currentState.validate()) {
                  setList(new Location(
                      id: getList().listobj.length + 1,
                      name: tmp_name,
                      theme: tmp_theme,
                      description: tmp_description,
                      imageUrl: tmp_imageUrl,
                      locationUrl: tmp_locationUrl));
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyScreen()));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
