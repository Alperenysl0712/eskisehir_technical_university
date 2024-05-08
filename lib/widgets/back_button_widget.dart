import 'package:eskisehir_technical_university/data/student.dart';
import 'package:flutter/material.dart';

import '../screens/obs_main_screen.dart';

class BackButtonWidget extends StatelessWidget{
  Student student;
  BackButtonWidget(this.student, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5),
      alignment: Alignment.centerLeft,
      child: Ink.image(
        image: const AssetImage("lib/images/back_button.png"),
        height: 70,
        width: 70,
        child: InkWell(
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ObsMainScreen(student)));
          },
        ),
      ),
    );
  }

}