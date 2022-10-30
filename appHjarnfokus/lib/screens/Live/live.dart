import 'package:apphjarnfokus/provider/checkStack.dart';
import 'package:apphjarnfokus/provider/drawerProvider.dart';
import 'package:apphjarnfokus/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:provider/provider.dart';

class Live extends StatefulWidget {
  const Live({Key? key}) : super(key: key);

  @override
  State<Live> createState() => _LiveState();
}

class _LiveState extends State<Live> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<drawerProvider>().k = 3;
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
          leading: IconButton(
            onPressed: () {
              context.read<drawerProvider>().k = 1;
              Provider.of<checkStack>(context,listen: false).Update();
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, size: 35),
          ),
          backgroundColor: Color(0xff50B6C7),
          title: Center(
            child: Text(
              "HJÄRNFOKUS LIVE",
              style: TextStyle(fontSize: 18, fontFamily: 'medium'),
            ),
          ),
        ),
        endDrawer: DrawerOnly(number: 2),
        body: Container(
            child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('youtobe').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          YoutubePlayer(
                            controller: YoutubePlayerController(
                              initialVideoId: data['url']!.split("=")[1],
                              flags: YoutubePlayerFlags(
                                autoPlay: false,
                                mute: false,
                              ),
                            ),
                            liveUIColor: Colors.amber,
                          ),
                          Text(
                            data['name']!,
                            style: TextStyle(fontFamily: 'light', fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
                // ListYoutube,
              );
            }
          },
        )),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
