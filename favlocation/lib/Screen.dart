import 'package:favlocation/LocationDetails.dart';
import 'package:favlocation/PrevCreate.dart';
import 'package:favlocation/data/Locations.dart';
import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();
LocationsAll _list = new LocationsAll();
var _user;

LocationsAll getList() {
  return _list;
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  get child => null;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Your Username';
                }
                _user = value;
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                hintText: 'Username',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Your Password';
                }
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                hintText: 'Password',
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
              child: Icon(Icons.login_rounded),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Screen()));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_user),
      ),
      body: ListView.builder(
        itemCount: _list.listobj.length,
        itemBuilder: (BuildContext context, int i) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 3.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(184, 212, 225, 1.0),
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6.0, horizontal: 6.0),
                      child: Image.network(
                          _list.listobj.elementAt(i).imageUrl.toString()),
                    ),
                    Center(
                        child:
                            Text(_list.listobj.elementAt(i).name.toString())),
                    Center(
                        child:
                            Text(_list.listobj.elementAt(i).theme.toString())),
                  ],
                ),
                onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  LocationDetials(_list.listobj.elementAt(i))))
                    }),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_circle),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => PrevCreate()))),
    );
  }
}
