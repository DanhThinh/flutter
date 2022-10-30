import 'package:apphjarnfokus/provider/drawerProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:apphjarnfokus/provider/checkStack.dart';

class DrawerOnly extends StatefulWidget {
  DrawerOnly({this.number});
  int? number;

  @override
  State<DrawerOnly> createState() => _DrawerOnlyState();
}

class _DrawerOnlyState extends State<DrawerOnly> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xff3eafc1),
      child: Container(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: 245,
                width: 245,
                child: Image.asset(
                  "images/logo2x.png",
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: Column(
                  children: [
                    Divider(color: Colors.black),
                    Expanded(
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            if (widget.number == 1) {
                              Navigator.of(context).pop();
                            } else {
                              context.read<drawerProvider>().k = 1;
                              Provider.of<checkStack>(context, listen: false)
                                  .Update();
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            }
                          },
                          child: Text(
                            "ÖVNINGAR",
                            style: TextStyle(
                                fontFamily: 'medium',
                                fontSize: 15,
                                color:
                                    context.watch<drawerProvider>().chage(1)),
                          ),
                        ),
                      ),
                    ),
                    Divider(color: Colors.black),
                    Expanded(
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            if (widget.number == 1) {
                              Navigator.pop(context);
                              Navigator.pushNamed(context, 'Om');
                            } else {
                              Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.pushNamed(context, 'Om');
                            }
                          },
                          child: Text(
                            "OM HJÄRNFOKUS",
                            style: TextStyle(
                                fontFamily: 'medium',
                                fontSize: 15,
                                color:
                                    context.watch<drawerProvider>().chage(2)),
                          ),
                        ),
                      ),
                    ),
                    Divider(color: Colors.black),
                    Expanded(
                        child: Center(
                      child: GestureDetector(
                        onTap: () {
                          if (widget.number == 1) {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, 'Live');
                          } else {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.pushNamed(context, 'Live');
                          }
                        },
                        child: Text(
                          "HJÄRNFOKUS LIVE",
                          style: TextStyle(
                              fontFamily: 'medium',
                              fontSize: 15,
                              color: context.watch<drawerProvider>().chage(3)),
                        ),
                      ),
                    )),
                    Divider(color: Colors.black),
                    Expanded(
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            if (widget.number == 1) {
                              Navigator.pop(context);
                              Navigator.pushNamed(context, 'sb');
                            } else {
                              Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.pushNamed(context, 'sb');
                            }
                          },
                          child: Text(
                            "SMAKPROV BOKEN",
                            style: TextStyle(
                                fontFamily: 'medium',
                                fontSize: 15,
                                color:
                                    context.watch<drawerProvider>().chage(4)),
                          ),
                        ),
                      ),
                    ),
                    Divider(color: Colors.black),
                    Expanded(
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            if (widget.number == 1) {
                              Navigator.pop(context);
                              Navigator.pushNamed(context, 'Reminder');
                            } else {
                              Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.pushNamed(context, 'Reminder');
                            }
                          },
                          child: Text(
                            "PÅMINNELSER",
                            style: TextStyle(
                                fontFamily: 'medium',
                                fontSize: 15,
                                color:
                                    context.watch<drawerProvider>().chage(5)),
                          ),
                        ),
                      ),
                    ),
                    Divider(color: Colors.black),
                    Expanded(
                        child: Center(
                      child: GestureDetector(
                        onTap: () {
                          if (widget.number == 1) {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, 'loog');
                          } else {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.pushNamed(context, 'loog');
                          }
                        },
                        child: Text(
                          "LOGG",
                          style: TextStyle(
                              fontFamily: 'medium',
                              fontSize: 15,
                              color: context.watch<drawerProvider>().chage(6)),
                        ),
                      ),
                    )),
                    Divider(color: Colors.black),
                    Expanded(
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            if (widget.number == 1) {
                              Navigator.pop(context);
                              Navigator.pushNamed(context, 'Un');
                            } else {
                              Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.pushNamed(context, 'Un');
                            }
                          },
                          child: Text(
                            "MIN PROFIL",
                            style: TextStyle(
                                fontFamily: 'medium',
                                fontSize: 15,
                                color:
                                    context.watch<drawerProvider>().chage(7)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
