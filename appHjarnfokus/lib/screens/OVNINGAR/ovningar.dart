import 'package:apphjarnfokus/provider/drawerProvider.dart';
import 'package:apphjarnfokus/provider/music.dart';
import 'package:apphjarnfokus/provider/remiderProvider.dart';
import 'package:apphjarnfokus/screens/OVNINGAR/screen1.dart';
import 'package:apphjarnfokus/screens/OVNINGAR/screen2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:apphjarnfokus/provider/checkStack.dart';
import 'package:apphjarnfokus/widgets/om.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class OVNINGAR extends StatefulWidget {
  OVNINGAR({this.music});
  String? music;

  @override
  State<OVNINGAR> createState() => _OVNINGARState();
}

class _OVNINGARState extends State<OVNINGAR> {
  List<om> a = [
    om(
        d: 'Hjärnfokus - 5 min',
        i: "images/Introduktion.png",
        n: "Introduktion",
        u: "https://wpdb.mindfulnessapps.com/wp-content/uploads/2019/12/Introduktion-5-min.mp3")
  ];

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<drawerProvider>().k = 1;
      Provider.of<checkStack>(context, listen: false).Update();
      for (int i = 0; i < a.length; i++) {
        if (widget.music == a[i].name) {
          context.read<Music>().Stop();
          context
              .read<Music>()
              .Chage(a[i].name!, a[i].image!, a[i].des!, a[i].url!);
          context.read<Music>().updata();
          context.read<Music>().setUrl();
          context.read<Music>().btnhis = true;
          Provider.of<checkStack>(context, listen: false).change();
          break;
        }
      }
    });
    getbt();
    getValue1();
    getValue2();
    getGroupradio();
    getCancel();

    super.initState();
  }

  bool? check;

  Future<void> getbt() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    check = pref.getBool("btnhis");
    if (check != null) {
      Provider.of<Music>(context, listen: false).btnhis = check!;
    }
  }

  Future<void> getGroupradio() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? s = pref.getString("groupradio");
    if (s != null) {
      Provider.of<remiderProvider>(context, listen: false).groupRadio = s;
    }
  }

  Future<void> getCancel() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    bool? s = pref.getBool("checkCan");
    if (s != null) {
      Provider.of<remiderProvider>(context, listen: false).check = s;
    }
  }

  Future<void> getValue1() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? s = pref.getString("value1");
    if (s != null) {
      Provider.of<remiderProvider>(context, listen: false).value1 = s;
    }
  }

  Future<void> getValue2() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? s = pref.getString("value2");
    if (s != null) {
      Provider.of<remiderProvider>(context, listen: false).value2 = s;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Provider.of<checkStack>(context, listen: false).check == false) {
          Provider.of<checkStack>(context, listen: false).Update();
          return false;
        }
        return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: Text("Exit App?"),
            content: Text("Are you sure?"),
            actions: <Widget>[
              new TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('NO'),
              ),
              new TextButton(
                onPressed: () {
                  Provider.of<Music>(context, listen: false).Stop();
                  exit(0);
                },
                child: Text('YES'),
              ),
            ],
          ),
        ));
      },
      child: Container(
        child: Stack(
          children: [
            Positioned(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Screen1()),
            Selector<checkStack, bool>(
              selector: (buildcontext, checkStack) => checkStack.check,
              builder: (context, data, child) {
                return Visibility(
                    visible: context.watch<checkStack>().check == true
                        ? false
                        : true,
                    child: Screen2());
              },
            ),
          ],
        ),
      ),
    );
  }
}
