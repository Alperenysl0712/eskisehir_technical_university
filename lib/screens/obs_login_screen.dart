import 'package:eskisehir_technical_university/data/student.dart';
import 'package:eskisehir_technical_university/data/student_sample.dart';
import 'package:eskisehir_technical_university/screen_option/screen_option.dart';
import 'package:eskisehir_technical_university/screens/home_page_screen.dart';
import 'package:eskisehir_technical_university/screens/obs_main_screen.dart';
import 'package:eskisehir_technical_university/validation/login_validation.dart';
import 'package:eskisehir_technical_university/widgets/topbar_widget.dart';
import 'package:flutter/material.dart';

class ObsLoginScreen extends StatefulWidget {
  const ObsLoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return ObsLoginScreenState();
  }
}

class ObsLoginScreenState extends State with LoginValidation {
  TextEditingController txtTc = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var screenH = 0.0;
  @override
  Widget build(BuildContext context) {
    screenH = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: TopBarWidget(barType: 2).topBar(2, context),
      body: SingleChildScrollView(
        child: Container(
            alignment: Alignment.center,
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  buildMainLogo(),
                  const SizedBox(height: 10),
                  Text(
                    "Ortak Giriş Sistemi",
                    style: TextStyle(
                        fontSize: ScreenOption(context).getScreenWidth() * 0.055,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 40),
                  buildEdevletButton(),
                  const SizedBox(height: 10),
                  buildUserInfoTc(),
                  const SizedBox(height: 5),
                  buildUserInfoPassword(),
                  const SizedBox(height: 40),
                  buildLoginButton(),
                ],
              ),
            )),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  buildMainLogo() {
    return Image.asset(
      "lib/images/estu_logo_E.png",
      height: ScreenOption(context).get_login_logo(),
    );
  }

  buildEdevletButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      height: 50,
      child: Material(
        elevation: 12,
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromRGBO(0, 142, 244, 1),
        child: ElevatedButton(
            onPressed: () {
              // We will write a control for E-Devlet Connection
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(0, 142, 244, 1),
                elevation: 0),
            child: const Text(
              "E-Devlet Giriş",
              style: TextStyle(color: Colors.white, fontSize: 17),
            )),
      ),
    );
  }

  buildUserInfoTc() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      child: TextFormField(
        decoration: const InputDecoration(
            labelText: "E-Posta Adresi/T.C. Kimlik Numarası"),
        controller: txtTc,
        validator: EpostaTcValidate,
      ),
    );
  }

  buildUserInfoPassword() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      child: TextFormField(
        decoration: const InputDecoration(labelText: "Şifre"),
        controller: txtPassword,
        validator: PasswordValidate,
      ),
    );
  }

  buildLoginButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.65,
      height: 50,
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromRGBO(167, 38, 49, 1),
        child: ElevatedButton(
            onPressed: () {
              loginObs();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(167, 38, 49, 1),
                elevation: 0),
            child: const Text(
              "Giriş Yap",
              style: TextStyle(color: Colors.white, fontSize: 17),
            )),
      ),
    );
  }

  void loginObs() {


    var tc_eposta = txtTc.text;
    var password = txtPassword.text;

    if (formKey.currentState!.validate()) {
      Student student = StudentSample.selectStudent(tc_eposta)!;
      if (student.password == password) {
        var current_student = student;
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    ObsMainScreen(current_student!)));
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("T.C./E-posta veya Şifre yanlıştır."),
          ),
        );
      }
    }


  }
}
