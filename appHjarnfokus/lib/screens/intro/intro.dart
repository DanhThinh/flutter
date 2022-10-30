import 'package:apphjarnfokus/provider/introProvider.dart';
import 'package:flutter/material.dart';
import 'package:apphjarnfokus/widgets/introPage.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';

class intro extends StatefulWidget {
  @override
  State<intro> createState() => _CratouselState();
}

class _CratouselState extends State<intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        // baseBtnStyle: TextButton.styleFrom(alignment: Alignment.centerLeft),
        isProgress: context.watch<introProvier>().check,
        dotsDecorator: DotsDecorator(
          activeColor: Colors.white,
          size: const Size.square(10.0),
          color: Colors.white70,
          spacing: const EdgeInsets.symmetric(horizontal: 5.0),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        ),
        globalBackgroundColor: Color(0xff3eafc1),
        showNextButton: true,
        showBackButton: true,
        back: Image.asset(
          "images/previous.png",
          height: 40,
          width: 40,
        ),
        next: Image.asset(
          "images/next.png",
          height: 40,
          width: 40,
        ),
        done: Container(),
        onDone: () {},
        rawPages: [
          introPage(
            number: 0,
            descretion:
                "Vill du ha mer fokus, lugn, kreativitet och glädje? Då har du kommit rätt! Den här appen ger dig verktygen och övningarna du behöver.",
            title: "Valkommen",
            imagek: "images/logo2x.png",
          ),
          introPage(
            number: 0,
            title: "Johan Bergstad",
            descretion:
                "Johan är leg. psykolog, föreläsare, författare till Hjärnfokus och en av Sveriges främsta experter på fokusträning. Här har han samlat sina bästa tips och övningar i en och samma app.",
            imagek: "images/man.jpeg",
          ),
          introPage(
            number: 1,
            title: "Bli piloten i ditt liv",
            imagek: "images/intro2@2x.png",
            descretion:
                "Här hittar du guidade övningar, många av dem 5 minuter eller kortare för att du lättare ska få in dem i din vardag. Ta en powerpaus, en fokusminut eller kom till ro med övningen Somna.",
          )
        ],
      ),
    );
  }
}
