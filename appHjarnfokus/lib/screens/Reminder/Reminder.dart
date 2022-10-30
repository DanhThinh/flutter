import 'package:apphjarnfokus/provider/checkStack.dart';
import 'package:apphjarnfokus/provider/drawerProvider.dart';
import 'package:apphjarnfokus/provider/remiderProvider.dart';
import 'package:apphjarnfokus/screens/Reminder/LocalNotifyManager.dart';
import 'package:apphjarnfokus/widgets/drawer.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Reminder extends StatefulWidget {
  const Reminder({Key? key}) : super(key: key);

  @override
  State<Reminder> createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tz.initializeTimeZones();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<drawerProvider>().k = 5;
    });
  }

  Future<void> setGroupRadio(String k) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("groupradio", k);
  }

  Future<void> setValue1(String k) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("value1", k);
  }

  Future<void> setValue2(String k) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("value2", k);
  }

  Future<void> checkCancel(bool k) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("checkCan", k);
  }

  List<String> items = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
  ];

  // String? groupRadio;
  // String? dropdownValue1;
  // String dropdownValue2 = "0";
  bool rung = true;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<drawerProvider>().k = 1;
        Provider.of<checkStack>(context, listen: false).Update();
        return true;
      },
      child: Scaffold(
        endDrawer: DrawerOnly(number: 2),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: AppBar(
            leading: IconButton(
              onPressed: () {
                context.read<drawerProvider>().k = 1;
                Provider.of<checkStack>(context, listen: false).Update();
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, size: 35),
            ),
            backgroundColor: Color(0xff50B6C7),
            elevation: 0,
            title: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Reminder",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  FlutterSwitch(
                      toggleSize: 20,
                      activeColor: Colors.white,
                      activeToggleColor: Color(0xff50B6C7),
                      width: 50,
                      height: 25,
                      value: context.watch<remiderProvider>().check,
                      onToggle: (value) {
                        checkCancel(value);
                        if (value == false) {
                          NotificationService().cancelAllNotifications();
                        }
                        context.read<remiderProvider>().chage();
                      }),
                ],
              ),
            ),
          ),
        ),
        body: Container(
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          child: Row(
                            children: [
                              SizedBox(width: 20),
                              Expanded(
                                child: Text(
                                  "Frequent",
                                  style: TextStyle(
                                      fontSize: 18, fontFamily: "light"),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Radio(
                                        value: "30",
                                        groupValue:
                                            Provider.of<remiderProvider>(
                                                    context,
                                                    listen: false)
                                                .groupRadio,
                                        onChanged: (value) {
                                          setState(() {
                                            Provider.of<remiderProvider>(
                                                    context,
                                                    listen: false)
                                                .groupRadio = value.toString();
                                            setGroupRadio(value.toString());
                                          });
                                        }),
                                    Text("30m"),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Radio(
                                        value: "60",
                                        groupValue:
                                            Provider.of<remiderProvider>(
                                                    context,
                                                    listen: false)
                                                .groupRadio,
                                        onChanged: (value) {
                                          setState(() {
                                            Provider.of<remiderProvider>(
                                                    context,
                                                    listen: false)
                                                .groupRadio = value.toString();
                                            setGroupRadio(value.toString());
                                          });
                                        }),
                                    Text("1h"),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Radio(
                                        value: "120",
                                        groupValue:
                                            Provider.of<remiderProvider>(
                                                    context,
                                                    listen: false)
                                                .groupRadio,
                                        onChanged: (value) {
                                          setState(() {
                                            Provider.of<remiderProvider>(
                                                    context,
                                                    listen: false)
                                                .groupRadio = value.toString();
                                            setGroupRadio(value.toString());
                                          });
                                        }),
                                    Text("2h"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: EdgeInsets.all(26),
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Strat Hour",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontFamily: "light"),
                                            ),
                                            Container(
                                              height: 42,
                                              width: 143,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.black)),
                                              child: Center(
                                                child:
                                                    DropdownButtonHideUnderline(
                                                  child: DropdownButton2(
                                                    hint: Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 30,
                                                        ),
                                                        Text(Provider.of<
                                                                    remiderProvider>(
                                                                context,
                                                                listen: false)
                                                            .value1)
                                                      ],
                                                    ),
                                                    items: items
                                                        .map((item) =>
                                                            DropdownMenuItem<
                                                                String>(
                                                              value: item,
                                                              child: Row(
                                                                children: [
                                                                  SizedBox(
                                                                    width: 30,
                                                                  ),
                                                                  Text(
                                                                    item,
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        fontFamily:
                                                                            'medium'),
                                                                  ),
                                                                ],
                                                              ),
                                                            ))
                                                        .toList(),
                                                    value: Provider.of<
                                                                remiderProvider>(
                                                            context,
                                                            listen: false)
                                                        .value1,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        Provider.of<remiderProvider>(
                                                                    context,
                                                                    listen: false)
                                                                .value1 =
                                                            value.toString();
                                                        setValue1(
                                                            value.toString());
                                                      });
                                                    },
                                                    buttonHeight: 40,
                                                    buttonWidth: 140,
                                                    itemHeight: 40,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "End Hour",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontFamily: "light"),
                                            ),
                                            Container(
                                              height: 42,
                                              width: 143,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.black)),
                                              child: Center(
                                                child:
                                                    DropdownButtonHideUnderline(
                                                  child: DropdownButton2(
                                                    hint: Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 30,
                                                        ),
                                                        Text(Provider.of<
                                                                    remiderProvider>(
                                                                context,
                                                                listen: false)
                                                            .value2)
                                                      ],
                                                    ),
                                                    items: items
                                                        .map((item) =>
                                                            DropdownMenuItem<
                                                                String>(
                                                              value: item,
                                                              child: Row(
                                                                children: [
                                                                  SizedBox(
                                                                    width: 30,
                                                                  ),
                                                                  Text(
                                                                    item,
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        fontFamily:
                                                                            'medium'),
                                                                  ),
                                                                ],
                                                              ),
                                                            ))
                                                        .toList(),
                                                    value: Provider.of<
                                                                remiderProvider>(
                                                            context,
                                                            listen: false)
                                                        .value2,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        Provider.of<remiderProvider>(
                                                                    context,
                                                                    listen: false)
                                                                .value2 =
                                                            value.toString();
                                                        setValue2(
                                                            value.toString());
                                                      });
                                                    },
                                                    buttonHeight: 40,
                                                    buttonWidth: 140,
                                                    itemHeight: 40,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      FlutterSwitch(
                                          toggleSize: 20,
                                          activeColor: Color(0xff40B1C3),
                                          activeToggleColor: Colors.white,
                                          width: 50,
                                          height: 25,
                                          value: rung,
                                          onToggle: (value) {
                                            setState(() {
                                              rung = value;
                                            });
                                          }),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xff3EAFC1),
                                  borderRadius: BorderRadius.circular(15)),
                              height: 42,
                              width: 308,
                              child: TextButton(
                                child: Text(
                                  "SAVE",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () {
                                  int s = 0;
                                  s = int.parse(Provider.of<remiderProvider>(
                                              context,
                                              listen: false)
                                          .value2) -
                                      int.parse(Provider.of<remiderProvider>(
                                              context,
                                              listen: false)
                                          .value1);
                                  if (Provider.of<remiderProvider>(context,
                                                  listen: false)
                                              .check ==
                                          true &&
                                      s > 0) {
                                    if (s < 0) {
                                      s = s + 24;
                                    }
                                    int tGian = int.parse(
                                        Provider.of<remiderProvider>(context,
                                                listen: false)
                                            .groupRadio);
                                    print(tGian);
                                    double lap = (s * 60) / tGian;
                                    print(lap);
                                    for (int i = 0; i <= lap.toInt(); i++) {
                                      int a = DateTime.now().hour;
                                      int b = DateTime.now().minute + 1;
                                      int c = i * tGian;
                                      while (c >= 60) {
                                        c = c - 60;
                                        b = b + 1;
                                      }
                                      while (b >= 60) {
                                        b = b - 60;
                                        a = a + 1;
                                      }
                                      if (a > 24) {
                                        a = a - 24;
                                      }
                                      print(a);
                                      print(b);
                                      print(c);
                                      if (i == 0) {
                                        NotificationService().showWeek(
                                            i,
                                            "Bắt đầu luyện tập",
                                            "ahihi",
                                            a,
                                            b,
                                            c);
                                      } else {
                                        if (i == lap.toInt()) {
                                          NotificationService().showWeek(
                                              i,
                                              "kết thúc luyện tập",
                                              "ahuhu",
                                              a,
                                              b,
                                              c);
                                        } else {
                                          NotificationService().showWeek(
                                              i, "Lặp lần $i", "huhu", a, b, c);
                                        }
                                      }
                                    }
                                    Fluttertoast.showToast(
                                        msg: "thiết lập thành công",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.blue,
                                        textColor: Colors.black,
                                        fontSize: 16.0);
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "thiết lập lại",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.blue,
                                        textColor: Colors.black,
                                        fontSize: 16.0);
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(flex: 3, child: Container()),
                    ],
                  ))
                ],
              ),
              Visibility(
                visible: context.watch<remiderProvider>().check ? false : true,
                child: Container(
                  color: Colors.white.withOpacity(0.5),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
