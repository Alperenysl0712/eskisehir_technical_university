import 'package:eskisehir_technical_university/data/message.dart';
import 'package:eskisehir_technical_university/data/student.dart';
import 'package:eskisehir_technical_university/screens/slider_menu.dart';
import 'package:eskisehir_technical_university/validation/message_validation.dart';
import 'package:flutter/material.dart';

import '../data/message_sample.dart';
import '../widgets/topbar_widget.dart';
import 'message_screen.dart';

class NewMessageScreen extends StatefulWidget{
  Student student;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  NewMessageScreen(this.student, {super.key});

  @override
  State<StatefulWidget> createState() {
    return NewMessageScreenState();
  }

}

class NewMessageScreenState extends State<NewMessageScreen> with MessageValidation{
  late double screenH;
  late double screenW;
  final formKey = GlobalKey<FormState>();
  String? selectedPerson = "Advisor 1";
  TextEditingController txtDetail = TextEditingController();
  TextEditingController txtSubject = TextEditingController();
  @override
  Widget build(BuildContext context) {
    screenH = MediaQuery.of(context).size.height;
    screenW = MediaQuery.of(context).size.width;

    return Scaffold(
      key: widget._scaffoldKey,
      drawer: SliderMenu(widget.student, widget._scaffoldKey),
      appBar: TopBarWidget(barType: 3, scaffoldKey: widget._scaffoldKey).topBar(3, context),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: buildNewMessageBody(),
        ),
      ),
    );
  }

  buildNewMessageBody() {
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
                            MessageScreen(widget.student)));
              },
            ),
          ),
        ),
        buildReceiver(),
        buildSubject(),
        buildDetail(),
        Container(
          margin: const EdgeInsets.fromLTRB(5, 10, 5, 10),
          height: 2,
          color: Colors.black,
        ),
        buildSendMessage()
      ],
    );
  }

  Widget buildReceiver() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: DropdownButton<String>(
          value: selectedPerson,
          isExpanded: true,
            underline: Container(
              height: 0,
            ),
          items: ["Advisor 1", "Advisor 2", "Advisor 3", "Advisor 4", "Advisor 5"].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedPerson = newValue;
            });
          },
        ),
      ),
    );
  }

  buildSubject() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.only(left: 10),
      width: screenW * 0.95,
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(10)
      ),
      child: TextFormField(
        controller: txtSubject,
        decoration: const InputDecoration(
          labelText: "Konu",
          border: InputBorder.none
        ),
        validator: messageSubjectValidate,
        maxLines: null,
        onChanged: (value) {
          if (formKey.currentState != null) {
            formKey.currentState!.validate();
          }
        },
      ),
    );
  }
  buildDetail() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.only(left: 10),
      width: screenW * 0.95,
      height: screenH * 0.45,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(10)
      ),
      child: TextFormField(
        controller: txtDetail,
        decoration: const InputDecoration(
          labelText: "Mesaj İçeriği",
          border: InputBorder.none
        ),
        validator: messageValidate,
        maxLines: null,
        onChanged: (value) {
          if (formKey.currentState != null) {
            formKey.currentState!.validate();
          }
        },
      ),
    );
  }

  buildSendMessage() {
    return GestureDetector(
      onTap: () {
        sendMessage();
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 5, 10),
        height: 100,
        width: screenW * 0.45,
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
    );
  }

  void sendMessage() {
    var messageD = txtDetail.text;
    var messageSubject = txtSubject.text;

    if(formKey.currentState!.validate()){
      setState(() {
        Message message = Message(widget.student, selectedPerson.toString(), messageSubject, [Content(widget.student, messageD)]);
        MessageSample.addMessage(message);
        txtDetail.clear();
        FocusScope.of(context).unfocus();
        Navigator.pop(context, true);
      });
    }


  }
}