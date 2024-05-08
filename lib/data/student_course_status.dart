import 'package:eskisehir_technical_university/data/course_sample.dart';
import 'package:eskisehir_technical_university/data/courses.dart';
import 'package:eskisehir_technical_university/data/student.dart';
import 'package:eskisehir_technical_university/data/student_sample.dart';

import 'inspection.dart';

class StudentCourseGrades {
  Courses? course;
  double? firstMidterm;
  double? shortQuiz;
  double? task;
  double? work;
  double? project;
  double? finalExam;
  double? successGrade;
  String? letterGrade;
  double? credit;
  String? status;
  Inspection inspection;

  StudentCourseGrades(
      this.course,
      this.firstMidterm,
      this.shortQuiz,
      this.task,
      this.work,
      this.project,
      this.finalExam,
      this.successGrade,
      this.letterGrade,
      this.credit,
      this.status,
      this.inspection
      );

  static var grades = {
    1: {
      StudentSample.selectStudent("12345678910"): [
        StudentCourseGrades(CourseSample.selectedCourse(1), 75, null, null,
            null, 80, 100, 83, "AA", 6, "Geçti", Inspection.empty()),
        StudentCourseGrades(CourseSample.selectedCourse(3), null, null, null,
            null, null, null, null, null, 4.5, null, Inspection.empty()),
        StudentCourseGrades(CourseSample.selectedCourse(5), 45, 100, null, null,
            null, 70, 30.5, "FF", 3.5, "Kaldı", Inspection(20, 16, "Kaldı"))
      ],
      StudentSample.selectStudent("98523647105"): [
        StudentCourseGrades(CourseSample.selectedCourse(3), null, null, null,
            null, null, null, null, null, 4.5, null, Inspection.empty()),
      ]
    },
    2: {
      StudentSample.selectStudent("12345678910"): [
        StudentCourseGrades(CourseSample.selectedCourse(4), 100, 100, null,
            null, null, 100, 100, "AA", 7.5, "Geçti", Inspection.empty()),
      ],
      StudentSample.selectStudent("98523647105"): [
        StudentCourseGrades(CourseSample.selectedCourse(2), 38, null, null, 45,
            null, 20, 13, "FF", 5, "Kaldı", Inspection.empty()),
        StudentCourseGrades(CourseSample.selectedCourse(4), 63.5, 100, null,
            null, null, 40, 58.7, "CB", 3.5, "Geçti", Inspection.empty()),
      ]
    },
  };

  static List<StudentCourseGrades>? getGrades(Student student, int semester) {
    return grades[semester]?[student];
  }
}
