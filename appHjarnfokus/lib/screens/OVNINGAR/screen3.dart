import 'package:apphjarnfokus/provider/checkStack.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:apphjarnfokus/provider/music.dart';

class Screen3 extends StatefulWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Color(0xff3eafc1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: TextButton(
                  onPressed: () {
                    if (Provider.of<Music>(context, listen: false).url != "") {
                      Provider.of<Music>(context, listen: false)
                          .chagePlayMusic();
                    }
                    Provider.of<Music>(context, listen: false).btnPlay == true
                        ? context.read<Music>().Play()
                        : context.read<Music>().pause();
                  },
                  child: Provider.of<Music>(context, listen: false).btnPlay ==
                          false
                      ? Image.asset(
                          "images/play.png",
                          height: 40,
                          width: 40,
                        )
                      : Image.asset(
                          "images/pause.png",
                          height: 40,
                          width: 40,
                        )),
            ),
            Expanded(
              flex: 4,
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0),
                ),
                child: Slider(
                  activeColor: Colors.white,
                  inactiveColor: Colors.black38,
                  value: context.watch<Music>().position.inSeconds.toDouble(),
                  min: 0.0,
                  max: context.watch<Music>().duration.inSeconds.toDouble() +
                      0.5,
                  onChanged: (double value) {
                    if (Provider.of<Music>(context, listen: false).url != "") {
                      context.read<checkStack>().change();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
