import 'package:eskisehir_technical_university/data/student.dart';
import 'package:eskisehir_technical_university/screens/course_percent_detail_screen.dart';
import 'package:eskisehir_technical_university/screens/slider_menu.dart';
import 'package:eskisehir_technical_university/widgets/back_button_widget.dart';
import 'package:flutter/material.dart';

import '../data/student_course_status.dart';
import '../widgets/topbar_widget.dart';

class CoursePercentScreen extends StatefulWidget{
  Student student;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  CoursePercentScreen(this.student, {super.key});

  @override
  State<StatefulWidget> createState() {
    return CoursePercentScreenState();
  }

}

class CoursePercentScreenState extends State<CoursePercentScreen> {
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
      body: buildPercent(),
    );
  }

  buildPercent() {
    return Column(
      children: [
        BackButtonWidget(widget.student),
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
              return ListTile(
                title: Container(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
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
                      Text(myCourses[index].course!.name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Kodu\n${myCourses[index].course!.code ?? '-'}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                height: 2
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text("Grup\n${myCourses[index].course!.group ?? '-'}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                height: 2
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) => CoursePercentDetailScreen(widget.student, myCourses[index]))
                  );
                },
              );
            }
        )
    );
  }
}