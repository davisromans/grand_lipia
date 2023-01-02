import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/index.dart';
import 'package:test_app/screen_navigation_widget.dart';
import 'Utils/user_provider.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterFlowTheme.initialize();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child:  MyApp()));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  bool logged_in = false;
  Locale? _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;
  bool displaySplashImage = true;

  _checkFirstUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var logged_in_data = prefs.getBool('logged_in');
    print(prefs.getBool('logged_in'));

    if (logged_in_data == true) {
      setState(() {
        logged_in = true;
      });

    } else {
        setState(() {
          logged_in = false;
        });
    }
  }

  @override
  void initState() {
    _checkFirstUser();
    super.initState();

    Future.delayed(
        Duration(seconds: 1), () => setState(() => displaySplashImage = false));
  }

  void setLocale(Locale value) => setState(() => _locale = value);
  void setThemeMode(ThemeMode mode) => setState(() {
    _themeMode = mode;
    FlutterFlowTheme.saveThemeMode(mode);
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Senero',

      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      locale: _locale,
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(brightness: Brightness.light,
        textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.white, //thereby
      ),),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: _themeMode,
      home: displaySplashImage
          ? Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Builder(
          builder: (context) => Image.asset(
            'assets/images/lipia.png',
            fit: BoxFit.contain,
          ),
        ),
      )
          :logged_in == true?NavigationScreen():LoginPageWidget(),
    );
  }
}
