import 'package:eskisehir_technical_university/data/student.dart';
import 'package:intl/intl.dart';

class Message{
  late Student student;
  late String receiver;
  late String subject;
  late String messageDate;
  late List<Content> content;

  Message(this.student, this.receiver, this.subject, this.content) : messageDate = DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now().toUtc().add(const Duration(hours: 3)));
}

class Content{
  late var sender;
  late String content;
  late String sendingDate;

  Content(this.sender, this.content) : sendingDate = DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now().toUtc().add(const Duration(hours: 3)));
}