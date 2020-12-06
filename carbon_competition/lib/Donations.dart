import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'BottomNavBar.dart';

class Donations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donations'),
        ),
      body: Column(
          children: [
            Text('If you are feeling generous and want to reduce the impact of ' +
                'your carbon footprint please feel free to donate to any of the charities below:',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            MyStatelessWidget(),
          ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.home_work),
              title: Text('The Information Technology and Innovative Foundation'),
              subtitle: Text('A highly regarded US think tank that runs the Clean Energy Innovation program, which looks into clean energy research and development and  then advises policymakers on the best course of action.'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('DONATE'),
                  onPressed: _launchURL1,
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('MORE INFO'),
                  onPressed: _launchURL2,
                ),
                const SizedBox(width: 8),
              ],
            ),
            const ListTile(
              leading: Icon(Icons.home_work),
              title: Text('The Clean Air Task Force'),
              subtitle: Text('A US-based non-governmental organization (NGO) that has been working to reduce air pollution since its founding in 1996.'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('DONATE'),
                  onPressed: _launchURL3,
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('MORE INFO'),
                  onPressed: _launchURL4,
                ),
                const SizedBox(width: 8),
              ],
            ),
            const ListTile(
              leading: Icon(Icons.home_work),
              title: Text('Carbonfund.org'),
              subtitle: Text('An organization making it easy and affordable for any individual, business or organization to reduce & offset their climate impact and hasten the transition to a clean energy future.'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('DONATE'),
                  onPressed: _launchURL5,
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('MORE INFO'),
                  onPressed: _launchURL6,
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
_launchURL1() async {
  const url = 'https://itif.org/champion-innovation-support-itif';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
_launchURL2() async {
  const url = 'https://itif.org/about';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
_launchURL3() async {
  const url = 'https://www.catf.us/donate/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
_launchURL4() async {
  const url = 'https://www.catf.us/work/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
_launchURL5() async {
  const url = 'https://carbonfund.org/donate/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
_launchURL6() async {
  const url = 'https://carbonfund.org/about/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}