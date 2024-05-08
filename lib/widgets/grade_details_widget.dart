import 'package:eskisehir_technical_university/data/courses.dart';
import 'package:eskisehir_technical_university/data/student_course_status.dart';
import 'package:eskisehir_technical_university/screen_option/screen_option.dart';
import 'package:flutter/material.dart';

class GradeDetailWidget extends StatelessWidget{
  StudentCourseGrades course;
  int index;
  GradeDetailWidget(this.course, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return buildGrades(context);
  }

  Widget buildGrades(BuildContext context) {
    var gradeList = {
      "1.Ara Sınav" : course.firstMidterm,
      "Kısa Sınav" : course.shortQuiz,
      "Ödev" : course.task,
      "Uygulama" : course.work,
      "Proje" : course.project,
      "Dönem Sonu Sınavı" : course.finalExam,
      "Başarı Notu" : course.successGrade,
      "Harf Notu" : course.letterGrade,
      "Kredi" : course.credit,
      "Devam Durumu" : course.status,
    };
    List<String> keys = gradeList.keys.toList();

    String key = keys[index];

    if(index != 9){
      return Card(
        child: Container(
          padding: const EdgeInsets.fromLTRB(5, 5, 5, 30),
          margin: const EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
              border: Border.all(color: const Color.fromRGBO(167, 38, 49, 1), width: 5),
              borderRadius: BorderRadius.circular(10),
            color: Colors.white
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(key, textAlign: TextAlign.center, style: const TextStyle(fontSize: 15),),
              Text(gradeList[key] == null ? '-' : gradeList[key].toString(), style: const TextStyle(fontSize: 15),),
            ],
          ),
        ),
      );
    }
    else{
      return Container(
        height: 90,
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
        margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromRGBO(167, 38, 49, 1), width: 5),
            borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(key, textAlign: TextAlign.center, style: const TextStyle(fontSize: 15),),
            Text(gradeList[key] == null ? '-' : gradeList[key].toString(), style: const TextStyle(fontSize: 15),),
          ],
        ),
      );
    }


  }


}