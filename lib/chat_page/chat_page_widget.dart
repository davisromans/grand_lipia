import 'package:flutter/cupertino.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'chatMessageModel.dart';


class ChatPageWidget extends StatefulWidget {
  const ChatPageWidget({Key? key}) : super(key: key);

  @override
  _ChatPageWidgetState createState() => _ChatPageWidgetState();
}

class _ChatPageWidgetState extends State<ChatPageWidget>
    with TickerProviderStateMixin {

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFF272727),
          toolbarHeight: 70,
          flexibleSpace: SafeArea(
            child: Container(
              decoration: BoxDecoration(
              color: Color(0xFF272727),),
              padding: EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      Text(
                      'Customer care service',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context)
                          .title1
                          .override(
                        fontFamily: 'Outfit',
                        color: FlutterFlowTheme.of(
                            context)
                            .primaryText,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                        SizedBox(height: 1,),
                        Text(
                          'Online',
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .title1
                              .override(
                            fontFamily: 'Outfit',
                            color: FlutterFlowTheme.of(
                                context)
                                .primaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.more_vert_rounded,color: Colors.white,),
                ],
              ),
            ),
          ),
        ),
      body: Stack(
        children: <Widget>[


            ListView.builder(
              itemCount: messages.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10,bottom: 10),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return Container(
                  padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                  child: Align(
                    alignment: (messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: (messages[index].messageType  == "receiver"?Color(0xFF272727):Color(0xFFFF5E01)),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Text(messages[index].messageContent, style: TextStyle(fontSize: 15),),
                    ),
                  ),
                );
              },
            ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.only(left: 20,bottom: 10,top: 10),
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xFF272727),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Write message...",
                            hintStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                      },
                        child: Icon(Icons.attach_file, color: Colors.white, size: 30, ),
                    ),
                    SizedBox(width: 5),
                    FloatingActionButton(
                      onPressed: (){},
                      child: Icon(Icons.send,color: Colors.white,size: 18,),
                      backgroundColor: Color(0xFFFF5E01),
                      elevation: 0,
                    ),
                  ],

                ),
              ),
            ),
          ),
        ],
      ),
    );

  }
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How can i help you?", messageType: "receiver"),
    ChatMessage(messageContent: "Hello, I accidentally closed a contract, can you return it?", messageType: "sender"),
    ChatMessage(messageContent: "Okay, let me check the recent closed contract.", messageType: "receiver"),
    ChatMessage(messageContent: "Okay thank you", messageType: "sender"),
  ];
  }



