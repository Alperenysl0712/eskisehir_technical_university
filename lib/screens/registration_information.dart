
import 'package:eskisehir_technical_university/screens/slider_menu.dart';
import 'package:eskisehir_technical_university/widgets/back_button_widget.dart';
import 'package:eskisehir_technical_university/widgets/yoksis_infos_widget.dart';
import 'package:flutter/material.dart';

import '../data/student.dart';
import '../widgets/topbar_widget.dart';

class RegistrationInformation extends StatefulWidget{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Student student;


  RegistrationInformation(this.student, {super.key});

  @override
  State<StatefulWidget> createState() {
    return RegistrationInformationState();
  }

}

class RegistrationInformationState extends State<RegistrationInformation> {
  late double screenH;
  late double screenW;

  bool yokSisInfosVisible = false;
  bool showYoksisButton = true;

  void toggleYokSisInfosVisibility() {
    setState(() {
      yokSisInfosVisible = !yokSisInfosVisible;
      showYoksisButton = !showYoksisButton;
    });
  }

  @override
  Widget build(BuildContext context) {
    screenH = MediaQuery.of(context).size.height;
    screenW = MediaQuery.of(context).size.width;
    return Scaffold(
      key: widget._scaffoldKey,
      drawer: SliderMenu(widget.student, widget._scaffoldKey),
      appBar: TopBarWidget(barType: 3, scaffoldKey: widget._scaffoldKey).topBar(3, context),
      body: buildRegistration(),
    );
  }

  buildRegistration() {
    return Column(
      children: [
        BackButtonWidget(widget.student),
        buildEstuInfos(),
        yokSisInfosVisible ? YoksisInfosWidget(widget.student) : const SizedBox(), // Conditionally show/hide widget
        showYoksisButton ? buildShowYoksis() : const SizedBox()
      ],
    );
  }

  buildShowYoksis(){
    return ElevatedButton(
      onPressed: () {
        toggleYokSisInfosVisibility(); // Toggle visibility when button is pressed
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green
      ),
      child: const Text('Yöksis Bilgilerini Getir', style: TextStyle(color: Colors.white),),
    );
  }

  buildEstuInfos() {
    return Column(
      children: [
        const Text(
          "Eskişehir Teknik Üniversitesi Kayıt Bilgileri",
          style: TextStyle(
            color: Colors.black,
            fontSize: 19,
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.only(top: 20, bottom: 20),
          alignment: Alignment.center,
          width: screenW * 0.9,
          height: 150,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(167, 38, 49, 1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white, width: 3),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.44),
                    offset: const Offset(2, 3),
                    blurRadius: 13.3,
                    spreadRadius: 2
                )
              ]
          ),
          child:
          Column(
            children: [
              Text(
                widget.student.studentInfos.Department!,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Hazırlık Durumu\n${widget.student.studentInfos.prepStatus ?? '-'}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      height: 2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Onay Durumu\n${widget.student.studentInfos.approveStaus ?? '-'}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        height: 2
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
  
}