import 'package:flutter/material.dart';

import '../data/student_course_status.dart';

class PercentDetailWidget extends StatelessWidget {
  StudentCourseGrades courseGrades;
  int index;
  PercentDetailWidget(this.courseGrades, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return builPercents(context);
  }

  Widget builPercents(BuildContext context) {
    var gradeList = {
      "1.Ara Sınav": [courseGrades.course!.percent.firstMidterm, courseGrades.course!.percent.firstMidtermType],
      "Kısa Sınav": [courseGrades.course!.percent.shortQuiz, courseGrades.course!.percent.shortQuizType],
      "Ödev": [courseGrades.course!.percent.task, courseGrades.course!.percent.taskType],
      "Uygulama": [courseGrades.course!.percent.work, courseGrades.course!.percent.workType],
      "Proje": [courseGrades.course!.percent.project, courseGrades.course!.percent.projectType],
      "Dönem Sonu Sınavı": [courseGrades.course!.percent.finalExam, courseGrades.course!.percent.finalExamType],
    };

    List<String> keys = gradeList.keys.toList();

    String key = keys[index];

    return Container(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
      margin: const EdgeInsets.all(25),
      decoration: BoxDecoration(
          border:
          Border.all(color: const Color.fromRGBO(167, 38, 49, 1), width: 5),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            key,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            gradeList[key]![1] == null ? '-' : gradeList[key]![1].toString(),
            style: const TextStyle(fontSize: 15),
          ),
          Text(
            gradeList[key]![0] == null ? '-' : '% ${gradeList[key]![0]}',
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
