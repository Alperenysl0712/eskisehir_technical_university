import 'package:flutter/material.dart';

import '../screen_option/screen_option.dart';
import '../screens/home_page_screen.dart';

class TopBarWidget extends StatelessWidget {
  int? barType;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  TopBarWidget({super.key, this.barType, this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }

  PreferredSizeWidget topBar(int barType, BuildContext context) {
    var firstIcon = getFirstIcons(context)[barType];
    var secondIcon = (barType == 1 || barType == 2)
        ? getSecondIcons(context)[1]
        : getSecondIcons(context)[2];
    var thirdIcon = (barType == 1 || barType == 2)
        ? getThirdIcons(context)[1]
        : getThirdIcons(context)[2];


    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: (barType == 1 || barType == 2)
          ? Colors.white
          : const Color.fromRGBO(107, 107, 107, 1),
      toolbarHeight: ScreenOption(context).getToolH_obs_login(),
      actions: [
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  firstIcon,
                  secondIcon,
                  thirdIcon,
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Map getFirstIcons(BuildContext context) {
    return {
      1: SizedBox(
        width: 70,
        child: Image.asset(
          "lib/images/estu_logo_circle.png",
          height: 65,
          width: 65,
        ),
      ),
      2: SizedBox(
          width: 70,
          child: Ink.image(
            image: const AssetImage("lib/images/back_button.png"),
            height: 65,
            width: 65,
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const HomePage()));
              },
            ),
          )),
      3: SizedBox(
          width: 70,
          child: Ink.image(
            image: const AssetImage("lib/images/menu.png"),
            height: 65,
            width: 65,
            child: InkWell(
              onTap: () {
                scaffoldKey!.currentState!.openDrawer();
              },
            ),
          ))
    };
  }

  Map getSecondIcons(BuildContext context) {
    return {
      1: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Image.asset(
          "lib/images/estu_logo_name.png",
          height: 55,
          width: MediaQuery.of(context).size.width * 0.6,
        ),
      ),
      2: const SizedBox(
        child: Text(
          "Örgün Öğrenci Sistemi",
          style: TextStyle(
              color: Colors.white, fontSize: 23, fontWeight: FontWeight.w700),
        ),
      )
    };
  }

  Map getThirdIcons(BuildContext context) {
    return {
      1: SizedBox(
        width: 70,
        child: Image.asset(
          "lib/images/estu_logo_circle.png",
          height: 65,
          width: 65,
        ),
      ),
      2: SizedBox(
        width: 70,
        child: Image.asset(
          "lib/images/estu_logo_white.png",
          height: 65,
          width: 65,
        ),
      )
    };
  }
}
