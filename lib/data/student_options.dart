import 'package:eskisehir_technical_university/data/student.dart';
import 'package:eskisehir_technical_university/screens/advisor_screen.dart';
import 'package:eskisehir_technical_university/screens/course_percent_screen.dart';
import 'package:eskisehir_technical_university/screens/grades_screen.dart';
import 'package:eskisehir_technical_university/screens/inspection_screen.dart';
import 'package:eskisehir_technical_university/screens/message_screen.dart';
import 'package:eskisehir_technical_university/screens/registration_information.dart';
import 'package:flutter/cupertino.dart';

class StudentOptions{
  String optionName = '';

  static List<String> options = [
    "Notlar",
    "Parçalı Sınav Notları",
    "Kayıt İşlemleri",
    "Akademik Danışman Bilgileri",
    "Ders Programı",
    "Yoklama",
    "Kayıt Bilgileri",
    "Anket",
    "Sınav Yüzdelikleri",
    "Ders Arama ve Kontenjan",
    "Mesajlaşma",
    "Mezun Kayıt Formu",
    "Tez Bilgileri",
  ];



  static Widget? goToPage(Student student, String page) {
    switch (page){
      case "Notlar":
        return GradesScreen(student);
      case "Akademik Danışman Bilgileri":
        return AdvisorScreen(student);
      case "Yoklama":
        return InspectionScreen(student);
      case "Kayıt Bilgileri":
        return RegistrationInformation(student);
      case "Sınav Yüzdelikleri":
        return CoursePercentScreen(student);
      case "Mesajlaşma":
        return MessageScreen(student);
    }
  }

}