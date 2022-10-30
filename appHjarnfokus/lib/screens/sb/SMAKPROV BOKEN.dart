import 'package:apphjarnfokus/provider/drawerProvider.dart';
import 'package:apphjarnfokus/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:provider/provider.dart';
import 'package:apphjarnfokus/provider/checkStack.dart';

class SB extends StatefulWidget {
  const SB({Key? key}) : super(key: key);

  @override
  State<SB> createState() => _SBState();
}

class _SBState extends State<SB> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<drawerProvider>().k = 4;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async{
          context.read<drawerProvider>().k = 1;
          Provider.of<checkStack>(context,listen: false).Update();
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                context.read<drawerProvider>().k = 1;
                Provider.of<checkStack>(context, listen: false).Update();
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, size: 35),
            ),
            elevation: 0,
            backgroundColor: Color(0xff3eafc1),
            title: Center(child: Text("")),
          ),
            endDrawer: DrawerOnly(number: 2),
            body: SfPdfViewer.asset('assets/Hjarnfokus_Johan_Bergstaf.pdf')),
      ),
    );
  }
}
