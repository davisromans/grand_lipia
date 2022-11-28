import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_alert/flutter_platform_alert.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/Utils/product.dart';
import 'package:test_app/components/terminate_widget.dart';
import '../Utils/error_handling.dart';
import '../Utils/utils.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import '../components/admin_services.dart';
import 'package:http/http.dart' as http;
import 'package:date_format/date_format.dart';

import '../flutter_flow/flutter_flow_util.dart';
import '../screen_navigation_widget.dart';

class ContractInfoWidget extends StatefulWidget {
  const ContractInfoWidget(
      {Key? key,
      this.Name,
      this.Specs,
      this.Amount,
      this.Location,
      this.Image,
      this.Seller,
        this.Dealer,
        this.Id,
        this.Url,
        this.Status,
        this.buyerImage,
        this.receiver,
        this.sellerId,
      this.Buyer})
      : super(
          key: key,
        );
  final Name;
  final Specs;
  final Amount;
  final Location;
  final Image;
  final Buyer;
  final Seller;
  final Id;
  final Dealer;
  final Url;
  final buyerImage;
  final Status;
  final receiver;
  final sellerId;

  @override
  _ContractInfoWidgetState createState() => _ContractInfoWidgetState();
}

class _ContractInfoWidgetState extends State<ContractInfoWidget>
    with TickerProviderStateMixin {
  TextEditingController productName = TextEditingController();
  TextEditingController productSpecs = TextEditingController();
  TextEditingController productPrice = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController buyer = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  List images = [];
  var userPhone;
  bool isSeller = false;
  List<Product>? products;
  final sellerRequest adminServices = sellerRequest();
  var id;
  var sellerName;
  var dpBuyer;
  var dpSeller;
  var status;
  var receiver;
  var sellerId;
  var userId;
  var type;
  var selectedDate;
  var _setDate;
  var _setTime;
  var _hour, _minute, _time;
  var dateTime;
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);
  var deliveryDate;
  fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }

  final animationsMap = {
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(-100, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'textFieldOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(100, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(-100, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'textFieldOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(100, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'textOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(-100, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'textFieldOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(100, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'textOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(-100, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'textFieldOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(100, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'textOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(-100, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(100, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'buttonOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(-100, -100),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };


   deleteProduct() async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/admin/delete-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'id': id,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NavigationScreen()));
          showSnackBar(context, 'Umefanikiwa kusitisha mkataba');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> userRating() async {
    print(_ratingValue);
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/rate-user'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'id': widget.sellerId,
          'rating' : _ratingValue,
          'userId' : userId,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'asante kwa kufanya biashara nasi');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> activeContract() async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/admin/activate-contract'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'id': id,
          'status': 'Imekubaliwa',
          'deliveryDate': deliveryDate
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NavigationScreen()));
          showSnackBar(context, 'Mkataba umekubaliwa');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  getType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userPhone = prefs.getString('phone');
    userId = prefs.getString('id');
    if (userPhone == widget.Buyer) {
      buyer.text = widget.Seller;
      setState(() {
        isSeller = true;
        type = 'buyer';
      });
    } else {
      buyer.text = widget.Buyer;
      setState(() {
        isSeller = false;
        type = 'seller';
      });
    }
  }


  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
    getType();
    setState(() {
      productName.text = widget.Name;
      productSpecs.text = widget.Specs;
      productPrice.text = widget.Amount.toString();
      location.text = widget.Location;
      images = widget.Image;
      id = widget.Id;
      sellerName = widget.Dealer;
      dpBuyer = widget.Url;
      dpSeller = widget.buyerImage;
      status = widget.Status;
      receiver = widget.receiver;
    });
    fetchAllProducts();
  }

  double? _ratingValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        leading: new IconButton(
          icon: new Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        titleSpacing: -10,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
          child: Text(
            'Mkataba',
            style: FlutterFlowTheme.of(context).bodyText2.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        toolbarHeight: 42,
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Color(0xFF272727),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        spreadRadius: 1,
                        blurRadius: 0,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white70,
                                spreadRadius: 2,
                                blurRadius: 5,
                              ),
                            ],
                            color: Color(0xFFEEEEEE),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                isSeller?
                                dpBuyer: dpSeller,
                              ),
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15, 19, 0, 0),
                                    child: Text(
                                      userPhone == widget.Buyer?sellerName:receiver,
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15, 4, 0, 0),
                                          child: RatingBar(
                                              initialRating: 0,
                                              ignoreGestures: true,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemSize: 20,
                                              glow: true,
                                              glowColor: Colors.white,
                                              glowRadius: 2,
                                              ratingWidget: RatingWidget(
                                                  full: const Icon(Icons.star,
                                                      color:  Colors.lightGreen),
                                                  half: const Icon(
                                                    Icons.star_half,
                                                    color:  Colors.lightGreen,
                                                  ),
                                                  empty: const Icon(
                                                    Icons.star_outline,
                                                    color:  Colors.lightGreen,
                                                  )),
                                              onRatingUpdate: (value) {
                                                setState(() {
                                                  _ratingValue = value;
                                                });
                                              }),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  6, 6, 0, 0),
                                          child: Text(
                                            _ratingValue != null
                                                ? _ratingValue.toString()
                                                : 'No rating yet!',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ).animated([animationsMap['textOnPageLoadAnimation3']!]),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 20, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                          Text(
                            'Jina la bidhaa au huduma',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: 'Outfit',
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  fontSize: 14,
                                ),
                          ).animated(
                              [animationsMap['textOnPageLoadAnimation1']!]),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                    child: TextFormField(
                      controller: productName,
                      autofocus: true,
                      obscureText: false,
                      readOnly: true,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Outfit',
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                    ).animated(
                        [animationsMap['textFieldOnPageLoadAnimation1']!]),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 15, 0, 0),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                          child: Text(
                            'Maelezo ya bidhaa au huduma',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: 'Outfit',
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  fontSize: 14,
                                ),
                          ).animated(
                              [animationsMap['textOnPageLoadAnimation2']!]),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                    child: TextFormField(
                      controller: productSpecs,
                      readOnly: true,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Outfit',
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                      maxLines: 10,
                      keyboardType: TextInputType.multiline,
                    ).animated(
                        [animationsMap['textFieldOnPageLoadAnimation2']!]),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                          child: Text(
                            'Kiasi',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: 'Outfit',
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  fontSize: 14,
                                ),
                          ).animated(
                              [animationsMap['textOnPageLoadAnimation3']!]),
                        ),
                      ],
                    ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                    child: TextFormField(
                      controller: productPrice,
                      readOnly: true,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Outfit',
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                      keyboardType: TextInputType.number,
                    ).animated(
                        [animationsMap['textFieldOnPageLoadAnimation3']!]),
                  ),
                ],
              ),
              Column(
                children: [
               Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 15, 0, 0),
                          child: Text(
                            'Eneo la kuwasilisha',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: 'Outfit',
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  fontSize: 14,
                                ),
                          ).animated(
                              [animationsMap['textOnPageLoadAnimation4']!]),
                        ),
                      ],
                    ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                    child: TextFormField(
                      controller: location,
                      readOnly: true,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Outfit',
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                    ).animated(
                        [animationsMap['textFieldOnPageLoadAnimation4']!]),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 20, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                          child: Text(
                            isSeller == true?'Namba ya muuzaji':'Namba ya mteja',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: 'Outfit',
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  fontSize: 14,
                                ),
                          ).animated(
                              [animationsMap['textOnPageLoadAnimation4']!]),
                        ),
                      ],
                    ),
                  ),
                   Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                      child: TextFormField(
                        controller: buyer,
                        autofocus: true,
                        obscureText: false,
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: '',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Outfit',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                      ).animated(
                          [animationsMap['textFieldOnPageLoadAnimation4']!]),
                    ),
                ],
              ),
              status == 'Imetumwa'?Padding(
                padding: const EdgeInsets.fromLTRB(30,15,30, 15),
                child: Row(
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                            child: Text(
                              'Tarehe',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                fontFamily: 'Outfit',
                                color:
                                FlutterFlowTheme.of(context).primaryColor,
                                fontSize: 14,
                              ),
                            ).animated(
                                [animationsMap['textOnPageLoadAnimation5']!]),
                          ),

                          InkWell(
                            onTap: () {
                              _selectDate(context);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              alignment: Alignment.center,
                              child: TextFormField(
                                style: TextStyle(fontSize: 16),
                                decoration: InputDecoration(
                                  hintText: 'Chagua tarehe',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                    fontFamily: 'Outfit',
                                    color: CupertinoColors.systemGrey4,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  filled: true,
                                  fillColor:
                                  FlutterFlowTheme.of(context).secondaryBackground,
                                ),
                                textAlign: TextAlign.left,
                                enabled: false,
                                keyboardType: TextInputType.text,
                                controller: _dateController,
                                onSaved: (val) {
                                  _setDate = val;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                            child: Text(
                              'Muda',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                fontFamily: 'Outfit',
                                color:
                                FlutterFlowTheme.of(context).primaryColor,
                                fontSize: 14,
                              ),
                            ).animated(
                                [animationsMap['textOnPageLoadAnimation5']!]),
                          ),
                          InkWell(
                            onTap: () {
                              _selectTime(context);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              alignment: Alignment.center,
                              child: TextFormField(
                                style: TextStyle(fontSize: 16, ),
                                decoration: InputDecoration(
                                  hintText: 'Chagua muda',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                    fontFamily: 'Outfit',
                                    color: CupertinoColors.systemGrey4,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                ),
                                textAlign: TextAlign.left,
                                enabled: false,
                                keyboardType: TextInputType.text,
                                controller: _timeController,
                                onChanged: (val) {
                                  setState((){
                                    _setTime = val;
                                  });

                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ):Text(''),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(25, 0, 0, 0),
                          child: Text(
                            'Picha ya bidhaa',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: 'Outfit',
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  fontSize: 14,
                                ),
                          ).animated(
                              [animationsMap['textOnPageLoadAnimation5']!]),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 10, 30, 0),
                    child: Container(
                        width: double.infinity,
                        height: 300,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: widget.Image.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Image.network(widget.Image[index]),
                              );
                            })).animated(
                        [animationsMap['containerOnPageLoadAnimation']!]),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    isSeller
                        ? Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0, bottom: 15, left:10, right: 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ListView.builder(
                            itemCount: 1,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return ElevatedButton(
                                  onPressed: () async {
                                    status == 'Imetumwa'?activeContract():
                                   rateUser();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                      status == 'Imetumwa'?'Kubali':"Kamilisha",
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.lightGreen,
                                    onPrimary: Colors.black,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                      fontFamily: 'Ubuntu',
                                      color: Colors.black,
                                      fontSize: 21,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(15)),
                                  ),
                                );
                              }),
                        ),
                      ),
                    )
                        : Text(''),
                    isSeller
                        ? SizedBox(
                            width: 5,
                          )
                        : Text(''),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0, bottom: 15, left:0, right: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ListView.builder(
                              itemCount: 1,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return ElevatedButton(
                                  onPressed: () {
                                    status == 'Imetumwa'?deleteProduct():
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                TerminateWidget(
                                                  id: id,
                                                  buyer: widget.Buyer,
                                                  seller: widget.Seller,
                                                  product: productName.text,
                                                  type: type,
                                                  amount: productPrice.text,
                                                  imageSeller:dpBuyer,
                                                  imageBuyer:dpSeller,
                                                )));
                                    ;
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                      'Sitisha',
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary:  Colors.lightGreen,
                                    onPrimary: Colors.black,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Ubuntu',
                                          color: Colors.black,
                                          fontSize: 21,
                                          fontWeight: FontWeight.w500,
                                        ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                );
                              }),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  rateUser() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            title: Text(
              'Please rate us!!!',
              style: FlutterFlowTheme.of(context).bodyText2.override(
                fontFamily: 'Ubuntu',
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            content:  Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional
                              .fromSTEB(15, 4, 0, 0),
                          child: RatingBar(
                              initialRating: 0,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 35,
                              ignoreGestures: false,
                              updateOnDrag: true,
                              glow: true,
                              glowColor:
                              Colors.lightGreen,
                              glowRadius: 2,
                              ratingWidget:
                              RatingWidget(
                                  full: const Icon(
                                      Icons.star,
                                      color: Colors.lightGreen),
                                  half: const Icon(
                                    Icons.star_half,
                                    color:  Colors.lightGreen
                                  ),
                                  empty: const Icon(
                                    Icons
                                        .star_outline,
                                    color:  Colors.lightGreen
                                  )),
                              onRatingUpdate: (value) {
                                setState(() {
                                  _ratingValue = value;
                                });
                              }),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional
                              .fromSTEB(6, 6, 0, 0),
                          child: Text(
                            _ratingValue != null
                                ? _ratingValue
                                .toString() +
                                ' of 5.0'
                                : 'No rating yet!',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.12,
                      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () {
                            userRating();
                            history();
                            deleteProduct();
                            Navigator.pop(context);
                          },
                          child: Text('ok'),
                        ),
                      )
                  )]
            ),
          );});
        });
  }
  Future<void> history() async {
    DateTime now = DateTime. now();
    DateFormat formatter = DateFormat('dd-MM-yyyy');
    String formattedDate = formatter. format(now);

    DateTime date = DateTime.now();
    String formattedTime = DateFormat.Hms().format(date);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/history'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'id': id,
          'buyer': widget.Buyer,
          'seller': widget.Seller,
          'product': productName.text,
          'type': type,
          'amount': productPrice.text,
          'imageSeller':dpBuyer,
          'imageBuyer':dpSeller,
          'date': formattedDate,
          'time': formattedTime,
          'status': 'Success',
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'history made');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

   _selectDate(BuildContext context) async {
     DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(selectedDate);
      });
  }

 _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        _timeController.text = _time;
        _timeController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, am]).toString();
        deliveryDate = '${_timeController.text} ' + '${_dateController.text}';
        print(deliveryDate);
      });
  }
}
