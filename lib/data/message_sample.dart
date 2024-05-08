import 'package:eskisehir_technical_university/data/message.dart';
import 'package:eskisehir_technical_university/data/student.dart';
import 'package:eskisehir_technical_university/data/student_sample.dart';

class MessageSample {
  static var messages = {
    StudentSample.selectStudent("12345678910"): [
      Message(StudentSample.selectStudent("12345678910")!, "Advisor 1",
          "Deneme 1", [
        Content(StudentSample.selectStudent("12345678910"),
            "Güneş batarken, gökyüzü turuncu ve mor tonlara bürünüyordu, manzara gerçekten büyüleyiciydi. Rüzgar hafifçe esiyor, ağaçların yaprakları hafifçe sallanıyordu. Bu anı paylaşmak istedim çünkü doğanın güzelliği sadece gözlerime değil, ruhuma da dokunuyor. Her günün bir hediye olduğunu hatırlamak önemli. Hayatın tadını çıkarmak için küçük şeylere odaklanmak gerekiyor. Birlikte bir yolculuğa çıkalım ve bu güzellikleri keşfedelim. Belki bir günbatımı pikniği yapabiliriz, yanımızda en sevdiğimiz yiyeceklerle, keyifli bir sohbet eşliğinde. Ya da sadece sessizce oturup doğanın seslerini dinleyebiliriz. Ne dersin? Bu anları birlikte yaşamak harika olurdu, bana katılmak ister misin?"),
        Content("Advisor 1", "Deneme 1 devam ediyor"),
        Content(
            StudentSample.selectStudent("12345678910"), "Deneme 1 sona erdi")
      ]),
      Message(StudentSample.selectStudent("12345678910")!, "Advisor 2",
          "Deneme 2", [
        Content("Advisor 2", "Deneme 2 başlatıldı"),
        Content(StudentSample.selectStudent("12345678910"),
            "Deneme 2 devam ediyor"),
        Content("Advisor 2", "Deneme 2 sona erdi")
      ]),
      Message(StudentSample.selectStudent("12345678910")!, "Advisor 3",
          "Deneme 3", [
        Content(
            StudentSample.selectStudent("12345678910"), "Deneme 3 başlatıldı"),
        Content(StudentSample.selectStudent("12345678910"),
            "Deneme 3 devam ediyor"),
        Content(
            StudentSample.selectStudent("12345678910"), "Deneme 3 sona erdi")
      ]),
      Message(StudentSample.selectStudent("12345678910")!, "Advisor 4",
          "Deneme 4", [
        Content("Advisor 4", "Deneme 4 başlatıldı"),
        Content("Advisor 4", "Deneme 4 devam ediyor"),
        Content("Advisor 4", "Deneme 4 sona erdi")
      ])
    ],
  };

  static List<Message> getMessage(Student student) {
    return messages[student]!;
  }

  static void addMessage(Message message) {
    messages[message.student]!.add(message);
  }

  static void addMessageContent(Message message, String content) {
    int index = messages[message.student]!.indexOf(message);

    messages[message.student]?[index].content.add(Content(message.student, content));
  }
}
