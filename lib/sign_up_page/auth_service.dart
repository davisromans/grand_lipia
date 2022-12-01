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
  bool loadingValue = false;
  showDialogLoading(context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Color(0xFF1A2023),
            content: Row(
              children: [
                Container(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Text("Tafadhali subiri"),
                )
              ],
            ),
          );
        });
  }
  void _enableLoading(context, bool loadingValue) {
    if (loadingValue == true) {
      showDialogLoading(context);

    } else {
      Navigator.pop(context);
    }
  }
  // sign up user
  void signUpUser({
    required BuildContext context,
    required String phone,
    required String password,
    required String name,
  }) async {
    try {
      _enableLoading(context, loadingValue = true);
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
          loadingValue = false;
          _enableLoading(context, loadingValue = false);
          showSnackBar(
            context,
            'Akaunti imetengenezwa kikamilifu!',
          );
        },
        onFailed: (){
          loadingValue = false;
          _enableLoading(context, loadingValue = false);
        }
      );
    } catch (e) {
      loadingValue = false;
      _enableLoading(context, loadingValue = false);
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
      _enableLoading(context, loadingValue = true);
      var req = jsonEncode({
        'phone': phone,
        'password': password,
      });
      var url = '$uri/api/signin';
      print(url);
      print(req);
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
          loadingValue = false;
          _enableLoading(context, loadingValue = false);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          var returnData = jsonDecode(res.body);

          print(returnData);
           prefs.setString('phone', returnData['phone']);
           prefs.setString('name', returnData['name']);
           prefs.setString('id', returnData['_id']);
           var ratings = returnData['ratings'];
          // print(rating.length['rating']);
           if(returnData['images'].length > 0){

             prefs.setString('dp', returnData['images'][0]);
           }else{
             prefs.setString('dp', '');
           }
          double avgRating = 0;
          double totalRating = 0;

          if( returnData['ratings'].length > 0){
          for (int i = 0; i < ratings.length; i++) {
            totalRating +=ratings[i]['rating'];
          }

          if (totalRating != 0) {
            avgRating = totalRating / ratings.length;
            prefs.setString('rating', avgRating.toString());
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        NavigationScreen()));
          }
          }else{
            prefs.setString('rating', '5.0');
         Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      NavigationScreen()));
        }},
          onFailed: (){
        loadingValue = false;
        _enableLoading(context, loadingValue = false);
      }
          );
    } catch (e) {
      loadingValue = false;
      _enableLoading(context, loadingValue = false);
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
}
