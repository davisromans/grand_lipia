import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Utils/error_handling.dart';
import '../Utils/utils.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'admin_services.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';


class ContractWidget extends StatefulWidget {
  const ContractWidget({
    Key? key,
    this.Url,
  }) : super(key: key);
  final Url;

  @override
  _ContractWidgetState createState() => _ContractWidgetState();
}

class _ContractWidgetState extends State<ContractWidget>
    with TickerProviderStateMixin {
  final sellerRequest adminServices = sellerRequest();
  TextEditingController productName = TextEditingController();
  TextEditingController specs = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController buyerPhone = TextEditingController();
  var sellerPhone;
  var sellerName;
  List infoList = [];
  bool infoSearch = false;
  var buyerImage = '';
  var sellerId;
  bool contractActivate = false;
  var buyerName;
  var url;
  var buyerRating;
  var sellerRating;

  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      sellerPhone = prefs.getString('phone');
      sellerName = prefs.getString('name');
      sellerId = prefs.getString('id');
      sellerRating = prefs.getString('rating');

      if (widget.Url == '') {
        url = 'https://www.linkpicture.com/q/dp_3.png';
      } else {
        url = widget.Url;
      }
    });
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
  List<File> images = [];
  var status;

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
    getUser();
  }

  void sellProduct() {
    status = 'Imetumwa';
    var delivery = '-';
    var terminate = '-';
      adminServices.makeContract(
        context: context,
        name: productName.text,
        description: specs.text,
        price: double.parse(price.text),
        location: location.text,
        buyer: buyerPhone.text,
        seller: sellerPhone,
        images: images,
        status: status.toString(),
        dealer: sellerName,
        url: url,
        receiver: buyerName,
        buyerImage: buyerImage,
        sellerId: sellerId,
        deliveryDate: delivery,
        terminate: terminate,
        buyerRating: buyerRating.toString(),
        sellerRating: sellerRating.toString(),
      );
  }


  selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  fetchBuyer() async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'phone': buyerPhone.text,
        }),
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          var ratings = [];
          var returnData = jsonDecode(res.body);
          print(returnData);


          if (returnData.length > 0) {

            contractActivate = true;
            ratings = returnData[0]['ratings'];
            double avgRating = 0;
            double totalRating = 0;
            if( ratings.length > 0){
              for (int i = 0; i < ratings.length; i++) {
                totalRating +=ratings[i]['rating'];
              }

              if (totalRating != 0) {
                avgRating = totalRating / ratings.length;
                buyerRating = avgRating;
              }

            }else{
              buyerRating = '5.0 / 5.0';
            }
          } else {
            showSnackBar(context,'Namba uliongiza haijasajiliwa');
          }

          print(returnData);
          infoList = returnData;
          setState(() {
            infoSearch = true;
          });
        },
      );
    } catch (e) {

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
            'Tengeneza mkataba',
            style: FlutterFlowTheme.of(context).bodyText2.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22,
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
                padding: EdgeInsetsDirectional.fromSTEB(15, 19, 15, 0),
                child: Text(
                  'Taarifa utakazo jaza zitaonekana kwa mteja ukishautuma mkataba huu',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).title1.override(
                        fontFamily: 'Outfit',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                ).animated([animationsMap['textOnPageLoadAnimation5']!]),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 20, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                          child: Text(
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
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                    child: TextFormField(
                      controller: productName,
                      decoration: InputDecoration(
                        hintStyle: FlutterFlowTheme.of(context)
                            .bodyText2
                            .override(
                          fontFamily: 'Outfit',
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                          contentPadding: EdgeInsets.all(15)
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
                      mainAxisSize: MainAxisSize.max,
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
                      controller: specs,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Tafdhali andika maelezo yote muhimu juu ya bidhaa au huduma husika',
                        hintStyle: FlutterFlowTheme.of(context)
                            .bodyText2
                            .override(
                          fontFamily: 'Outfit',
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                          contentPadding: EdgeInsets.all(15)
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 25, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
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
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                    child: TextFormField(
                      controller: price,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'mf. 5000',
                        hintStyle: FlutterFlowTheme.of(context)
                            .bodyText2
                            .override(
                          fontFamily: 'Outfit',
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                          contentPadding: EdgeInsets.all(15)
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
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                    child: TextFormField(
                      controller: location,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: '',
                        hintStyle: FlutterFlowTheme.of(context)
                            .bodyText2
                            .override(
                          fontFamily: 'Outfit',
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                          contentPadding: EdgeInsets.all(15)
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
                            'Picha ya bidhaa (kama ipo)',
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
                    padding: EdgeInsetsDirectional.fromSTEB(25, 10, 25, 0),
                    child: images.isNotEmpty
                        ? InkWell(
                      onTap: selectImages,
                          child: CarouselSlider(
                              items: images.map(
                                (i) {
                                  return Builder(
                                    builder: (BuildContext context) => Image.file(

                                      i,
                                      fit: BoxFit.cover,
                                      height: 200,
                                      filterQuality: FilterQuality.low,
                                      repeat: ImageRepeat.noRepeat,
                                    ),
                                  );
                                },
                              ).toList(),
                              options: CarouselOptions(
                                autoPlay: true,
                                viewportFraction: 1,
                                height: 200,
                              ),
                            ),
                        )
                        : GestureDetector(
                            onTap: selectImages,
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(10),
                              dashPattern: const [10, 4],
                              strokeCap: StrokeCap.round,
                              color: Colors.grey,
                              child: Container(
                                width: double.infinity,
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.folder_open,
                                      size: 40,
                                    ),
                                    const SizedBox(height: 15),
                                    Text(
                                      '',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 25, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                          child: Text(
                            'Namba ya mteja',
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
                  ),
                  Row(
                    children: [
                      Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.7,
                            child: TextField(
                              controller: buyerPhone,
                              decoration: InputDecoration(
                                hintText: '',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                  fontFamily: 'Outfit',
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
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
                                contentPadding: EdgeInsets.all(15)
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                              keyboardType: TextInputType.text,
                            ).animated([
                              animationsMap['textFieldOnPageLoadAnimation3']!
                            ]),
                          ),
                        ),
                     SizedBox(width: 5,),
                     Padding(
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 15, left: 0, right: 15),
                          child: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                fetchBuyer();
                              },
                              child: Icon(
                                Icons.check,
                                size: 30,

                              ),
                              style: ElevatedButton.styleFrom(
                                primary: FlutterFlowTheme.of(context).tertiaryColor,
                                onPrimary: Colors.white,
                                padding: EdgeInsets.zero,
                                textStyle: FlutterFlowTheme.of(context)
                                    .title1
                                    .override(
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
                    ],
                  ),
                  infoSearch == true && infoList.length > 0
                      ? Padding(
                          padding: const EdgeInsets.only(
                              top: 0, bottom: 15, left: 0, right: 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (context, index) {
                                  buyerName = infoList[index]['name'];
                                  buyerImage = infoList[index]['images']
                                              .length >
                                          0
                                      ? infoList[index]['images'][0]
                                      : 'https://www.linkpicture.com/q/dp_3.png';

                                  double avgRating = 0;
                                  double myRating = 0;
                                  double totalRating = 0;
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 10, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(15, 0, 0, 0),
                                              child: Text(
                                                'Taarifa za mteja:',
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          fontSize: 14,
                                                        ),
                                              ).animated([
                                                animationsMap[
                                                    'textOnPageLoadAnimation3']!
                                              ]),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 1, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(15, 2, 0, 0),
                                              child: infoList[index] == ''
                                                  ? Container()
                                                  : Text(
                                                      'Jina: ' +
                                                          infoList[index]
                                                              ['name'],
                                                      textAlign:
                                                          TextAlign.start,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                              ),
                                                    ).animated([
                                                      animationsMap[
                                                          'textOnPageLoadAnimation3']!
                                                    ]),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 2, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(15, 0, 0, 0),
                                              child: Text(
                                                'Namba ya simu: ' +
                                                    infoList[index]['phone'],
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                              ).animated([
                                                animationsMap[
                                                    'textOnPageLoadAnimation3']!
                                              ]),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 2, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(15, 0, 0, 0),
                                              child: Text(
                                                buyerRating != '5.0 / 5.0'
                                                ?'Nyota: ' + buyerRating.toString() + ' / 5.0'
                                                :'5.0 / 5.0',
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                              ).animated([
                                                animationsMap[
                                                    'textOnPageLoadAnimation3']!
                                              ]),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  );
                                }),
                          ),
                        )
                      : Container(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 30,25, 15),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () async {
                      contractActivate ? sellProduct() : Text('');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Tuma mkataba',
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary:  contractActivate
                          ? FlutterFlowTheme.of(context).tertiaryColor: Colors.grey,
                      onPrimary: Colors.white,
                      textStyle:
                      FlutterFlowTheme.of(context).title1.override(
                        fontFamily: 'Ubuntu',
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
