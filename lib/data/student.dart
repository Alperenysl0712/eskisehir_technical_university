import 'package:eskisehir_technical_university/data/student_infos.dart';
import 'package:eskisehir_technical_university/data/yoksis_infos.dart';

import 'advisor.dart';

class Student{
  int id = 0;
  String name = '';
  String surname = '';
  String tc = '';
  String password = '';
  String phone = '';
  String department = '';
  Advisor advisor;
  StudentInfos studentInfos;
  YoksisInfos yoksisInfos;

  Student.withId(this.id, this.name, this.surname, this.tc, this.password, this.phone,
      this.department, this.advisor, this.studentInfos, this.yoksisInfos);


}