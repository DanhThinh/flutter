import 'package:apphjarnfokus/provider/bell.dart';
import 'package:apphjarnfokus/provider/checkStack.dart';
import 'package:apphjarnfokus/provider/drawerProvider.dart';
import 'package:apphjarnfokus/provider/introProvider.dart';
import 'package:apphjarnfokus/provider/music.dart';
import 'package:apphjarnfokus/provider/remiderProvider.dart';
import 'package:apphjarnfokus/screens/Live/live.dart';
import 'package:apphjarnfokus/screens/MIN%20PROFIL/Subscription.dart';
import 'package:apphjarnfokus/screens/MIN%20PROFIL/Unsubscribed.dart';
import 'package:apphjarnfokus/screens/OVNINGAR/ovningar.dart';
import 'package:apphjarnfokus/screens/Reminder/LocalNotifyManager.dart';
import 'package:apphjarnfokus/screens/Reminder/Reminder.dart';
import 'package:apphjarnfokus/screens/logg/histories.dart';
import 'package:apphjarnfokus/screens/omHjarn/Om%20HjarnFokus.dart';
import 'package:apphjarnfokus/screens/sb/SMAKPROV%20BOKEN.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:apphjarnfokus/screens/intro/intro.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:apphjarnfokus/widgets/history.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';

void main() async {
  await GetStorage.init();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(HistoryAdapter());
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => checkStack()),
      ChangeNotifierProvider(create: (_) => Music()),
      ChangeNotifierProvider(create: (_) => remiderProvider()),
      ChangeNotifierProvider(create: (_) => SlientBell()),
      ChangeNotifierProvider(create: (_) => introProvier()),
      ChangeNotifierProvider(create: (_) => drawerProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    initialization();
    super.initState();
    introdata.writeIfNull("displayed", false);
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
  }

  final introdata = GetStorage();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: introdata.read("displayed") ? OVNINGAR() : intro(),
      routes: {
        'Ovningar': (BuildContext context) => OVNINGAR(),
        'Om': (BuildContext context) => OM(),
        'Live': (BuildContext context) => Live(),
        'sb': (BuildContext context) => SB(),
        'Reminder': (BuildContext context) => Reminder(),
        'loog': (BuildContext context) => Histories(),
        'Un': (BuildContext context) => Un(),
        'Su': (BuildContext context) => SU()
      },
    );
  }
}
