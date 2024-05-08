import 'package:eskisehir_technical_university/data/student.dart';
import 'package:eskisehir_technical_university/data/student_course_status.dart';
import 'package:eskisehir_technical_university/screen_option/screen_option.dart';
import 'package:eskisehir_technical_university/screens/grades_screen.dart';
import 'package:eskisehir_technical_university/screens/slider_menu.dart';
import 'package:eskisehir_technical_university/widgets/grade_details_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/topbar_widget.dart';

class GradeDetailScreen extends StatefulWidget {
  Student student;
  StudentCourseGrades course;
  GradeDetailScreen(this.student, this.course, {super.key});

  @override
  State<StatefulWidget> createState() {
    return GradeDetailScreenState();
  }
}

class GradeDetailScreenState extends State<GradeDetailScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: TopBarWidget(barType: 3, scaffoldKey: _scaffoldKey).topBar(3, context),
      body: buildGradeDetail(),
      drawer: SliderMenu(widget.student,_scaffoldKey),
    );
  }

  buildGradeDetail() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                            GradesScreen(widget.student)));
              },
            ),
          ),
        ),
        buildCourseInfo(),
        Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SizedBox(
                height: ScreenOption(context).getScreenHeight() < 750 ? ScreenOption(context).getScreenHeight() - 220 : ScreenOption(context).getScreenHeight() - 325,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    buildGrades(),
                    GradeDetailWidget(widget.course, 9)
                  ],
                ),
              ),
            )
        )

      ],
    );
  }

  buildCourseInfo() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Text(widget.course.course!.code,
              style: const TextStyle(
                  color: Color.fromRGBO(167, 38, 49, 1), fontSize: 22)),
          Container(
            margin: const EdgeInsets.only(top: 3),
            height: 1,
            color: Colors.black,
          ),
          const SizedBox(height: 10),
          Text(widget.course.course!.name,
              style: const TextStyle(
                  color: Color.fromRGBO(167, 38, 49, 1), fontSize: 20)),
          Container(
            margin: const EdgeInsets.only(top: 3),
            height: 1,
            color: Colors.black,
          )
        ],
      ),
    );
  }

  buildGrades() {
    return Expanded(
        child: GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(9, (index) {
            return GradeDetailWidget(widget.course, index);
          }),
        ));
  }
}
