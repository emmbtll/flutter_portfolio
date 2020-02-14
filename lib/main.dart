import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ListView(children: <Widget>[
        Container(
          height: 100,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(40,0,0,0),
          child: Container(
            height: 300,
            child: FlareActor(
              "assets/animemma.flr",
              animation: 'AnimEmma',
            ),
          ),
        ),
        Center(
          child: Text(
            
            'BOTELLA Emma',
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 40
        ),
        Container(
          height: 50,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  hoverColor: Colors.grey[300],
                  onTap: () => {
                    html.window
                        .open('https://twitter.com/bennonenfait', 'tweeter')
                  },
                  child: Image.network(
                    'https://upload.wikimedia.org/wikipedia/fr/thumb/c/c8/Twitter_Bird.svg/1200px-Twitter_Bird.svg.png',
                  ),
                ),
                Container(
                  width: 20
                ),
                InkWell(
                  hoverColor: Colors.grey[300],
                  onTap: () => {
                    html.window.open(
                        'https://www.instagram.com/emmbtll/?hl=fr', 'Instagram')
                  },
                  child: Image.network(
                      'https://images.squarespace-cdn.com/content/v1/5bd637a051f4d49caf7e9449/1558650099381-IHTVQROSODHTLYFSZF04/ke17ZwdGBToddI8pDm48kHmLeEzARneXWVNN3KN0jJZ7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QHyNOqBUUEtDDsRWrJLTmLJldeUBr21n7Q6FCdEHWs2I3HlqChD0fQQoPbWVsCQeSFpPcr6kvfdcJPUiZ0oyz/vrai-logo-instagram-charte-graphique-branding.png'),
                ),
                 Container(
                  width: 20,
                ),
                InkWell(
                  hoverColor: Colors.grey[300],
                  onTap: () => {
                    html.window.open('https://github.com/emmbtll', 'Github')
                  },
                  child: Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Octicons-mark-github.svg/1200px-Octicons-mark-github.svg.png'),
                ),
              ]),
        ),
        Container(
          height: 40),
        
        Center(
          child: new InkWell(
             hoverColor: Colors.grey[300],
            onTap: () => launch(
                  'https://docs.google.com/document/d/1l4GK0EndBGLyR1Fia-t_UK-16U96LjPUFT0yRgxP-lY/edit?usp=sharing'),
            child: new Text('Rapport de stage',
              style: TextStyle(fontSize: 25, color: Colors.blue),
              ),
          ),
        ),
                Container(
                  height: 200
                )
      ]),
    ));
  }
}

_launchURL(String monsite) async {
  String url = monsite;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
