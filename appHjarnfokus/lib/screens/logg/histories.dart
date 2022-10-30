import 'package:apphjarnfokus/provider/checkStack.dart';
import 'package:apphjarnfokus/provider/drawerProvider.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:apphjarnfokus/widgets/drawer.dart';
import 'package:provider/provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class Histories extends StatefulWidget {
  const Histories({Key? key}) : super(key: key);

  @override
  State<Histories> createState() => _HistoriesState();
}

class _HistoriesState extends State<Histories> {
  String dropdownValue = 'Filter';
  String? ke;
  DateTime k(String s) {
    DateTime o = DateTime.now();
    if (s == "Filter" || s == "ALL") {
      DateTime t =
          new DateTime(o.year - 10, o.month, o.day, o.hour, o.minute, o.second);
      return t;
    } else {
      if (s == "2 Days Ago") {
        DateTime t = new DateTime(
            o.year, o.month, o.day - 2, o.hour, o.minute, o.second);
        return t;
      } else {
        if (s == "1 Month Ago") {
          DateTime t = new DateTime(
              o.year, o.month - 1, o.day, o.hour, o.minute, o.second);
          return t;
        } else {
          if (s == "2 Month Ago") {
            DateTime t = new DateTime(
                o.year, o.month - 2, o.day, o.hour, o.minute, o.second);
            return t;
          } else {
            DateTime t = new DateTime(
                o.year - 10, o.month, o.day, o.hour, o.minute, o.second);
            return t;
          }
        }
      }
    }
  }

  List<String> items = ['ALL', '2 Days Ago', '1 Month Ago', '2 Months Ago'];

  @override
  void initState() {
    // TODO: implement initState
    context.read<drawerProvider>().k = 6;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Provider.of<checkStack>(context, listen: false).Update();
        context.read<drawerProvider>().k = 1;
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff3eafc1),
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Container()),
                Expanded(
                  flex: 15,
                  child: Center(child: Text('Log History')),
                ),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Hive.box("history").clear();
                    });
                  },
                  child: Icon(Icons.delete, size: 30),
                ))
              ],
            ),
          ),
          leading: Padding(
              padding: EdgeInsets.all(0),
              child: IconButton(
                onPressed: () {
                  context.read<drawerProvider>().k = 1;
                  Provider.of<checkStack>(context, listen: false).Update();
                  Navigator.of(context, rootNavigator: true).pop(context);
                },
                icon: Icon(Icons.arrow_back_outlined),
              )),
        ),
        endDrawer: DrawerOnly(number: 2),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 36,
                      width: 112,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(color: Colors.black)),
                      child: Center(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            buttonHeight: 36,
                            buttonWidth: 150,
                            dropdownWidth: 184,
                            iconSize: 0,
                            hint: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                dropdownValue != null
                                    ? Text(
                                        dropdownValue,
                                        style: TextStyle(
                                            fontSize: 15, fontFamily: 'medium'),
                                      )
                                    : Text(
                                        'Filter',
                                        style: TextStyle(
                                            fontSize: 15, fontFamily: 'medium'),
                                      ),
                              ],
                            ),
                            items: items
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                            fontSize: 15, fontFamily: 'light'),
                                      ),
                                    ))
                                .toList(),
                            value: ke,
                            onChanged: (value) {
                              setState(() {
                                dropdownValue = value as String;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 8,
                child: FutureBuilder(
                  future: Hive.openBox('history'),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError)
                        return Text(snapshot.error.toString());
                      else {
                        return WatchBoxBuilder(
                          box: Hive.box('history'),
                          builder: (context, historiesBox) {
                            return ListView.builder(
                                itemCount: historiesBox.length,
                                itemBuilder: (BuildContext context, int index) {
                                  int len = historiesBox.length;
                                  final his =
                                      historiesBox.getAt(len - index - 1);
                                  DateTime a = k(dropdownValue);
                                  DateTime b = DateTime.parse(his.time);
                                  bool check = a.isBefore(b);
                                  if (check) {
                                    return Padding(
                                      padding: EdgeInsets.all(13),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: ExpansionTile(
                                          iconColor: Color(0xff3eafc1),
                                          textColor: Colors.white,
                                          collapsedTextColor: Colors.white,
                                          subtitle: Text(
                                            his.time,
                                            style: TextStyle(
                                                fontFamily: 'light',
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                          collapsedIconColor: Color(0xff3eafc1),
                                          backgroundColor: Color(0xff3eafc1),
                                          collapsedBackgroundColor:
                                              Color(0xff3eafc1),
                                          title: Text(
                                            his.name,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontFamily: 'medium'),
                                          ),
                                          children: [
                                            Divider(
                                              color: Colors.white,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(10),
                                              child: ListTile(
                                                title: Text(
                                                  his.feel,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Container();
                                  }
                                });
                          },
                        );
                      }
                    } else
                      return Scaffold();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
