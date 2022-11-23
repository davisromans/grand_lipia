import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/home_page/home_page_widget.dart';
import 'package:test_app/profile_page/profile_widget.dart';
import 'package:test_app/transaction_page/transaction_widget.dart';

import 'flutter_flow/flutter_flow_theme.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: _getWidget()
        ),
        bottomNavigationBar: FloatingNavbar(
      margin: EdgeInsets.zero,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          onTap: (int val) => setState(() => _index = val),
          currentIndex: _index,
          items: [
            FloatingNavbarItem(icon: Icons.account_circle, title: 'Wasifu'),
            FloatingNavbarItem(icon: Icons.home, title: 'Nyumbani'),
            FloatingNavbarItem(icon: Icons.book, title: 'Miamala'),
          ],
        ),
    );
  }

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
}
