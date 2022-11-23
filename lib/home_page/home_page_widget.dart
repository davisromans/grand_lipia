import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/chat_page/chat_page_widget.dart';
import 'package:test_app/components/contract_info_widget.dart';
import 'package:test_app/profile_page/profile_widget.dart';
import 'package:test_app/transaction_page/transaction_widget.dart';
import '../Utils/product.dart';
import '../Utils/user_provider.dart';
import '../components/admin_services.dart';
import '../components/contract_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../login_page/login_page_widget.dart';
import 'package:provider/provider.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key,}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> with TickerProviderStateMixin {
  List<Product>? products;
  final sellerRequest adminServices = sellerRequest();
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
  final scaffoldKey = GlobalKey<ScaffoldState>();
  double? _ratingValue;
  int _curIndex = 0;
  var username;
  var userPhone;
  var checker = false;
  var dpUrl;

  fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }
  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username =  prefs.getString('name');
    userPhone = prefs.getString('phone');
    dpUrl = prefs.getString('dp')!;
    print('This is the dp url: '+ dpUrl);
    greeting();
  }

  @override
  void initState() {
    super.initState();
    getUser();
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
    fetchAllProducts();
  }

  var salutation = 'Morning';
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      salutation = 'Good Morining!';
    }
    if (hour < 15) {
      salutation = 'Good Afternoon!';
    } if (hour >= 15) {
      salutation = 'Good Evening!';
    }
    return 'Morning';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Text(salutation),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        actions: [
          PopupMenuButton(
              // add icon, by default "3 dot" icon
              // icon: Icon(Icons.book)
              itemBuilder: (context) {
            return [
              PopupMenuItem<int>(
                value: 0,
                child: Text("Profile"),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Text("Transactions"),
              ),
              PopupMenuItem<int>(
                value: 2,
                child: Text("Log out"),
              ),
            ];
          }, onSelected: (value) {
            if (value == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileWidget()),
              );
            } else if (value == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TransactionWidget()),
              );
            } else if (value == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LoginPageWidget()),
              );
            }
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF2A2929),
        splashColor: Color(0xFFFF5E01),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ChatPageWidget()));
        },
        child: const Icon(Icons.chat, color: Color(0xFFFF5E01)),
      ).animated([animationsMap['containerOnPageLoadAnimation1']!]),
      //BUTTON LOCATION
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SafeArea(
          child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(children: [
                Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Column(
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 10, 0),
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
                                        image: dpUrl == '' || dpUrl == null?DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            'https://www.linkpicture.com/q/dp_3.png',
                                          ),
                                        ):DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            dpUrl,
                                          )
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15, 19, 0, 0),
                                            child: Text(
                                              '$username',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .title1
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(15, 4, 0, 0),
                                                  child: RatingBar(
                                                      initialRating: 0,
                                                      direction: Axis.horizontal,
                                                      allowHalfRating: true,
                                                      itemCount: 5,
                                                      itemSize: 20,
                                                      ignoreGestures: true,
                                                      updateOnDrag: true,
                                                      glow: true,
                                                      glowColor:
                                                          Color(0xFFFF5E01),
                                                      glowRadius: 2,
                                                      ratingWidget:
                                                          RatingWidget(
                                                              full: const Icon(
                                                                  Icons.star,
                                                                  color: Color(
                                                                      0xFFFF5E01)),
                                                              half: const Icon(
                                                                Icons.star_half,
                                                                color: Color(
                                                                    0xFFFF5E01),
                                                              ),
                                                              empty: const Icon(
                                                                Icons
                                                                    .star_outline,
                                                                color: Color(
                                                                    0xFFFF5E01),
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
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ).animated(
                                [animationsMap['textOnPageLoadAnimation3']!]),
                          ),
                          // Ads Container // Ads Container // Ads Container
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 10, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEEEEEE),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: Image.asset(
                                            'assets/images/money.png',
                                          ).image,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15, 0, 0, 0),
                                            child: Text(
                                              'Gain Trust',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .title1
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(15, 4, 0, 0),
                                                  child: Text(
                                                    'Get star ratings when you complete\na contract to gain more trust ',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title1
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ).animated([
                              animationsMap['containerOnPageLoadAnimation1']!
                            ]),
                          ),
                          // Contract  // Contract
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 0, 3),
                                  child: Text(
                                    'Initiate Contract',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ).animated([
                                    animationsMap['textOnPageLoadAnimation4']!
                                  ]),
                                ),
                              ],
                            ),
                          ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 8, 10, 0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ContractWidget(
                                                      Url: dpUrl,
                                                    )));
                                      },
                                      child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF272727),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.15),
                                                spreadRadius: 1,
                                                blurRadius: 0,
                                                offset: Offset(1, 1),
                                              ),
                                            ],
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 10, 0),
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
                                                      image: Image.asset(
                                                        'assets/images/senero.jpg',
                                                      ).image,
                                                    ),
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              'Create a contract',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .title1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15,
                                                                        4,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              'Is there a product that you wish to Sell?',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .title1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      8, 4, 0, 0),
                                                  child: Icon(Icons
                                                      .arrow_forward_ios_sharp),
                                                )
                                              ],
                                            ),
                                          )),
                                    ).animated([
                                      animationsMap[
                                          'containerOnPageLoadAnimation1']!
                                    ]),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 0, 0, 3),
                                          child: Text(
                                            'My Contract',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ).animated([
                                            animationsMap[
                                                'textOnPageLoadAnimation4']!
                                          ]),
                                        ),
                                      ],
                                    ),
                                  ),
                          products == null?Container():
                          Expanded(
                            child: ListView.builder(
                                      itemCount: products!.length,
                                        shrinkWrap: true,
                                        itemBuilder: (c, i) {
                                          final productData = products![i];
                                        if(userPhone == productData.buyer || userPhone == productData.seller){
                                            checker = true;
                                        }
                                            return checker?Padding(
                                              padding:
                                                  EdgeInsetsDirectional.fromSTEB(10, 8, 10, 0),
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) => ContractInfoWidget(
                                                              Name:  productData.name,
                                                            Specs: productData.description,
                                                            Amount: productData.price,
                                                            Location: productData.location,
                                                            Image: productData.images,
                                                            Buyer: productData.buyer,
                                                            Seller: productData.seller,
                                                            Id: productData.id,
                                                            Dealer: productData.dealer,
                                                          )));
                                                },
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 80,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF272727),
                                                    borderRadius:
                                                        BorderRadius.circular(8),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.15),
                                                        spreadRadius: 1,
                                                        blurRadius: 0,
                                                        offset: Offset(1, 1),
                                                      ),
                                                    ],
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional
                                                        .fromSTEB(10, 0, 10, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
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
                                                                color:
                                                                    Colors.white70,
                                                                spreadRadius: 2,
                                                                blurRadius: 5,
                                                              ),
                                                            ],
                                                            color:
                                                                Color(0xFFEEEEEE),
                                                            image: DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image: Image.asset(
                                                                'assets/images/woman.jpg',
                                                              ).image,
                                                            ),
                                                            shape: BoxShape.circle,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child:
                                                          Row(
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    . center,
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        15,
                                                                        0,
                                                                        0,
                                                                        0),
                                                                    child: Text(
                                                                      productData.name,
                                                                      textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                      style: FlutterFlowTheme.of(
                                                                          context)
                                                                          .title1
                                                                          .override(
                                                                        fontFamily:
                                                                        'Outfit',
                                                                        color:
                                                                        FlutterFlowTheme.of(context).primaryText,
                                                                        fontSize:
                                                                        18,
                                                                        fontWeight:
                                                                        FontWeight.w500,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    child:
                                                                    Column(
                                                                      mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                      crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              15,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                          Text(
                                                                            'Active time: 02:10 04/04/2022',
                                                                            textAlign:
                                                                            TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).title1.override(
                                                                              fontFamily: 'Outfit',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.w300,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              15,
                                                                              4,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                          Text(
                                                                           'Status: ' + productData.status,
                                                                            textAlign:
                                                                            TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).title1.override(
                                                                              fontFamily: 'Outfit',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.w300,
                                                                            ),
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
                                                        Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                                          child: Icon(Icons
                                                              .arrow_forward_ios_sharp),
                                                        ),
                                                      ]),
                                                    ),
                                                  ),
                                                ).animated([
                                                  animationsMap[
                                                      'containerOnPageLoadAnimation1']!
                                                ]),
                                              ):Text('');},
                                          ),
                          ),
                                      ],
                                    ),
                                  ),
                                ]),
                          )
    ));
  }

  Widget _getWidget() {
    switch (_curIndex) {
      case 0:
        return Container(
          color: Colors.red,
          child: TransactionWidget(),
        );
        break;
      case 1:
        return Container(
          color: Colors.red,
          child: HomePageWidget(),
        );
        break;
      default:
        return Container(
          child: ProfileWidget(),
        );
        break;
    }
  }
}

