import 'package:apphjarnfokus/provider/checkStack.dart';
import 'package:apphjarnfokus/provider/drawerProvider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:apphjarnfokus/widgets/drawer.dart';
import 'package:apphjarnfokus/screens/OVNINGAR/ovningar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';

class OM extends StatefulWidget {
  const OM({Key? key}) : super(key: key);

  @override
  State<OM> createState() => _OMState();
}

class _OMState extends State<OM> {
  var def = TextStyle(color: Colors.white70, fontSize: 16,fontFamily: 'light');
  var link = TextStyle(color: Colors.white, fontSize: 16,fontFamily: 'medium');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<drawerProvider>().k = 2;
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        context.read<drawerProvider>().k = 1;
        Provider.of<checkStack>(context,listen: false).Update();
        return true;
      },
      child: Scaffold(
        backgroundColor: Color(0xff3eafc1),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff3eafc1),
          title: Center(child: Text("")),
        ),
        endDrawer: DrawerOnly(number: 2),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              Center(
                  child: Text(
                "Om HjarnFokus",
                style: TextStyle(fontSize: 28, color: Colors.white,fontFamily: 'medium'),
              )),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Text(
                    "I appen Hjärnfokus hittar du guidade övningar för mer lugn, fokus, kreativitet och glädje. Många av övningarna är 5 minuter eller kortare för att du lättare ska få in dem i din vardag. Ta en powerpaus, en fokusminut eller kom till ro med övningen Somna.",
                    style: TextStyle(fontSize: 16, color: Colors.white70,fontFamily: 'light')),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Text(
                    "Johan Bergstad – leg. psykolog, föreläsare och en av Sveriges främsta experter på fokusträning – guidar dig genom övningarna. Läs mer i boken Hjärnfokus – Så blir du lugn, kreativ och fokuserad.",
                    style: TextStyle(fontSize: 16, color: Colors.white70,fontFamily: 'light')),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Image.asset('images/about.png'),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Guide till ovningarna",
                style: TextStyle(fontSize: 22, color: Colors.white,fontFamily: 'medium'),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(style: def, text: "Lyssna pa "),
                    TextSpan(
                      style: link,
                      text: "Introduktion",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => OVNINGAR(
                                    music: "Introduktion",
                                  )));
                        },
                    ),
                    TextSpan(
                        style: def,
                        text:
                            " innan du gor ovningarna forsta gangen. Borja med"),
                    TextSpan(
                      style: link,
                      text: " Tre medvetna andetag ",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => OVNINGAR()));
                        },
                    ),
                    TextSpan(style: def, text: "eller "),
                    TextSpan(
                      style: link,
                      text: "Fokusminuten",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => OVNINGAR()));
                        },
                    ),
                    TextSpan(
                        style: def,
                        text:
                            " och ga sedan vidare till de langre ovningarna. Manga anvander "),
                    TextSpan(
                      style: link,
                      text: "Skarpt fokus ",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => OVNINGAR()));
                        },
                    ),
                    TextSpan(style: def, text: "och "),
                    TextSpan(
                      style: link,
                      text: "PARK",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => OVNINGAR()));
                        },
                    ),
                    TextSpan(
                        style: def,
                        text:
                            " for att kalibrera hijarnan i borjan av dagen( PARK star for Position - Andas - Rakna andetagen - Kom tillbaka)."),
                  ]),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        style: def,
                        text: "Behover du vila och aterhamtning sa finns "),
                    TextSpan(
                      style: link,
                      text: "Powerpausen",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => OVNINGAR()));
                        },
                    ),
                    TextSpan(
                        style: def,
                        text:
                            " i olika tidslangd, och vill du ha hjalp att komma till ro pa kvallen infor att du ska sova rekommenderar vi ovningen "),
                    TextSpan(
                      style: link,
                      text: "Somna.",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => OVNINGAR()));
                        },
                    )
                  ]),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        style: def,
                        text:
                            "Trana bara nar det passar utifran situationen du befinner dig i. Det ar till exempel inte lamplogt att ova nar du kor bil eller gor nagot annat som kraver ditt fokus. Om du har fysiska eller psykiska halsoutmaningar bor du eadfraga en lakare innan du ovar. Avsta fran stretchrorelserna i "),
                    TextSpan(
                      style: link,
                      text: "Mjukstarta dagen ",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => OVNINGAR()));
                        },
                    ),
                    TextSpan(
                        style: def,
                        text:
                            "om du till exempel har problem med ryggen eller nacken."),
                  ]),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: RichText(
                  text: TextSpan(
                      style: def,
                      text:
                          "Hjärnfokus definieras som en icke-dömande uppmärksamhet i nuet. Du kan avsiktligt styra denna uppmärksamhet dit du vill (för mer information, se boken Hjärnfokus sidan 21). Du riktar uppmärksamheten och när den vandrar för du tillbaka den. Tack vare att fokus vandrar får du motståndet som behövs för att lyfta den inre hanteln och träna hjärnan."),
                ),
              ),
              Container(
                child: RichText(
                  text: TextSpan(
                    style: link,
                    text: "support@mindfulnessapps.com",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        final url =
                            "https://mindfulnessapps.com/support/";
                        if (!await launchUrl(Uri.parse(url),webViewConfiguration: WebViewConfiguration(enableJavaScript: false))) {
                          throw 'Could not launch $url';
                        }
                      },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
