
import 'package:eskisehir_technical_university/data/student.dart';
import 'package:eskisehir_technical_university/data/student_options.dart';
import 'package:eskisehir_technical_university/screens/slider_menu.dart';
import 'package:flutter/material.dart';

import '../widgets/topbar_widget.dart';

class ObsMainScreen extends StatefulWidget {
  Student student;
  ObsMainScreen(this.student, {super.key});

  @override
  State<StatefulWidget> createState() {
    return ObsMainScreenState();
  }
}

class ObsMainScreenState extends State<ObsMainScreen> {
  var screenH = 0.0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    screenH = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      appBar: TopBarWidget(barType: 3, scaffoldKey: _scaffoldKey).topBar(3, context),
      body: studentOptions(),
      drawer: SliderMenu(widget.student, _scaffoldKey),
    );
  }

  studentOptions() {
    return ListView.builder(
      itemCount: StudentOptions.options.length,
      itemBuilder: (BuildContext context, int index) {
        var option = StudentOptions.options[index];
        return Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.95, // Set the width as per your requirement
            margin: const EdgeInsets.only(bottom: 5, top: 15),
            decoration: BoxDecoration(
              color: (index % 2 == 0) ? const Color.fromRGBO(167, 38, 49, 1) : const Color.fromRGBO(255, 255, 255, 1),
              border: (index % 2 == 0) ?  Border.all(color: Colors.white, width: 5) : Border.all(color: const Color.fromRGBO(167, 38, 49, 1), width: 5),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.44), // Shadow color
                  offset: const Offset(2, 3), // Offset of the shadow
                  blurRadius: 13.3, // Blur radius
                  spreadRadius: 2, // Spread radius
                ),
              ],
            ),
            child: ListTile(
              title: Text(StudentOptions.options[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: (index % 2 == 0) ? Colors.white : const Color.fromRGBO(167, 38, 49, 1),
                      fontSize: 19,
                      fontWeight: FontWeight.w500)),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) =>
                      StudentOptions.goToPage(widget.student, StudentOptions.options[index])!
                    )
                );
              },
            ),
          ),
        );
      },
    );
  }
}
