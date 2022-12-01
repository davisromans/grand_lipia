import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_app/Utils/utils.dart';

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
   VoidCallback? onFailed,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackBar(context, jsonDecode(response.body)['msg']);
      print(jsonDecode(response.body)['msg']);
      onFailed!();
      break;
    case 500:
      showSnackBar(context, jsonDecode(response.body)['error']);
      print(jsonDecode(response.body)['error']);
      onFailed!();
      break;
    default:
      showSnackBar(context, response.body);
  }
}


