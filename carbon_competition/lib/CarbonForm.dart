import 'package:flutter/material.dart';

import 'BottomNavBar.dart';


class CarbonTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child:
          Text('Daily Carbon Tracker'),
        ),
      ),
      body: CarbonForm(),
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
  String primaryFood ='food';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'What was your protein',
            ),
            validator: (value) {
              if (value.toLowerCase() != 'Beef' || value.toLowerCase() != 'Pork' || value.toLowerCase() != 'Poultry' || value.toLowerCase() != 'Lamb') {
                return 'Enter either pork, beef, poultry, or lamb';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'What were your carbs',
            ),
            validator: (value) {
              if (value.toLowerCase() != 'grains' || value.toLowerCase() != 'vegetables' || value.toLowerCase() != 'Wheat') {
                return 'Enter either grains, vegetables, or wheat';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'What did you drink',
            ),
            validator: (value) {
              if (value.toLowerCase() != 'soda' || value.toLowerCase() != 'beer' || value.toLowerCase() != 'wine' || value.toLowerCase() != 'water' || value.toLowerCase() != 'juice' || value.toLowerCase() != 'spirits' ) {
                return 'Enter either soda, beer, wine, water, spirits, or juice';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Blah',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
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
    );
  }
}
