import 'package:eskisehir_technical_university/data/student.dart';
import 'package:eskisehir_technical_university/screens/slider_menu.dart';
import 'package:eskisehir_technical_university/widgets/topbar_widget.dart';
import 'package:flutter/material.dart';

import 'obs_main_screen.dart';

class AdvisorScreen extends StatefulWidget{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Student student;
  AdvisorScreen(this.student, {super.key});

  @override
  State<StatefulWidget> createState() {
    return AdvisorScreenState();
  }

}

class AdvisorScreenState extends State<AdvisorScreen> {
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
      body: buildAdvisor(),
    );
  }

  buildAdvisor() {
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
                            ObsMainScreen(widget.student)));
              },
            ),
          ),
        ),
        buildAdvisorPicture(),
        buildAdvisorInfo()
      ],
    );
  }

  buildAdvisorPicture() {
    return Container(
      alignment: Alignment.center,
      width: screenW * 0.6,
      height: screenH * 0.35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color:  Colors.black, width: 1)
      ),
      child: Image.asset(
        "lib/images/advisor.png",
      ),
    );
  }

  buildAdvisorInfo() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 50, 20, 0),
      alignment: Alignment.center,
      child: Column(
        children: [
          Text("${widget.student.advisor.name} - ${widget.student.advisor.surname}",
              style: const TextStyle(
                  color: Color.fromRGBO(167, 38, 49, 1), fontSize: 22)),
          Container(
            margin: const EdgeInsets.only(top: 3),
            height: 1,
            color: Colors.black,
          ),
          const SizedBox(height: 20),
          Text(widget.student.advisor.department,
              style: const TextStyle(
                  color: Color.fromRGBO(167, 38, 49, 1), fontSize: 22)),
          Container(
            margin: const EdgeInsets.only(top: 3),
            height: 1,
            color: Colors.black,
          ),
          const SizedBox(height: 20),
          Text(widget.student.advisor.email,
              style: const TextStyle(
                  color: Color.fromRGBO(167, 38, 49, 1), fontSize: 22)),
          Container(
            margin: const EdgeInsets.only(top: 3),
            height: 1,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}