import 'package:eskisehir_technical_university/data/student.dart';

import 'courses.dart';

class CourseSample {
  static var courseList = {
    1: Courses(
        1,
        1,
        "Computer Programming IV",
        "BİM234",
        null,
        CoursePercent(
            firstMidterm: 30,
            finalExamType: "Test",
            project: 30,
            projectType: "Klasik",
            finalExam: 40,
            firstMidtermType: "Test")),
    2: Courses(2, 2, "Internet Programming", "BİM356", null, CoursePercent()),
    3: Courses(3, 1, "Logic Design", "BİM135", null, CoursePercent()),
    4: Courses(4, 2, "Linear Algebra", "BİM137", null, CoursePercent()),
    5: Courses(
        5,
        1,
        "İspanyolca 1",
        "ESP105",
        "B",
        CoursePercent(
            firstMidterm: 35,
            firstMidtermType: "Test",
            shortQuiz: 25,
            shortQuizType: "Test",
            finalExam: 50,
          finalExamType: "Test"
        )),
  };

  static Courses? selectedCourse(int id) {
    return courseList[id];
  }
}
