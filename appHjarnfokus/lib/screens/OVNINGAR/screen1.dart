import 'package:apphjarnfokus/provider/music.dart';
import 'package:apphjarnfokus/screens/OVNINGAR/screen3.dart';
import 'package:apphjarnfokus/screens/Slientbell/SlientBell.dart';
import 'package:flutter/material.dart';
import 'package:apphjarnfokus/widgets/drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:apphjarnfokus/provider/checkStack.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future getData() async {
    QuerySnapshot qn =
        await FirebaseFirestore.instance.collection("listMusic").get();
    return qn.docs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff3eafc1),
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Övningar",
                style: TextStyle(
                    fontSize: 28, color: Colors.white, fontFamily: "medium"),
              ),
              Text("För en fokuserad vardag",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 17,
                      fontFamily: "medium")),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
      endDrawer: DrawerOnly(
        number: 1,
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: context.read<checkStack>().hienThi
                ? MediaQuery.of(context).size.height
                : MediaQuery.of(context).size.height - 100,
            child: FutureBuilder(
              future: getData(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      if (index == snapshot.data.length - 1) {
                        return Padding(
                          padding: EdgeInsets.all(5),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) => Bell()));
                            },
                            child: Container(
                              height: 110,
                              width: 350,
                              color: Color(0xffe9f3f5),
                              child: Text("Slient Bell"),
                            ),
                          ),
                        );
                      }
                      return Padding(
                        padding: EdgeInsets.all(5),
                        child: GestureDetector(
                          onTap: () {
                            context.read<checkStack>().change();
                            String n = snapshot.data[index]['name'];
                            String d = snapshot.data[index]['description'];
                            String i = snapshot.data[index]['image'];
                            String u = snapshot.data[index]['url'];
                            if (n !=
                                Provider.of<Music>(context, listen: false)
                                    .name) {
                              context.read<Music>().Chage(n, i, d, u);
                              context.read<Music>().Stop();
                              context.read<Music>().updata();
                              context.read<Music>().setUrl();
                            }
                          },
                          child: Container(
                            width: 350,
                            height: 110,
                            decoration: BoxDecoration(
                                color: Color(0xffe9f3f5),
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  width: 60,
                                  height: 60,
                                  child: Image.asset(
                                      snapshot.data[index]['image']),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data[index]["name"],
                                        style:
                                            TextStyle(color: Color(0xff378591)),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        snapshot.data[index]['description'],
                                        style:
                                            TextStyle(color: Color(0xff95bfc6)),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          Selector<checkStack, bool>(
            selector: (buildcontext, checkStack) => checkStack.check,
            builder: (context, data, child) {
              return Visibility(
                visible: context.watch<checkStack>().hienThi ? true : false,
                child: Positioned(
                    bottom: 0,
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    child: Screen3()),
              );
            },
          ),
        ],
      ),
    );
  }
}
