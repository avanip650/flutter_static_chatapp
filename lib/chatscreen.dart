import 'package:flutter/material.dart';
import 'package:flutter_chatapp/chatMessage.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final TextEditingController _textEditingController = new TextEditingController();
  final List<ChatMessage> _message = <ChatMessage>[];
  bool _validate = true;

  void _handleSubmitted(String text){
    _textEditingController.clear();
    ChatMessage message = new ChatMessage(text: text,);
    setState(() {
      _message.insert(0, message);
    });
  }

  Widget _textcomposerWidget(){
    return IconTheme(
      data: IconThemeData(
        color: Colors.black
      ),
      child: new Container(
        padding: const EdgeInsets.only(left: 10.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: new TextField(
                decoration: new InputDecoration.collapsed(
                hintText: 'Send a Message',hintStyle: TextStyle(color: Colors.white),
              ),
                controller: _textEditingController,
                onSubmitted: _handleSubmitted,
                style: new TextStyle(color: Colors.white),
              ),
            ),
            Container(
              child: new IconButton(
                  icon: Icon(Icons.send,color: Colors.white,),
                  onPressed: () {
                    setState(() {
                      _textEditingController.text.isEmpty ? _validate = false : _validate = true;
                    });

                    if(_validate){
                      _handleSubmitted(_textEditingController.text);
                    }
                  }

              ),

            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('images/image.jpg'),
            fit: BoxFit.fill)
      ),
      child: Column(
        children: <Widget>[
          Flexible(
              child: ListView.builder(
                padding: const EdgeInsets.all(1.0),
                itemBuilder: (_,int index) => _message[index],
                reverse: true,
                itemCount: _message.length,
              )
          ),
//        Divider(
//          height: 0.2,
//        ),
          Container(
            margin: EdgeInsets.only(bottom: 5.0,left: 5.0,right: 5.0),
            decoration: BoxDecoration(
                color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(20.0))
            ),
            child: _textcomposerWidget(),
          )
        ],
      ),
    );
  }
}
