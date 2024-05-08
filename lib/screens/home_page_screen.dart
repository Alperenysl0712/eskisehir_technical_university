import 'package:eskisehir_technical_university/screens/obs_login_screen.dart';
import 'package:eskisehir_technical_university/widgets/topbar_widget.dart';
import 'package:flutter/material.dart';

import '../screen_option/screen_option.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  Map<String, Widget>? pages = {
    "Öğrenci Bilgi Sistemi" : const ObsLoginScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBarWidget(barType: 1).topBar(1, context),
      body: buildBody(context),
    );
  }



  buildBody(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
            left: 0,
            child: Image(
              image: const AssetImage("lib/images/estu_logo_sag.png"),
              height: ScreenOption(context).getScreenHeight() * 0.4,
              alignment: Alignment.topLeft,
            )
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildButton("Öğrenci Bilgi Sistemi"),
              const SizedBox(height: 15,),
              buildButton("ESTU OYS"),
              const SizedBox(height: 15,),
              buildButton("Yemekhane"),
            ],
          ),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: Image(
              image: const AssetImage("lib/images/estu_logo_sol.png"),
              height: ScreenOption(context).getScreenHeight() * 0.4,
              alignment: Alignment.bottomRight,
            )
        ),
      ],
    );
  }

  buildButton(String btnName){
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.52,
      height: 50,
      child: Material(
        elevation: 9,
        shadowColor: const Color.fromRGBO(167, 38, 49, 0.65),
        borderRadius: BorderRadius.circular(8),
        child: ElevatedButton(
          onPressed: (){
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder:(BuildContext context) {
                      return pages![btnName]!;
                    }
                )
            );
          },
          style: ElevatedButton.styleFrom(
              elevation: 0
          ),
          child: Text(
            btnName,
            style: const TextStyle(
                fontSize: 16
            ),
          ),
        ),
      ),
    );
  }
}
