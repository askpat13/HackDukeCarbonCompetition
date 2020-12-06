import 'package:carbon_competition/user_class.dart';
import 'package:flutter/material.dart';
import 'BottomNavBar.dart';
import 'package:carbon_competition/main.dart';
import 'package:carbon_competition/carbon_calcs/house_carbon_calc.dart';

class Settings extends StatelessWidget {
  var name = '[BLANK]';
  var mpg = '[BLANK]';
  var zip = '[BLANK]';
  @override
  Widget build(BuildContext context) {
    if (User.name != '') {
      name = User.name;
    }
    if (User.userMpg.toString() != '') {
      mpg = User.userMpg.toString();
    }
    if (User.zip != '') {
      zip = User.zip;
    }
    return Scaffold(
      appBar: AppBar(
          title: Text('Settings'),
        ),
      body: Column(
        children: [
          Text('Currently your name is ' + name + ', your car Mpg is ' + mpg +
              ', and your Zip code is ' + zip + '.   If you need to change any of this information, simply fill out the form below.',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          CarbonForm()
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class CarbonForm extends StatefulWidget {
CarbonForm({Key key}) : super(key: key);

@override
_CarbonForm createState() => _CarbonForm();
}

/// This is the private State class that goes with MyStatefulWidget.
class _CarbonForm extends State<CarbonForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'What do people call you?',
                labelText: 'Name',
              ),
              onSaved: (String value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              validator: (String value) {
                if (value != "") {
                  User.name = value;
                  User.pushToDatabase();
                }
                return value.contains('@') ? 'Do not use the @ char.' : null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.directions_car),
                hintText: 'What is the mileage per gallon of your car?',
                labelText: 'Car MPG',
              ),
              onSaved: (String value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              validator: (String value) {
                if (value != "") {
                  User.userMpg = int.parse(value);
                  User.pushToDatabase();
                }
                return value.contains('@') ? 'Do not use the @ char.' : null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.house_siding),
                hintText: 'Where is your location?',
                labelText: 'ZIP CODE',
              ),
              onSaved: (String value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              validator: (String value) {
                if (value != "") {
                  User.zip = value;
                  User.userAvgDailyHousingCarbon = calcAvgHousingCarbon(value);
                  User.pushToDatabase();
                }
                return value.contains('@') ? 'Do not use the @ char.' : null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
              onPressed: () {
              // Validate will return true if the form is valid, or false if
              // the form is invalid.
              if (_formKey.currentState.validate()) {
              // Process data.
              }
              },
                child: Text('Submit'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}