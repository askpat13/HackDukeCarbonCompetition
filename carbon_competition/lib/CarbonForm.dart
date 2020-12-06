import 'package:carbon_competition/carbon_calcs/carbonform_info_class.dart';
import 'package:carbon_competition/carbon_calcs/meal_carbon_calc.dart';
import 'package:flutter/material.dart';
import 'package:carbon_competition/user_class.dart';
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
              hintText: 'Primary food type for meal',
            ),
            validator: (value) {
              if (value == ""){
                // do nothing if nothing is entered
              }
              // If the user inputs something wrong, add error message
              else if (!foodCarbonConstants.containsKey(value.toLowerCase())) {
                return 'Enter valid food type (beef, lamb, pork, dairy, poultry, rice, wheat, vegetable, none)';
              }
              // Otherwise, add the data from the meal
              else {
                double carbonFromPrimary = calcCarbonFromPrimary(value.toLowerCase());
                User.addCarbon(carbonFromPrimary);
                User.pushToDatabase();
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Side food type for meal',
            ),
            validator: (value) {
              if (value == ""){
                // do nothing if nothing is entered
              }
              else if (!foodCarbonConstants.containsKey(value.toLowerCase())) {
                return 'Enter valid food type (beef, lamb, pork, dairy, poultry, rice, wheat, vegetable, none)';
              }
              // Otherwise, save the data to meals
              else {
                double carbonFromSide = calcCarbonFromSide(value.toLowerCase());
                User.addCarbon(carbonFromSide);
                User.pushToDatabase();
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'What did you drink?',
            ),
            validator: (value) {
              if (value == ""){
                // do nothing if nothing is entered
              }
              else if (!drinkCarbonConstants.containsKey(value.toLowerCase())) {
                return 'Enter either soda, beer, wine, bottled water, spirit, or juice';
              }
              else {
                double carbonFromDrink = calcCarbonFromDrink(value.toLowerCase());
                User.addCarbon(carbonFromDrink);
                User.pushToDatabase();
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
