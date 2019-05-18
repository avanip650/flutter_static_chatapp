import 'package:flutter/material.dart';
import 'package:flutter_chatapp/chatscreen.dart';

void main()=> runApp(MaterialApp(
  home: HomePage(),
  debugShowCheckedModeBanner: false,
));

class Constants{
  static const String View_contact = "View contact";
  static const String Media = "Media";
  static const String Search = "Search";
  static const String Wallpaper = "Wallpaper";

  static const List<String> choice = <String>[
    View_contact, Media, Search, Wallpaper
  ];
}


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Icon(Icons.arrow_back),
            Container(
              margin: EdgeInsets.only(right: 10.0),
            ),
            CircleAvatar(
              child: CircleAvatar(
                backgroundImage: AssetImage('images/image1.png'),
//                NetworkImage('https://quotationwalls.com/img/motivational/be-positive-whatsapp.jpg'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 5.0),
            ),
            Text('Chat Screen')
          ],
        ),
        backgroundColor: Colors.black,
        actions: <Widget>[
          Icon(Icons.videocam),
          Container(
            margin: EdgeInsets.all(10),
          ),
          Icon(Icons.call),
          PopupMenuButton(
              itemBuilder: (BuildContext contex){
                return Constants.choice.map((String choice){
                  return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice)
                  );
                }).toList();
              }
          ),
        ],
      ),
      body: ChatScreen(),
    );
  }
}
