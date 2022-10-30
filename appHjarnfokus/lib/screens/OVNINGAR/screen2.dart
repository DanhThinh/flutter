import 'package:apphjarnfokus/provider/music.dart';
import 'package:flutter/material.dart';
import 'package:apphjarnfokus/widgets/drawer.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:apphjarnfokus/provider/checkStack.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  AudioPlayer playMusic = AudioPlayer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Hive.openBox('history');
    Provider.of<Music>(context, listen: false).lisDura();
    Provider.of<Music>(context, listen: false).lisPosi();
    Provider.of<Music>(context, listen: false).lisCom(context);
  }

  Future<void> setnh(bool k) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("btnhis", k);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff3eafc1),
      endDrawer: DrawerOnly(number: 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff3eafc1),
        title: Center(child: Text(context.read<Music>().name)),
        leading: Padding(
            padding: EdgeInsets.all(0),
            child: IconButton(
              onPressed: () {
                context.read<checkStack>().change();
              },
              icon: Icon(Icons.arrow_drop_down_circle_outlined),
            )),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 8,
              child: Container(
                child: Center(
                  child: Container(
                    child: Image.asset(context.read<Music>().image),
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        context.read<Music>().name,
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        context.read<Music>().des,
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                )),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              context
                                  .watch<Music>()
                                  .position
                                  .toString()
                                  .split(".")[0],
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      )),
                      Expanded(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                context
                                    .watch<Music>()
                                    .duration
                                    .toString()
                                    .split(".")[0],
                                style: TextStyle(color: Colors.white70),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0),
              ),
              child: Slider(
                inactiveColor: Colors.black26,
                activeColor: Colors.white,
                value: context.watch<Music>().position.inSeconds.toDouble(),
                min: 0.0,
                max: context.watch<Music>().duration.inSeconds.toDouble() + 0.5,
                onChanged: (double value) {
                  setState(() {
                    Duration newDuration = Duration(seconds: value.toInt());
                    context.read<Music>().seek(newDuration);
                    value = value;
                  });
                },
              ),
            )),
            Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextButton(
                        onPressed: () {
                          if (Provider.of<Music>(context, listen: false)
                                      .position -
                                  Duration(seconds: 15) >
                              Duration(seconds: 0)) {
                            setState(() {
                              Duration newDuration =
                                  Provider.of<Music>(context, listen: false)
                                          .position -
                                      Duration(seconds: 15);
                              context.read<Music>().seek(newDuration);
                            });
                          } else {
                            setState(() {
                              Duration newDuration = Duration(seconds: 0);
                              context.read<Music>().seek(newDuration);
                            });
                          }
                        },
                        child: Image.asset("images/back15.png")),
                    TextButton(
                        onPressed: () {
                          if (Provider.of<checkStack>(context, listen: false)
                                  .hienThi ==
                              false) {
                            Provider.of<checkStack>(context, listen: false)
                                .ok();
                          }
                          Provider.of<Music>(context, listen: false)
                              .chagePlayMusic();
                          Provider.of<Music>(context, listen: false).btnPlay ==
                                  true
                              ? context.read<Music>().Play()
                              : context.read<Music>().pause();
                        },
                        child: Provider.of<Music>(context, listen: false)
                                    .btnPlay ==
                                false
                            ? Image.asset("images/play.png")
                            : Image.asset("images/pause.png")),
                    TextButton(
                        onPressed: () {
                          if (Provider.of<Music>(context, listen: false)
                                      .position +
                                  Duration(seconds: 15) <
                              Provider.of<Music>(context, listen: false)
                                  .duration) {
                            setState(() {
                              Duration newDuration =
                                  Provider.of<Music>(context, listen: false)
                                          .position +
                                      Duration(seconds: 15);
                              context.read<Music>().seek(newDuration);
                            });
                          } else {
                            setState(() {
                              Duration newDuration = Duration(seconds: 0);
                              context.read<Music>().seek(newDuration);
                            });
                          }
                        },
                        child: Image.asset("images/forward15.png")),
                  ],
                )),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Checkbox(
                      value: Provider.of<Music>(context, listen: false).btnhis,
                      onChanged: (bool? value) {
                        setState(() {
                          Provider.of<Music>(context, listen: false).btnhis =
                              value!;
                          setnh(value);
                        });
                      }),
                  Text(
                    "Lägg till i loggen",
                    style: TextStyle(color: Colors.white),
                  ),
                  Expanded(
                      child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              context.read<checkStack>().change();
                            },
                            child: Image.asset("images/list-practice-icon.png"))
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
