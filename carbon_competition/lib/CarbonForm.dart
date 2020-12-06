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
              hintText: 'Primary food type for MEAL 1',
            ),
            validator: (value) {
              if (!foodCarbonConstants.containsKey(value.toLowerCase())) {
                return 'Enter valid food type (beef, lamb, pork, dairy, poultry, rice, wheat, vegetable, none)';
              }
              // Otherwise, save the data to meals
              else {
                double carbonFromPrimary = calcCarbonFromPrimary(value);
                User.addCarbon(carbonFromPrimary);
                User.pushToDatabase();
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Side food type for MEAL 1',
            ),
            validator: (value) {
              if (!foodCarbonConstants.containsKey(value.toLowerCase())) {
                return 'Enter valid food type (beef, lamb, pork, dairy, poultry, rice, wheat, vegetable, none)';
              }
              // Otherwise, save the data to meals
              else {
                double carbonFromSide = calcCarbonFromSide(value);
                User.addCarbon(carbonFromSide);
                User.pushToDatabase();
              }
              return null;
            },
          ),
          // TextFormField(
          //   decoration: const InputDecoration(
          //     hintText: 'What did you drink for MEAL 1',
          //   ),
          //   validator: (value) {
          //     if (value.toLowerCase() != 'soda' || value.toLowerCase() != 'beer' || value.toLowerCase() != 'wine' || value.toLowerCase() != 'water' || value.toLowerCase() != 'juice' || value.toLowerCase() != 'spirits' ) {
          //       return 'Enter either soda, beer, wine, water, spirits, or juice';
          //     }
          //     return null;
          //   },
          // ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Primary food type for MEAL 2',
            ),
            validator: (value) {
              if (!foodCarbonConstants.containsKey(value.toLowerCase())) {
                return 'Enter valid food type (beef, lamb, pork, dairy, poultry, rice, wheat, vegetable, none)';
              }
              // Otherwise, save the data to meals
              else {
                double carbonFromPrimary = calcCarbonFromPrimary(value);
                User.addCarbon(carbonFromPrimary);
                User.pushToDatabase();
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Side food type for MEAL 2',
            ),
            validator: (value) {
              if (!foodCarbonConstants.containsKey(value.toLowerCase())) {
                return 'Enter valid food type (beef, lamb, pork, dairy, poultry, rice, wheat, vegetable, none)';
              }
              // Otherwise, save the data to meals
              else {
                double carbonFromSide = calcCarbonFromSide(value);
                User.addCarbon(carbonFromSide);
                User.pushToDatabase();
              }
              return null;
            },
          ),
          // TextFormField(
          //   decoration: const InputDecoration(
          //     hintText: 'What did you drink for MEAL 2',
          //   ),
          //   validator: (value) {
          //     if (value.toLowerCase() != 'soda' || value.toLowerCase() != 'beer' || value.toLowerCase() != 'wine' || value.toLowerCase() != 'water' || value.toLowerCase() != 'juice' || value.toLowerCase() != 'spirits' ) {
          //       return 'Enter either soda, beer, wine, water, spirits, or juice';
          //     }
          //     return null;
          //   },
          // ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Primary food type for MEAL 3',
            ),
            validator: (value) {
              if (!foodCarbonConstants.containsKey(value.toLowerCase())) {
                return 'Enter valid food type (beef, lamb, pork, dairy, poultry, rice, wheat, vegetable, none)';
              }
              // Otherwise, save the data to meals
              else {
                double carbonFromPrimary = calcCarbonFromPrimary(value);
                User.addCarbon(carbonFromPrimary);
                User.pushToDatabase();
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Side food type for MEAL 3',
            ),
            validator: (value) {
              if (!foodCarbonConstants.containsKey(value.toLowerCase())) {
                return 'Enter valid food type (beef, lamb, pork, dairy, poultry, rice, wheat, vegetable, none)';
              }
              // Otherwise, save the data to meals
              else {
                double carbonFromSide = calcCarbonFromSide(value);
                User.addCarbon(carbonFromSide);
                User.pushToDatabase();
              }
              return null;
            },
          ),
          // TextFormField(
          //   decoration: const InputDecoration(
          //     hintText: 'What did you drink for MEAL 3',
          //   ),
          //   validator: (value) {
          //     if (value.toLowerCase() != 'soda' || value.toLowerCase() != 'beer' || value.toLowerCase() != 'wine' || value.toLowerCase() != 'water' || value.toLowerCase() != 'juice' || value.toLowerCase() != 'spirits' ) {
          //       return 'Enter either soda, beer, wine, water, spirits, or juice';
          //     }
          //     return null;
          //   },
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  print("HI");
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
