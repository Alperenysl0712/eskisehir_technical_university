import 'package:eskisehir_technical_university/data/student.dart';
import 'package:eskisehir_technical_university/screen_option/screen_option.dart';
import 'package:flutter/material.dart';

class YoksisInfosWidget extends StatelessWidget{
  Student student;


  YoksisInfosWidget(this.student, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Yöksis Kayıt Bilgileri",
          style: TextStyle(
            color: Colors.black,
            fontSize: 19,
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.only(top: 15),
          alignment: Alignment.center,
          width: ScreenOption(context).getScreenWidth() * 0.9,
          height: 270,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(167, 38, 49, 1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white, width: 3),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.44),
                    offset: const Offset(2, 3),
                    blurRadius: 13.3,
                    spreadRadius: 2
                )
              ]
          ),
          child:
          Column(
            children: [
              Text(
                student.yoksisInfos.universityName!,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 20),
              Text(
                student.yoksisInfos.department!,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Text(
                student.yoksisInfos.status!,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Kayıt Tarihi\n${student.yoksisInfos.registerDate ?? '-'}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      height: 2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Ayrılma Tarihi\n${student.yoksisInfos.graduateDate ?? '-'}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        height: 2
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

}