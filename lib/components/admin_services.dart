import 'dart:convert';
import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../Utils/error_handling.dart';
import '../Utils/order.dart';
import '../Utils/product.dart';
import '../Utils/user_provider.dart';
import '../Utils/utils.dart';
import '../screen_navigation_widget.dart';


class sellerRequest {
  bool loadingValue = true;
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
  void makeContract({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required String location,
    required String buyer,
    required String seller,
    required String status,
    required String dealer,
    required String url,
    required String receiver,
    required String buyerImage,
    required String sellerId,
    required String deliveryDate,
    required String terminate,
    required String buyerRating,
    required String sellerRating,
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      _enableLoading(context, loadingValue = true);
      final cloudinary = CloudinaryPublic('dorxkvvvv', 'p2ayj0bu');
      List<String> imageUrls = [];

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: 'Products'),
        );
        imageUrls.add(res.secureUrl);
      }

      Product product = Product(
        name: name,
        description: description,
        location: location,
        images: imageUrls,
        buyer: buyer,
        price: price,
        status: status,
        seller: seller,
        dealer: dealer,
        url: url,
        buyerImage: buyerImage,
        receiver: receiver,
        sellerId: sellerId,
        deliveryDate: deliveryDate,
        terminate: terminate,
        buyerRating: buyerRating,
        sellerRating: sellerRating,
      );

      http.Response res = await http.post(
        Uri.parse('$uri/admin/add-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: product.toJson(),
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          loadingValue = false;
          _enableLoading(context, loadingValue = false);
          showSnackBar(context, 'Umefanikiwa kutengeneza mkataba');
          Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NavigationScreen()));
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

  // get all the products
  Future<List<Product>> fetchAllProducts(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];

    try {
      http.Response res = await http.get(Uri.parse('$uri/admin/get-products'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            productList.add(
              Product.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
          print( jsonDecode(res.body));
        },


      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return productList;
  }

  void deleteProduct({
    required BuildContext context,
    required Product product,
    required VoidCallback onSuccess,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      _enableLoading(context, loadingValue = true);
      http.Response res = await http.post(
        Uri.parse('$uri/admin/delete-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': product.id,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          loadingValue = false;
          _enableLoading(context, loadingValue = false);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NavigationScreen()));
          showSnackBar(context, 'Umefanikiwa kusitisha mkataba');
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
    }
  }




}
