import 'package:apphjarnfokus/provider/checkStack.dart';
import 'package:apphjarnfokus/provider/drawerProvider.dart';
import 'package:flutter/material.dart';
import 'package:apphjarnfokus/widgets/drawer.dart';
import 'package:apphjarnfokus/screens/MIN PROFIL/Subscription.dart';
import 'package:provider/provider.dart';

class Un extends StatefulWidget {
  const Un({Key? key}) : super(key: key);

  @override
  State<Un> createState() => _UnState();
}

class _UnState extends State<Un> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<drawerProvider>().k = 7;
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
          title: Text(""),
          leading: IconButton(
              onPressed: () {
                context.read<drawerProvider>().k = 1;
                Provider.of<checkStack>(context,listen: false).Update();
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios)),
          backgroundColor: Color(0xff3eafc1),
        ),
        endDrawer: DrawerOnly(number: 2),
        body: Container(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: Center(
                    child: Image.asset(
                      "images/logo_purchase.png",
                      height: 200,
                      width: 180,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text("Vill du fa",
                        style: TextStyle(fontSize: 25, color: Colors.white)),
                    Text("mer hjarnfokus?",
                        style: TextStyle(fontSize: 25, color: Colors.white)),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Då har du kommit rätt! Den här appen ger dig verktygen och övningarna du behöver. Testa gratis i 30 dagar. Därefter kan du välja mellan att betala per månad eller år. Du kan när som helst avbryta prenumerationen.",
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                          fontFamily: "light"),
                    )),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => SU(
                              n: "49kr/manad",
                            )));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    height: 40,
                    width: 200,
                    child: Center(
                        child: Text(
                      "49kr/manad",
                      style: TextStyle(color: Color(0xff3eafc1)),
                    )),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => SU(
                              n: "395kr/ar",
                            )));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    height: 40,
                    width: 200,
                    child: Center(
                        child: Text(
                      "395kr/ar",
                      style: TextStyle(color: Color(0xff3eafc1)),
                    )),
                  ),
                ),
              ),
              Text("Aterstall kop",
                  style: TextStyle(fontSize: 15, color: Colors.white)),
              Expanded(
                flex: 2,
                child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "De första 30 dagarna provar du kostnadsfritt. Därefter förnyas prenumerationen automatiskt om den inte avbryts senast 24 timmar innan en pågående period löper ut (månad eller år). Här kan du läsa mer om hur du avbryter prenumerationen, användarvillkor och integritetspolicy",
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
