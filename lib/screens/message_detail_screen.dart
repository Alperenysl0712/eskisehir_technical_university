import 'package:eskisehir_technical_university/data/message.dart';
import 'package:eskisehir_technical_university/data/message_sample.dart';
import 'package:eskisehir_technical_university/data/student.dart';
import 'package:eskisehir_technical_university/screens/message_screen.dart';
import 'package:eskisehir_technical_university/screens/slider_menu.dart';
import 'package:eskisehir_technical_university/validation/message_validation.dart';
import 'package:flutter/material.dart';

import '../widgets/topbar_widget.dart';

class MessageDetailScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Message message;
  MessageDetailScreen(this.message, {super.key});

  @override
  State<StatefulWidget> createState() {
    return MessageDetailScreenState();
  }
}

class MessageDetailScreenState extends State<MessageDetailScreen> with MessageValidation{
  TextEditingController txtDetail = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late double screenH;
  late double screenW;
  @override
  Widget build(BuildContext context) {
    screenH = MediaQuery.of(context).size.height;
    screenW = MediaQuery.of(context).size.width;
    return Scaffold(
      key: widget._scaffoldKey,
      drawer: SliderMenu(widget.message.student, widget._scaffoldKey),
      appBar: TopBarWidget(barType: 3, scaffoldKey: widget._scaffoldKey).topBar(3, context),
      body: Form(
        key: formKey,
        child: buildMessageDetailBody(),
      ),
    );
  }

  buildMessageDetailBody() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 5),
          alignment: Alignment.centerLeft,
          child: Ink.image(
            image: const AssetImage("lib/images/back_button.png"),
            height: 70,
            width: 70,
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            MessageScreen(widget.message.student)));
              },
            ),
          ),
        ),
        Text(
          widget.message.subject,
          style: const TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.w500),
        ),
        Container(
          margin: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
          height: 1,
          color: Colors.black,
        ),
        buildMessageContents(),
        Container(
          margin: const EdgeInsets.fromLTRB(5, 10, 5, 10),
          height: 2,
          color: Colors.black,
        ),
        buildSendMessage()
      ],
    );
  }

  buildMessageContents() {
    var message = widget.message;
    return Expanded(
        child: ListView.builder(
            itemCount: message.content.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                decoration: BoxDecoration(
                  color: message.content[index].sender is Student ? const Color.fromRGBO(186, 255, 161, 1) : const Color.fromRGBO(217, 217, 217, 1),
                  borderRadius: BorderRadius.circular(15)
                ),
                width: screenW * 0.9,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(message.content[index].sender is Student
                            ? "${message.content[index].sender.name} ${message.content[index].sender.surname}"
                            : message.content[index].sender.toString()),

                        Text(message.content[index].sendingDate)
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Text(
                      message.content[index].content,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.justify,
                    )
                  ],
                ),
              );
            }));
  }

  buildSendMessage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(5, 0, 0, 10),
          padding: const EdgeInsets.only(left: 5),
          height: 150,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(217, 217, 217, 1),
            borderRadius: BorderRadius.circular(10)
          ),
          width: screenW * 0.7,
          child: TextFormField(
            decoration: const InputDecoration(
                labelText: "Mesaj İçeriği",
                border: InputBorder.none,
            ),
            controller: txtDetail,
            validator: messageValidate,
            maxLines: null,
          ),
        ),
        GestureDetector(
          onTap: () {
            sendMessage();
          },
          child: Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 5, 10),
            height: 150,
            width: screenW * 0.25,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(167, 38, 49, 1),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "lib/images/send.png",
                  width: 50,
                  height: 50,
                ),
                const SizedBox(height: 5,),
                const Text("Gönder", style: TextStyle(color: Colors.white, fontSize: 16),)
              ],
            ),
          ),
        )
      ],
    );
  }

  void sendMessage() {
    var message = txtDetail.text;

    if(formKey.currentState!.validate()){
      setState(() {
        MessageSample.addMessageContent(widget.message, message);
        txtDetail.clear();
        FocusScope.of(context).unfocus();
      });
    }


  }


}
