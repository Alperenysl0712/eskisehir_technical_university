import 'package:eskisehir_technical_university/data/advisor.dart';
import 'package:eskisehir_technical_university/data/advisor_sample.dart';
import 'package:eskisehir_technical_university/data/student.dart';
import 'package:eskisehir_technical_university/data/student_infos.dart';
import 'package:eskisehir_technical_university/data/yoksis_infos.dart';

class StudentSample {
  static var students = {
    "12345678910": Student.withId(
        1,
        "Alperen Burak",
        "Yeşil",
        "12345678910",
        "123456",
        "+90 111 222 33 44",
        "Bilgisayar Mühendisliği",
        AdvisorSample.getAdvisor(1),
        StudentInfos(
            "Bilgisayar Mühendisliği Bölümü (İngilizce)", null, "Onaylandı"),
      YoksisInfos(
        "ESKİŞEHİR TEKNİK ÜNİVERSİTESİ",
        "MÜHENDİSLİK FAKÜLTESİ / BİLGİSAYAR MÜHENDİSLİĞİ PR. (İNGİLİZCE)",
        "AKTİF ÖĞRENCİ",
        "29/08/2020 00:01:00",
        null
      )
    ),
    "98765432101": Student.withId(
        2,
        "Sera",
        "Sarı",
        "98765432101",
        "123456",
        "+90 555 666 77 88",
        "Electrical Engineering",
        AdvisorSample.getAdvisor(2),
        StudentInfos("Elektrik Elektronik Mühendisliği Bölümü (İngilizce)",
            null, "Onaylandı"),
        YoksisInfos(
            "ESKİŞEHİR TEKNİK ÜNİVERSİTESİ",
            "MÜHENDİSLİK FAKÜLTESİ / ELEKTRİK-ELEKTRONİK MÜHENDİSLİĞİ PR. (İNGİLİZCE)",
            "AKTİF ÖĞRENCİ",
            "29/08/2020 00:01:00",
            null
        )
    ),
    "15987532165": Student.withId(
        3,
        "Kaan",
        "Çakar",
        "15987532165",
        "123456",
        "+90 222 536 65 98",
        "Architect",
        AdvisorSample.getAdvisor(3),
        StudentInfos("Mimarlık Bölümü", null, "Onaylandı"),
        YoksisInfos(
            "ESKİŞEHİR TEKNİK ÜNİVERSİTESİ",
            "MİMARLIK FAKÜLTESİ / MİMARLIK PR.",
            "AKTİF ÖĞRENCİ",
            "29/08/2020 00:01:00",
            null
        )
    ),
    "98523647105": Student.withId(
        4,
        "Seda",
        "Çiçek",
        "98523647105",
        "123456",
        "+90 159 863 65 74",
        "Chemical Engineering",
        AdvisorSample.getAdvisor(4),
        StudentInfos(
            "Kimya Mühendisliği Bölümü (%30 İngilizce)", null, "Onaylandı"),
        YoksisInfos(
            "ESKİŞEHİR TEKNİK ÜNİVERSİTESİ",
            "MÜHENDİSLİK FAKÜLTESİ / KİMYA MÜHENDİSLİĞİ PR. (%30 İNGİLİZCE)",
            "AKTİF ÖĞRENCİ",
            "29/08/2020 00:01:00",
            null
        )
    )
  };

  static Student? selectStudent(String tc) {
    return students[tc];
  }
}
