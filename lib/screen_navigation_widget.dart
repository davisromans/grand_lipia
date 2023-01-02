import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app/home_page/home_page_widget.dart';
import 'package:test_app/profile_page/profile_widget.dart';
import 'package:test_app/transaction_page/transaction_widget.dart';
import 'package:cool_alert/cool_alert.dart';
import 'flutter_flow/flutter_flow_theme.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _index = 1;
  final _pageController = PageController(initialPage: 1);
  int maxCount = 5;

  _logOut() {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () =>
        CoolAlert.show(
          context: context,
          type: CoolAlertType.confirm,
          title: "Angalizo!",
          text: "Una uhakika unataka kutoka",
          confirmBtnText: "Ndio",
          cancelBtnText:"Hapana",

          confirmBtnColor: Colors.orange,
          onConfirmBtnTap: _logOut,
        ).then((value) => value ?? false),
    child: Scaffold(
        body: Container(
          child: _getWidget()
        ),
        bottomNavigationBar: FloatingNavbar(
      margin: EdgeInsets.zero,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          onTap: (int val) => setState(() => _index = val),
          currentIndex: _index,
          borderRadius: 0,
          fontSize: 1,
          iconSize: 28,
          items: [
            FloatingNavbarItem(icon: Icons.account_circle, title: ''),
            FloatingNavbarItem(icon: Icons.home, title: '',),
            FloatingNavbarItem(icon: Icons.book, title: ''),
          ],
        ),

    ));}

  Widget _getWidget() {
    switch (_index) {
      case 0:
        return ProfileWidget();
      case 1:
        return HomePageWidget();
      default:
        return TransactionWidget();
    }
  }

  final List<Widget> bottomBarPages = [
    const ProfileWidget(),
    const HomePageWidget(),
    const TransactionWidget(),
    const HomePageWidget(),
    const TransactionWidget(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
