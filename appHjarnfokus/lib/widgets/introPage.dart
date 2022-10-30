import 'package:apphjarnfokus/provider/introProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get_storage/get_storage.dart';

class introPage extends StatefulWidget {
  introPage({this.title, this.descretion, this.imagek, this.number});
  String? title;
  String? descretion;
  String? imagek;
  int? number;

  @override
  State<introPage> createState() => _introPageState();
}

class _introPageState extends State<introPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (widget.number == 1) {
        Provider.of<introProvier>(context, listen: false).chage();
      } else {
        Provider.of<introProvier>(context, listen: false).Update();
      }
    });
  }
  final introdate = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff3eafc1),
      child: Column(
        children: [
          Container(child: Image.asset(widget.imagek!)),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                    child: Center(
                  child: Text(
                    widget.title!,
                    style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontFamily: 'medium'),
                  ),
                )),
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Text(
                      widget.descretion!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: 'light',
                      ),
                    ),
                  ),
                ),
                context.watch<introProvier>().check == true
                    ? Container()
                    : Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                            Navigator.pushNamed(context, 'Ovningar');
                            introdate.write("displayed", true);
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  height: 41,
                                  width: 138,
                                  child: Center(
                                      child: Text(
                                    "KOM IGÅNG",
                                    style: TextStyle(color: Color(0xff3eafc1)),
                                  )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
