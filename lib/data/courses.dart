class Courses {
  int id = 0;
  int semester = 0;
  String name = "";
  String code = "";
  String? group;
  CoursePercent percent;

  Courses(
      this.id, this.semester, this.name, this.code, this.group, this.percent);
}

class CoursePercent {
  int? firstMidterm;
  int? shortQuiz;
  int? task;
  int? work;
  int? project;
  int? finalExam;

  String? firstMidtermType;
  String? shortQuizType;
  String? taskType;
  String? workType;
  String? projectType;
  String? finalExamType;

  CoursePercent(
      {this.firstMidterm,
      this.shortQuiz,
      this.task,
      this.work,
      this.project,
      this.finalExam,
      this.firstMidtermType,
      this.shortQuizType,
      this.taskType,
      this.workType,
      this.projectType,
      this.finalExamType});
}
