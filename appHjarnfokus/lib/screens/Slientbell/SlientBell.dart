import 'package:apphjarnfokus/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import 'package:apphjarnfokus/provider/bell.dart';

class Bell extends StatefulWidget {
  const Bell({Key? key}) : super(key: key);

  @override
  State<Bell> createState() => _BellState();
}

class _BellState extends State<Bell> {
  String timeDefault = "00:00";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Provider.of<SlientBell>(context, listen: false).open();
      context.read<SlientBell>().tongThoiGian = Duration(seconds: 0);
      context.read<SlientBell>().thoiGianChay = Duration(seconds: 0);
    });
  }

  void show(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            actions: [
              Row(
                children: [
                  Expanded(
                      child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel"),
                  )),
                  Expanded(
                      child: TextButton(
                    onPressed: () {
                      context.read<SlientBell>().Runkeu();
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Select",
                      style: TextStyle(color: Color(0xff3eafc1)),
                    ),
                  )),
                ],
              )
            ],
            title: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              height: 260,
              width: 220,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              context.read<SlientBell>().timeK(1);
                            },
                            child: Text("1 Minute")),
                        context.watch<SlientBell>().keu == 1
                            ? Icon(
                                Icons.check,
                                color: Colors.green,
                              )
                            : Container()
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              context.read<SlientBell>().timeK(2);
                            },
                            child: Text("2 Minutes")),
                        context.watch<SlientBell>().keu == 2
                            ? Icon(
                                Icons.check,
                                color: Colors.green,
                              )
                            : Container()
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              context.read<SlientBell>().timeK(3);
                            },
                            child: Text("3 Minutes")),
                        context.watch<SlientBell>().keu == 3
                            ? Icon(
                                Icons.check,
                                color: Colors.green,
                              )
                            : Container()
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              context.read<SlientBell>().timeK(5);
                            },
                            child: Text("5 Minutes")),
                        context.watch<SlientBell>().keu == 5
                            ? Icon(
                                Icons.check,
                                color: Colors.green,
                              )
                            : Container()
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              context.read<SlientBell>().timeK(10);
                            },
                            child: Text("10 Minutes")),
                        context.watch<SlientBell>().keu == 10
                            ? Icon(
                                Icons.check,
                                color: Colors.green,
                              )
                            : Container()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff3eafc1),
      endDrawer: DrawerOnly(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff3eafc1),
        title: Center(child: Text("HJÄRNFOKUS")),
        leading: Padding(
            padding: EdgeInsets.all(0),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_drop_down_circle_outlined),
            )),
      ),
      body: Container(
        color: Color(0xff3eafc1),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    height: 300,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Color(0xffFFC409)),
                      backgroundColor: Colors.white,
                      value:
                          context.read<SlientBell>().tongThoiGian.inSeconds > 0
                              ? 1 -
                                  context
                                          .read<SlientBell>()
                                          .thoiGianChay
                                          .inSeconds /
                                      context
                                          .read<SlientBell>()
                                          .tongThoiGian
                                          .inSeconds
                              : 0 / 1,
                      strokeWidth: 5,
                    ),
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: 300,
                              child: CupertinoTimerPicker(
                                mode: CupertinoTimerPickerMode.ms,
                                onTimerDurationChanged: (time) {
                                  if (context.read<SlientBell>().tongThoiGian !=
                                      time) {
                                    context.read<SlientBell>().thoiGianChay =
                                        time;
                                    setState(
                                      () {
                                        context
                                            .read<SlientBell>()
                                            .tongThoiGian = time;
                                        timeDefault = (time.inMinutes % 60)
                                                .toString()
                                                .padLeft(2, '0') +
                                            ":" +
                                            (time.inSeconds % 60)
                                                .toString()
                                                .padLeft(2, '0');
                                      },
                                    );
                                  }
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            (context
                                            .watch<SlientBell>()
                                            .thoiGianChay
                                            .inMinutes %
                                        60)
                                    .toString()
                                    .padLeft(2, '0') +
                                ":" +
                                (context
                                            .watch<SlientBell>()
                                            .thoiGianChay
                                            .inSeconds %
                                        60)
                                    .toString()
                                    .padLeft(2, '0'),
                            style: TextStyle(
                                fontSize: 62,
                                fontFamily: "light",
                                color: Colors.white),
                          ),
                          Text(
                              "Time " +
                                  (context
                                              .watch<SlientBell>()
                                              .tongThoiGian
                                              .inMinutes %
                                          60)
                                      .toString()
                                      .padLeft(2, '0') +
                                  ":" +
                                  (context
                                              .watch<SlientBell>()
                                              .tongThoiGian
                                              .inSeconds %
                                          60)
                                      .toString()
                                      .padLeft(2, '0'),
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "light",
                                  color: Colors.white))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: context.watch<SlientBell>().isStart
                  ? btnPause()
                  : ButtonStart(),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(10)),
                    height: 48,
                    width: 320,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            flex: 2,
                            child: GestureDetector(
                                onTap: () {
                                  show(context);
                                },
                                child: Text(
                                    "Interval bells each: ${Provider.of<SlientBell>(context, listen: false).timeKeu.toString()} mins"))),
                        Expanded(
                          child: FlutterSwitch(
                            toggleSize: 20,
                            activeColor: Color(0xffFFC409),
                            activeToggleColor: Colors.white,
                            width: 50,
                            height: 25,
                            value: context.watch<SlientBell>().checkKeu,
                            onToggle: (value) {
                              if (Provider.of<SlientBell>(context,
                                          listen: false)
                                      .isStart ==
                                  false) {
                                context.read<SlientBell>().chageKeu(value);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class btnPause extends StatelessWidget {
  const btnPause({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                color: Color(0xff3EAFC1),
                borderRadius: BorderRadius.circular(10)),
            height: 45,
            width: 130,
            child: TextButton(
              onPressed: () {
                context.read<SlientBell>().chage();
                context.read<SlientBell>().tongThoiGian = Duration(seconds: 0);
                context.read<SlientBell>().thoiGianChay = Duration(seconds: 0);
              },
              child: Text(
                "Cancel",
                style: TextStyle(
                    fontSize: 18, fontFamily: "medium", color: Colors.white),
              ),
            ),
          ),
          context.watch<SlientBell>().isPause ? btnpause() : btnResume(),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}

class btnResume extends StatelessWidget {
  const btnResume({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xffFFC409), borderRadius: BorderRadius.circular(10)),
      height: 45,
      width: 130,
      child: TextButton(
        onPressed: () {
          context.read<SlientBell>().chageP();
          context.read<SlientBell>().startTimer();
        },
        child: Text(
          "Resume",
          style: TextStyle(
              fontSize: 18, fontFamily: "medium", color: Colors.white),
        ),
      ),
    );
  }
}

class btnpause extends StatelessWidget {
  const btnpause({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xffFFC409), borderRadius: BorderRadius.circular(10)),
      height: 45,
      width: 130,
      child: TextButton(
        onPressed: () {
          context.read<SlientBell>().chageP();
          context.read<SlientBell>().stop();
        },
        child: Text(
          "Pause",
          style: TextStyle(
              fontSize: 18, fontFamily: "medium", color: Colors.white),
        ),
      ),
    );
  }
}

class ButtonStart extends StatelessWidget {
  const ButtonStart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xffFFC409), borderRadius: BorderRadius.circular(10)),
        height: 45,
        width: 130,
        child: TextButton(
          onPressed: () {
            if (context.read<SlientBell>().thoiGianChay.inSeconds == 0) {
            } else {
              context.read<SlientBell>().chage();
              context.read<SlientBell>().Update();
              context.read<SlientBell>().startTimer();
            }
          },
          child: Text(
            "Start",
            style: TextStyle(
                fontSize: 18, fontFamily: "medium", color: Colors.white),
          ),
        ),
      ),
    );
  }
}
