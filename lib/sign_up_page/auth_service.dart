import 'dart:convert';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/Utils/product.dart';
import 'package:test_app/screen_navigation_widget.dart';
import '../Utils/error_handling.dart';
import '../Utils/user.dart';
import '../Utils/user_provider.dart';
import '../Utils/utils.dart';


class AuthService {
  // sign up user
  void signUpUser({
    required BuildContext context,
    required String phone,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        password: password,
        phone: phone,
        type: '',
        token: '',
        address: '',
      );

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          print('$uri/api/signup');
          showSnackBar(
            context,
            'Akaunti imetengenezwa kikamilifu!',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e.toString());
    }
  }

  // sign in user
  void signInUser({
    required BuildContext context,
    required String phone,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({
          'phone': phone,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          var returnData = jsonDecode(res.body);
          print(returnData);
           prefs.setString('phone', returnData['phone']);
           prefs.setString('name', returnData['name']);
           prefs.setString('id', returnData['_id']);
           if(returnData['images'].length > 0){
             print('inapita');
             prefs.setString('dp', returnData['images'][0]);
           }else{
             prefs.setString('dp', '');
           }
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      NavigationScreen()));
        }
          );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }


  // get user data
  void getUserData(
    BuildContext context,
  ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      if (token == null) {
        prefs.setString('x-auth-token', '');
      }
      var tokenRes = await http.post(
        Uri.parse('$uri/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!
        },
      );

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse('$uri/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
        );

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }


  void saveUserAddress({
    required BuildContext context,
    required String address,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/save-user-address'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'address': address,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          User user = userProvider.user.copyWith(
            address: jsonDecode(res.body)['address'],
          );

          userProvider.setUserFromModel(user);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
