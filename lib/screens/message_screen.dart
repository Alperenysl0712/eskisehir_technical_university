import 'package:eskisehir_technical_university/data/message_sample.dart';
import 'package:eskisehir_technical_university/screens/message_detail_screen.dart';
import 'package:eskisehir_technical_university/screens/message_new_screen.dart';
import 'package:eskisehir_technical_university/screens/slider_menu.dart';
import 'package:eskisehir_technical_university/widgets/back_button_widget.dart';
import 'package:flutter/material.dart';

import '../data/student.dart';
import '../widgets/topbar_widget.dart';

class MessageScreen extends StatefulWidget{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Student student;
  MessageScreen(this.student, {super.key});

  @override
  State<StatefulWidget> createState() {
    return MessageScreenState();
  }

}

class MessageScreenState extends State<MessageScreen> {
  late double screenH;
  late double screenW;
  @override
  Widget build(BuildContext context) {
    screenH = MediaQuery.of(context).size.height;
    screenW = MediaQuery.of(context).size.width;
    return Scaffold(
      key: widget._scaffoldKey,
      drawer: SliderMenu(widget.student, widget._scaffoldKey),
      appBar: TopBarWidget(barType: 3, scaffoldKey: widget._scaffoldKey).topBar(3, context),
      body: buildMessageBody(),
    );
  }

  buildMessageBody() {
    return Column(
      children: [
        BackButtonWidget(widget.student),
        buildNewMessageButton(),
        buildMessages()
      ],
    );
  }

  buildNewMessageButton() {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 30),
      width: screenW * 0.7,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.49),
            blurRadius: 13.3,
            spreadRadius: 2,
            offset: const Offset(2, 3)
          )
        ]
      ),
      child: ElevatedButton(
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) => NewMessageScreen(widget.student))).then((value) {
                if(value){
                  setState(() {

                  });
                }
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          elevation: 0
        ),
        child: const Text("Yeni Message", style: TextStyle(color: Colors.white, fontSize: 17),),
      ),
    );
  }

  buildMessages() {
    var myMessages = MessageSample.getMessage(widget.student);
    return Expanded(
        child: ListView.builder(
            itemCount: myMessages.length,
            itemBuilder: (BuildContext context, int index){
           return ListTile(
                title: Container(
                  alignment: Alignment.center,
                  width: screenW * 0.9,
                  height: 120,
                  decoration: BoxDecoration(
                    color: index % 2 == 0 ? const Color.fromRGBO(224, 224, 224, 1) : Colors.white,
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(myMessages[index].receiver),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(myMessages[index].subject),
                          Text(myMessages[index].messageDate),
                        ],
                      )
                    ],
                  ),
                ),
                onTap: (){
                  Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (BuildContext context) => MessageDetailScreen(myMessages[index])));
                },
              );
            }
        )
    );
  }
}