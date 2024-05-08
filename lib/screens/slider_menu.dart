
import 'package:eskisehir_technical_university/data/student.dart';
import 'package:eskisehir_technical_university/screens/home_page_screen.dart';
import 'package:flutter/material.dart';

class SliderMenu extends StatelessWidget {
  Student student;
  GlobalKey<ScaffoldState> scaffoldKey;
  SliderMenu(this.student, this.scaffoldKey, {super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            Expanded(child: buildBody(context)),
          ],
        ),
      );

  buildHeader(BuildContext context) {
    var screen = MediaQuery.of(context).size.height;
    return Container(
      color: const Color.fromRGBO(167, 38, 49, 1),
      height: screen < 750 ? screen * 0.4 : screen * 0.31,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () {
                scaffoldKey.currentState!.closeDrawer();
              },
              child: const Text(
                "X",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 10, top: 5, bottom: 20),
            child: Row(
              children: [
                Image.asset(
                  "lib/images/user.png",
                  width: 100,
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "${student.name} ${student.surname}",
                    style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                const Text("Telefon No: ", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                Container(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(student.phone, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Row(
              children: [
                const Text("Öğrenci No: ", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                Container(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(student.tc, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Row(
              children: [
                const Text("Birimi: ", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                Container(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(student.department, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  buildBody(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        width: MediaQuery.of(context).size.width * 0.65,
        alignment: Alignment.bottomCenter,
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromRGBO(167, 38, 49, 1), width: 5),
            borderRadius: BorderRadius.circular(10)
        ),
        child: TextButton(
          onPressed: (){
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (BuildContext context) => const HomePage())
            );
          },
          child: const Text(
              "Çıkış",
            style: TextStyle(
              color: Color.fromRGBO(167, 38, 49, 1),
              fontSize: 17,
              fontWeight: FontWeight.bold
            ),
          )
        ),
      ),
    );
  }
}
