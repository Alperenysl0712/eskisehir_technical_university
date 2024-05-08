import 'package:eskisehir_technical_university/data/advisor.dart';

class AdvisorSample{
  static var advisors = {
    1 : Advisor(1, "İsim" , "Soyisim 1", "Computer Engineering", "kullanıcı_1@mail.com"),
    2 : Advisor(2, "İsim" , "Soyisim 2", "Electrical Engineering", "kullanıcı_2@mail.com"),
    3 : Advisor(3, "İsim" , "Soyisim 3", "Architect", "kullanıcı_3@mail.com"),
    4 : Advisor(4, "İsim" , "Soyisim 4", "Chemical Engineering", "kullanıcı_4@mail.com"),
  };

  static Advisor getAdvisor(int id){
    return advisors[id]!;
  }

}