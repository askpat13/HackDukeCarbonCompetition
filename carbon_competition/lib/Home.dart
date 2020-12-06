import 'package:flutter/material.dart';
import 'BottomNavBar.dart';

class CarbonHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Home Page'),
          actions: <Widget> [
            IconButton(
              icon: Icon(Icons.settings),
              tooltip: 'Settings',
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
            )
          ]
      ),
      body:
      Column(
      children: [
        UserCard(),
        CarbonForm(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class UserCard extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
  return new Container(
      margin: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 24.0,
      ),
    child: new Column(
      children: <Widget>[
        avatarThumbnail,
        avatarCard,
      ],
    ),
    );
  }

 final avatarThumbnail = new Container(
   alignment: Alignment.topCenter,
     child: new Image(
       image: new AssetImage("assets/images/pixeldude.png"),
       height: 100,
       width: 100,
     ),
 );

 final avatarCard = new Container(
         height: 100.0,
         width: double.infinity,
         margin: new EdgeInsets.only(left: 20, right: 20),
         child: Column(
           children: <Widget> [
             Text('Username'),
             Text('lvl 1')
           ],
         ),
     decoration: new BoxDecoration(
       color: new Color(0xFFE8F5E9),
       shape: BoxShape.rectangle,
       borderRadius: new BorderRadius.circular(8.0),
       boxShadow: <BoxShadow>[
         new BoxShadow(
           color: Colors.black12,
           blurRadius: 10.0,
           offset: new Offset(0.0, 10.0),
         ),
       ],
     ),
   );

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'What did you eat?',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'How much did you drive',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'blah blah',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
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
