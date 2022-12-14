import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/components/contract_info_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Utils/product.dart';
import '../components/admin_services.dart';
import '../components/contract_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../screen_navigation_widget.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  List<Product>? products;
  final sellerRequest adminServices = sellerRequest();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  double _ratingValue = 0;
  int _curIndex = 0;
  var username;
  var userPhone;
  var checker = false;
  var dpUrl;
  var rating;
  var salutation = '';

  fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }

  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username = prefs.getString('name');
    userPhone = prefs.getString('phone');
    dpUrl = prefs.getString('dp')!;
    rating = prefs.getString('rating');
    if (rating.length > 15) {
      rating = rating.substring(0, 3);
    }
    greeting();
    _ratingValue = double.parse(rating);
    print(prefs.getBool('logged_in'));
  }

  @override
  void initState() {
    super.initState();
    getUser();
    fetchAllProducts();
  }

  greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      salutation = 'Good Morning!';
    } else if (hour < 15) {
      salutation = 'Good Afternoon!';
    } else if (hour >= 15) {
      salutation = 'Good Evening!';
    }
    return 'Morning';
  }

  var whatsappUrl = "whatsapp://send?phone=255625255004" +
      "&text=${Uri.encodeComponent('hello')}";

  _launchURL() async {
    const uri = 'https://wa.me/qr/GGJCIF63U6ZSJ1';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF1A2023),
          splashColor: Colors.white,
          onPressed: () {
            //To remove the keyboard when button is pressed
            // FocusManager.instance.primaryFocus?.unfocus();
            var whatsappUrl = "whatsapp://send?phone=255658457580" +
                "&text=${Uri.encodeComponent('Habari! Nimepata changamoto baada ya kusitisha mkataba')}";
            try {
              launch(whatsappUrl);
            } catch (e) {
              //To handle error and display error message
              print(e.toString());
            }
          },
          child: const Icon(Icons.chat, color: Colors.white),
        ),
        //BUTTON LOCATION
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: SmartRefresher(
            enablePullDown: true,
            enablePullUp: false,
            controller: _refreshController,
            onRefresh: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NavigationScreen()));
            },
            child: SafeArea(
                child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Color(0xFF1A2023),
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 55,
                                  height: 55,
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
                                    image: dpUrl == '' || dpUrl == null
                                        ? DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              'https://www.linkpicture.com/q/dp_3.png',
                                            ),
                                          )
                                        : DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              dpUrl,
                                            )),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15, 19, 0, 0),
                                        child: Text(
                                          username != null ? '$username' : '',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .title1
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: Colors.white,
                                                fontSize: 16,
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
                                                  initialRating: rating != null
                                                      ? _ratingValue
                                                      : 0.0,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  itemSize: 20,
                                                  ignoreGestures: true,
                                                  updateOnDrag: true,
                                                  glow: true,
                                                  glowColor: Color(0xFFFF5E01),
                                                  glowRadius: 2,
                                                  ratingWidget: RatingWidget(
                                                      full: const Icon(
                                                          Icons.star,
                                                          color: Colors.white),
                                                      half: const Icon(
                                                        Icons.star_half,
                                                        color: Colors.white,
                                                      ),
                                                      empty: const Icon(
                                                          Icons.star_outline,
                                                          color: Colors.white)),
                                                  onRatingUpdate: (value) {}),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(6, 6, 0, 0),
                                              child: Text(
                                                rating != null
                                                    ? rating + ' / 5.0'
                                                    : '',
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
                        ),
                      ),
                      // Ads Container // Ads Container // Ads Container
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 8, 10, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Color(0xFF1A2023),
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 55,
                                  height: 55,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15, 0, 0, 0),
                                        child: Text(
                                          'Jenga uaminifu',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .title1
                                              .override(
                                                fontFamily: 'Outfit',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 16,
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
                                                'Pata nyota kila unapokamilisha\n biashara ili uaminike zaidi',
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                        ),
                      ),
                      // Contract  // Contract
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 8, 10, 0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ContractWidget(
                                          Url: dpUrl,
                                        )));
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Color(0xFF1A2023),
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
                                      width: 55,
                                      height: 55,
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
                                            'assets/images/lipia.png',
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
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 0, 0, 0),
                                                child: Text(
                                                  'Tengeneza mkataba',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title1
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 4, 0, 0),
                                                child: Text(
                                                  'NI muhimu kuilinda pesa yako',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title1
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 4, 0, 0),
                                      child:
                                          Icon(Icons.arrow_forward_ios_sharp,color: Colors.white),
                                    )
                                  ],
                                ),
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                              child: Text(
                                'Mikataba yangu',
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
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  products == null
                      ? Container()
                      : ListView.builder(
                          itemCount: products!.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (c, i) {
                            final productData = products![i];
                            if (userPhone == productData.buyer ||
                                userPhone == productData.seller) {
                              checker = true;
                            }
                            return checker && userPhone == productData.buyer ||
                                    userPhone == productData.seller
                                ? Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 5, 10, 0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ContractInfoWidget(
                                                      Name: productData.name,
                                                      Specs: productData
                                                          .description,
                                                      Amount: productData.price,
                                                      Location:
                                                          productData.location,
                                                      Image: productData.images,
                                                      Buyer: productData.buyer,
                                                      Seller:
                                                          productData.seller,
                                                      Id: productData.id,
                                                      Dealer:
                                                          productData.dealer,
                                                      Url: productData.url,
                                                      Status:
                                                          productData.status,
                                                      buyerImage: productData
                                                          .buyerImage,
                                                      receiver:
                                                          productData.receiver,
                                                      sellerId:
                                                          productData.sellerId,
                                                      terminate:
                                                          productData.terminate,
                                                      buyerRating: productData
                                                          .buyerRating,
                                                      sellerRating: productData
                                                          .sellerRating,
                                                    )));
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF1A2023),
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
                                                  width: 55,
                                                  height: 55,
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
                                                        userPhone ==
                                                                productData
                                                                    .buyer
                                                            ? productData.url
                                                            : productData
                                                                .buyerImage,
                                                      ),
                                                    ),
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
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
                                                              productData.name,
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
                                                          Container(
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
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
                                                                    'Muda: ' +
                                                                        productData
                                                                            .deliveryDate,
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
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15,
                                                                          4,
                                                                          0,
                                                                          0),
                                                                  child: Text(
                                                                    'Hali: ' +
                                                                        productData
                                                                            .status,
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
                                                                              14,
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
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 4, 0, 0),
                                                  child: Icon(Icons
                                                      .arrow_forward_ios_sharp, color: Colors.white),
                                                ),
                                              ]),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container();
                          },
                        ),
                ],
              ),
            ))));
  }
}
