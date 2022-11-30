import 'dart:convert';
import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Utils/error_handling.dart';
import '../Utils/user.dart';
import '../Utils/utils.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:expandable/expandable.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget>
    with TickerProviderStateMixin {
  TextEditingController usernameField = TextEditingController();
  TextEditingController phoneField = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late bool passwordVisibility;
  var username;
  var productPhone;
  var password;
  var id;
  var dpUrl;
  var getPassword;
  bool isDisabled = false;
  List<File> images = [];
  bool loadingValue = false;

  final animationsMap = {
    'circleImageOnPageLoadAnimation': AnimationInfo(
      curve: Curves.linear,
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      curve: Curves.linear,
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
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
      curve: Curves.linear,
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
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
      curve: Curves.linear,
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
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
        offset: Offset(0, -100),
        scale: 0,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation1': AnimationInfo(
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
        offset: Offset(0, -100),
        scale: 0,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
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
    'containerOnPageLoadAnimation3': AnimationInfo(
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
    'containerOnPageLoadAnimation4': AnimationInfo(
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
    'textOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      duration: 600,
      hideBeforeAnimating: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
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

  showDialogLoading() {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            content: Row(
              children: const [
                CircularProgressIndicator(
                  color: Colors.orange,
                ),
                SizedBox(
                  width: 10,
                ),
                Text("Loading")
              ],
            ),
          );
        });
  }

  void _enableLoading(bool loadingValue) {
    if (loadingValue == true) {
      showDialogLoading();
    } else {
      Navigator.pop(context);
    }
  }

  Future<void> updateInfo() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final cloudinary = CloudinaryPublic('dorxkvvvv', 'p2ayj0bu');
      List<String> imageUrls = [];
      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: 'dp'),
        );
        imageUrls.add(res.secureUrl);
      }

      updateUser update = updateUser(
        id: id,
        productPhone: productPhone,
        password: passwordController.text != ''
            ? passwordController.text
            : getPassword,
        phone: phoneField.text != '' ? phoneField.text : productPhone,
        name: usernameField.text != '' ? usernameField.text : username,
        images: imageUrls != [] ? imageUrls : imageUrls,
        dpUrl: dpUrl,
      );
      http.Response res = await http.post(
        Uri.parse('$uri/api/update_profile'),
        body: update.toJson(),
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
          if (returnData['images'].length > 0) {
            prefs.setString('dp', returnData['images'][0]);
          }
          print(prefs.getString('phone'));
          // showSnackBar(
          //   context,
          //   'Umefanikiwa kubadili taarifa!',
          // );
          topBar(context, 'Hongera', 'Umefanikiwa kubadili taarifa');

        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e.toString());
    }
  }

  final second = GlobalKey<ScaffoldState>();
  double? _ratingValue;

  animations() {
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
    setupTriggerAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onActionTrigger),
      this,
    );
  }

  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('name');
      productPhone = prefs.getString('phone');
      id = prefs.getString('id');
      dpUrl = prefs.getString('dp');
      getPassword = prefs.getString('password');
    });
    //username = await prefs.getString('name');
  }

  selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  @override
  void initState() {
    super.initState();
    getUser();
    animations();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: second,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF181717),
        toolbarHeight: 50,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
          child: Text(
            'Wasifu',
            style: FlutterFlowTheme.of(context).bodyText2.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ),
      body: ExpandableTheme(
        data: const ExpandableThemeData(
          iconColor: Colors.white,
          useInkWell: true,
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(

                    child: Stack(
                      children: [
                        images.isNotEmpty
                            ? CircleAvatar(
                                radius: 90,
                                backgroundImage: FileImage(images[0]),
                              )
                            : dpUrl != '' && dpUrl != null
                                ? CircleAvatar(
                                    radius: 90,
                                    backgroundColor: Colors.white,
                                    backgroundImage: NetworkImage(dpUrl),
                                  )
                                : CircleAvatar(
                                    radius: 90,
                                    backgroundColor: Colors.white,
                                    backgroundImage: NetworkImage(
                                      'https://www.linkpicture.com/q/dp_3.png',
                                    ),
                                  ),
                        Positioned(
                            right: -10,
                            top: -10,
                            child: IconButton(
                              onPressed: () {
                                selectImages();
                              },
                              icon: Icon(
                                Icons.add_circle_outlined,
                                size: 25,
                                color: Colors.white,
                              ),
                            ))
                      ],
                    ),
                  ),
            ],
          ),
        ),
            ExpandableNotifier(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
              child: Card(
                clipBehavior: Clip.antiAlias,
                color: Color(0xFF1A2023),
                child: Column(
                  children: <Widget>[
                    ScrollOnExpand(
                      scrollOnExpand: true,
                      scrollOnCollapse: false,
                      child: ExpandablePanel(
                        theme: const ExpandableThemeData(
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          tapBodyToCollapse: true,

                        ),
                        header: Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 0, 5),
                            child: Text(
                              "Jina la mtumiaji",
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                            )),
                        collapsed: Text(
                          username == null?'':username,
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                            fontFamily: 'Outfit',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        expanded: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(bottom: 10, top: 10),
                                child: Container(
                                  child: TextFormField(
                                    controller: usernameField,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: Color(0xFF57636C),
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      hintText: '$username',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: Colors.grey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      disabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      filled: true,
                                      fillColor: Colors.transparent,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              16, 5, 0, 5),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        builder: (_, collapsed, expanded) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: Expandable(
                              collapsed: collapsed,
                              expanded: expanded,
                              theme:
                                  const ExpandableThemeData(crossFadePoint: 0),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )),
            ExpandableNotifier(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
              child: Card(
                clipBehavior: Clip.antiAlias,
                color: Color(0xFF1A2023),
                child: Column(
                  children: <Widget>[
                    ScrollOnExpand(
                      scrollOnExpand: true,
                      scrollOnCollapse: false,
                      child: ExpandablePanel(
                        theme: const ExpandableThemeData(
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          tapBodyToCollapse: true,
                        ),
                        header: Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 0, 5),
                            child: Text(
                              "Namba ya simu",
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                fontFamily: 'Outfit',
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                        collapsed: Text(
                          productPhone == null?'':productPhone,
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                            fontFamily: 'Outfit',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        expanded: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(bottom: 10,  top: 10),
                                child: Container(
                                  child: TextFormField(
                                    controller: phoneField,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: Color(0xFF57636C),
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      hintText: productPhone,
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: Colors.grey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      disabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      filled: true,
                                      fillColor: Colors.transparent,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              16, 5, 0, 5),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        builder: (_, collapsed, expanded) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: Expandable(
                              collapsed: collapsed,
                              expanded: expanded,
                              theme:
                                  const ExpandableThemeData(crossFadePoint: 0),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )),
            ExpandableNotifier(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
              child: Card(
                clipBehavior: Clip.antiAlias,
                color: Color(0xFF1A2023),
                child: Column(
                  children: <Widget>[
                    ScrollOnExpand(
                      scrollOnExpand: true,
                      scrollOnCollapse: false,
                      child: ExpandablePanel(
                        theme: const ExpandableThemeData(
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          tapBodyToCollapse: true,
                        ),
                        header: Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 0, 5),
                            child: Text(
                              "Neno siri",
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                fontFamily: 'Outfit',
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                        collapsed: Text(
                          '................',
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                            fontFamily: 'Outfit',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        expanded: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(bottom: 10, top: 10),
                                child: Container(
                                  child: TextFormField(
                                    controller: passwordController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: Color(0xFF57636C),
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      hintText: '............',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: Colors.grey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      disabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      filled: true,
                                      fillColor: Colors.transparent,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              16, 5, 0, 5),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        builder: (_, collapsed, expanded) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: Expandable(
                              collapsed: collapsed,
                              expanded: expanded,
                              theme:
                                  const ExpandableThemeData(crossFadePoint: 0),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          updateInfo();
                        },
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Vigezo na masharti',
                            textAlign: TextAlign.left,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF1A2023),
                          onPrimary: Colors.white,
                          textStyle:
                              FlutterFlowTheme.of(context).title1.override(
                                    fontFamily: 'Ubuntu',
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 15),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          updateInfo();
                        },
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Ondoka',
                            textAlign: TextAlign.left,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF1A2023),
                          onPrimary: Colors.white,
                          textStyle:
                              FlutterFlowTheme.of(context).title1.override(
                                    fontFamily: 'Ubuntu',
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          updateInfo();
                        },
                        child: Text(
                          'Badili taarifa',
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: FlutterFlowTheme.of(context).tertiaryColor,
                          onPrimary: Colors.white,
                          textStyle:
                              FlutterFlowTheme.of(context).title1.override(
                                    fontFamily: 'Ubuntu',
                                    color: Colors.black,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500,
                                  ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
