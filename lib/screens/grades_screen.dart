import 'package:eskisehir_technical_university/data/student.dart';
import 'package:eskisehir_technical_university/data/student_course_status.dart';
import 'package:eskisehir_technical_university/screens/grade_detail_screen.dart';
import 'package:eskisehir_technical_university/screens/obs_main_screen.dart';
import 'package:eskisehir_technical_university/screens/slider_menu.dart';
import 'package:flutter/material.dart';

import '../widgets/topbar_widget.dart';

class GradesScreen extends StatefulWidget {
  Student student;
  GradesScreen(this.student, {super.key});

  @override
  State<GradesScreen> createState() => _GradesScreenState();
}

class _GradesScreenState extends State<GradesScreen> {
  String? selectedValue = "2023-2024 Spring Term";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: TopBarWidget(barType: 3, scaffoldKey: _scaffoldKey).topBar(3, context),
      body: buildGradeBody(),
      drawer: SliderMenu(widget.student, _scaffoldKey),
    );
  }

  buildGradeBody() {
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
        buildSelectionYear(),
        buildCourses()
      ],
    );
  }

  buildSelectionYear() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: DropdownButton<String>(
          value: selectedValue,
          isExpanded: true,
          underline: Container(
              height: 0,
            ),
          items: ["2023-2024 Spring Term", "2023-2024 Fall Term"]
              .map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue;
            });
          },
        ),
      ),
    );
  }

  buildCourses() {

    var myCourses = StudentCourseGrades.getGrades(widget.student, 1)!;
    return Expanded(
        child: ListView.builder(
      itemCount: myCourses.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 5),
            alignment: Alignment.center,
            height: 150,
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
              border: Border.all(color: Colors.white, width: 5),
              borderRadius: BorderRadius.circular(10)
            ),
            child: ListTile(
              title: Column(
                children: [
                  Text(myCourses[index].course!.code, style: const TextStyle(color: Colors.white, fontSize: 17)),
                  const SizedBox(height: 5),
                  Text(myCourses[index].course!.name, style: const TextStyle(color: Colors.white, fontSize: 17)),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Başarı Notu\n${myCourses[index].successGrade ?? '-'}", style: const TextStyle(color: Colors.white, fontSize: 17), textAlign: TextAlign.center),
                        Text("Harf Notu\n${myCourses[index].letterGrade ?? '-'}", style: const TextStyle(color: Colors.white, fontSize: 17), textAlign: TextAlign.center),
                        Text("Kredi\n${myCourses[index].credit ?? '-'}", style: const TextStyle(color: Colors.white, fontSize: 17), textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                ],
              ),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => GradeDetailScreen(widget.student, myCourses[index]))
                );
              },
            )
        );
      },
    ));
  }
}
