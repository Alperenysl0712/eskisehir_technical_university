import 'package:eskisehir_technical_university/data/student.dart';
import 'package:eskisehir_technical_university/data/student_course_status.dart';
import 'package:eskisehir_technical_university/screens/slider_menu.dart';
import 'package:flutter/material.dart';

import '../widgets/topbar_widget.dart';
import 'obs_main_screen.dart';

class InspectionScreen extends StatefulWidget{
  Student student;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  InspectionScreen(this.student, {super.key});
  @override
  State<StatefulWidget> createState() {
    return InspectionScreenState();
  }

}

class InspectionScreenState extends State<InspectionScreen> {
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
      body: buildInspection(),
    );
  }

  buildInspection() {
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
        buildCourses()
      ],
    );
  }

  buildCourses() {
    var myCourses = StudentCourseGrades.getGrades(widget.student, 1)!;
    return Expanded(
        child: ListView.builder(
            itemCount: myCourses.length,
            itemBuilder: (BuildContext context, int index){
              return Container(
                margin: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                height: 130,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(167, 38, 49, 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.44), // Shadow color
                        offset: const Offset(2, 3), // Offset of the shadow
                        blurRadius: 13.3, // Blur radius
                        spreadRadius: 2, // Spread radius
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white, width: 3)
                ),
                child: Column(
                  children: [
                    Text("${myCourses[index].course!.code} - ${myCourses[index].course!.name}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16
                    ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Grup\n${myCourses[index].course!.group ?? '-'}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              height: 2
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text("Toplam\n${myCourses[index].inspection.total}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              height: 2
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text("Katılmadığı\n${myCourses[index].inspection.notJoin}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              height: 2
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text("Durum\n${myCourses[index].inspection.status ?? '-'}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              height: 2
                          ),
                          textAlign: TextAlign.center,
                        )

                      ],
                    ),
                  ],
                ),
              );
            }
        )
    );
  }
}