import 'package:eskisehir_technical_university/data/student_course_status.dart';
import 'package:eskisehir_technical_university/screens/course_percent_screen.dart';
import 'package:eskisehir_technical_university/screens/slider_menu.dart';
import 'package:eskisehir_technical_university/widgets/percent_detail_widget.dart';
import 'package:flutter/material.dart';

import '../data/student.dart';
import '../widgets/topbar_widget.dart';

class CoursePercentDetailScreen extends StatefulWidget{
  StudentCourseGrades courseGrades;
  Student student;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  CoursePercentDetailScreen(this.student, this.courseGrades, {super.key});

  @override
  State<StatefulWidget> createState() {
    return CoursePercentDetailScreenState();
  }

}

class CoursePercentDetailScreenState extends State<CoursePercentDetailScreen> {
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
      body: buildDetail(),

    );
  }

  buildDetail() {
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
                            CoursePercentScreen(widget.student)));
              },
            ),
          ),
        ),
        buildCourseInfo(),
        buildPercents()
      ],
    );
  }

  buildCourseInfo() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(widget.courseGrades.course!.code,
              style: const TextStyle(
                  color: Color.fromRGBO(167, 38, 49, 1), fontSize: 22)),
          Container(
            margin: const EdgeInsets.only(top: 3),
            height: 1,
            color: Colors.black,
          ),
          const SizedBox(height: 10),
          Text(widget.courseGrades.course!.name,
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

  buildPercents() {
    return Expanded(
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.9 / 1.8,
          children: List.generate(6, (index) {
            return PercentDetailWidget(widget.courseGrades, index);
          }),
        ));
  }
}