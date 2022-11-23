import 'package:flutter/cupertino.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';


class TransactionWidget extends StatefulWidget {
  const TransactionWidget({Key? key}) : super(key: key);

  @override
  _TransactionWidgetState createState() => _TransactionWidgetState();
}

class _TransactionWidgetState extends State<TransactionWidget>
    with TickerProviderStateMixin {
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

  @override
  void initState() {
    super.initState();
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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
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
              'Miamala',
              style: FlutterFlowTheme.of(context).bodyText2.override(
                fontFamily: 'Outfit',
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        body: SafeArea(
            child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Stack(
                    children: [
                      Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: ListView(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(18, 10, 18, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          '4 January 2022',
                                          style:
                                          FlutterFlowTheme.of(context).title1.override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ).animated(
                                            [animationsMap['textOnPageLoadAnimation1']!]),
                                      ),
                                      Expanded(
                                        child: Text(
                                          '13:45',
                                          textAlign: TextAlign.right,
                                          style:
                                          FlutterFlowTheme.of(context).title1.override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ).animated(
                                            [animationsMap['textOnPageLoadAnimation1']!]),
                                      ),
                                    ],
                                  ),
                                ),
                                        SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(10, 8, 10, 0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    // await showModalBottomSheet(
                                                    //   isScrollControlled: true,
                                                    //   backgroundColor: Colors.transparent,
                                                    //   context: context,
                                                    //   builder: (context) {
                                                    //     return Padding(
                                                    //       padding: MediaQuery.of(context)
                                                    //           .viewInsets,
                                                    //       child: ContractInfoWidget2(),
                                                    //     );
                                                    //   },
                                                    // );
                                                  },
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
                                                            decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 1,),
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
                                                                  'assets/images/woman.jpg',
                                                                ).image,
                                                              ),
                                                              shape: BoxShape.circle,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Stack(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Column(
                                                                      mainAxisSize: MainAxisSize.max,
                                                                      mainAxisAlignment:
                                                                      MainAxisAlignment.start,
                                                                      crossAxisAlignment:
                                                                      CrossAxisAlignment.start,
                                                                      children: [
                                                                        Padding(
                                                                          padding:
                                                                          EdgeInsetsDirectional.fromSTEB(
                                                                              15, 13, 0, 0),
                                                                          child: Text(
                                                                            'Microphone ',
                                                                            textAlign: TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context)
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
                                                                          width: 170,
                                                                          child: Column(
                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                            children: [
                                                                              Padding(
                                                                                padding:
                                                                                EdgeInsetsDirectional.fromSTEB(
                                                                                    15, 4, 0, 0),
                                                                                child: Text(
                                                                                  'Buyer',
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context)
                                                                                      .title1
                                                                                      .override(
                                                                                    fontFamily: 'Outfit',
                                                                                    color: FlutterFlowTheme.of(
                                                                                        context)
                                                                                        .primaryText,
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.w300,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding:
                                                                                EdgeInsetsDirectional.fromSTEB(
                                                                                    15, 4, 0, 0),
                                                                                child: Text(
                                                                                  'Paid 40,000',
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context)
                                                                                      .title1
                                                                                      .override(
                                                                                    fontFamily: 'Outfit',
                                                                                    color: FlutterFlowTheme.of(
                                                                                        context)
                                                                                        .primaryText,
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
                                                                    Padding(padding: EdgeInsetsDirectional.fromSTEB(
                                                                        0, 4, 0, 0),
                                                                      child:  Icon(Icons.check_circle_outline, color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                      size: 40,),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ).animated(
                                                      [animationsMap['containerOnPageLoadAnimation1']!]),
                                                ),),

                                          ]),
                                        ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(18, 10, 18, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          '18 March 2022',
                                          style:
                                          FlutterFlowTheme.of(context).title1.override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ).animated(
                                            [animationsMap['textOnPageLoadAnimation1']!]),
                                      ),
                                      Expanded(
                                        child: Text(
                                          '09:13',
                                          textAlign: TextAlign.right,
                                          style:
                                          FlutterFlowTheme.of(context).title1.override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ).animated(
                                            [animationsMap['textOnPageLoadAnimation1']!]),
                                      ),
                                    ],
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(10, 8, 10, 0),
                                          child: InkWell(
                                            onTap: () async {
                                              // await showModalBottomSheet(
                                              //   isScrollControlled: true,
                                              //   backgroundColor: Colors.transparent,
                                              //   context: context,
                                              //   builder: (context) {
                                              //     return Padding(
                                              //       padding: MediaQuery.of(context)
                                              //           .viewInsets,
                                              //       child: ContractInfoWidget2(),
                                              //     );
                                              //   },
                                              // );
                                            },
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
                                                      decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 1,),
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
                                                            'assets/images/twoman.jpg',
                                                          ).image,
                                                        ),
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Stack(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                mainAxisAlignment:
                                                                MainAxisAlignment.start,
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment.start,
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                    EdgeInsetsDirectional.fromSTEB(
                                                                        15, 13, 0, 0),
                                                                    child: Text(
                                                                      'Cooking oil ',
                                                                      textAlign: TextAlign.start,
                                                                      style: FlutterFlowTheme.of(context)
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
                                                                    width: 170,
                                                                    child: Column(
                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        Padding(
                                                                          padding:
                                                                          EdgeInsetsDirectional.fromSTEB(
                                                                              15, 4, 0, 0),
                                                                          child: Text(
                                                                            'Seller',
                                                                            textAlign: TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context)
                                                                                .title1
                                                                                .override(
                                                                              fontFamily: 'Outfit',
                                                                              color: FlutterFlowTheme.of(
                                                                                  context)
                                                                                  .primaryText,
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.w300,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding:
                                                                          EdgeInsetsDirectional.fromSTEB(
                                                                              15, 4, 0, 0),
                                                                          child: Text(
                                                                            'Refund 87,000',
                                                                            textAlign: TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context)
                                                                                .title1
                                                                                .override(
                                                                              fontFamily: 'Outfit',
                                                                              color: FlutterFlowTheme.of(
                                                                                  context)
                                                                                  .primaryText,
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
                                                              Padding(padding: EdgeInsetsDirectional.fromSTEB(
                                                                  0, 4, 0, 0),
                                                                child:  Icon(Icons.check_circle_outline, color: FlutterFlowTheme.of(context).alternate,
                                                                  size: 40,),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ).animated(
                                                [animationsMap['containerOnPageLoadAnimation1']!]),
                                          ),),

                                      ]),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(18, 10, 18, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          '24 April 2022',
                                          style:
                                          FlutterFlowTheme.of(context).title1.override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ).animated(
                                            [animationsMap['textOnPageLoadAnimation1']!]),
                                      ),
                                      Expanded(
                                        child: Text(
                                          '16:23',
                                          textAlign: TextAlign.right,
                                          style:
                                          FlutterFlowTheme.of(context).title1.override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ).animated(
                                            [animationsMap['textOnPageLoadAnimation1']!]),
                                      ),
                                    ],
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(10, 8, 10, 0),
                                          child: InkWell(
                                            onTap: () async {
                                              // await showModalBottomSheet(
                                              //   isScrollControlled: true,
                                              //   backgroundColor: Colors.transparent,
                                              //   context: context,
                                              //   builder: (context) {
                                              //     return Padding(
                                              //       padding: MediaQuery.of(context)
                                              //           .viewInsets,
                                              //       child: ContractInfoWidget2(),
                                              //     );
                                              //   },
                                              // );
                                            },
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
                                                      decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 1,),
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
                                                            'assets/images/tmale.jpg',
                                                          ).image,
                                                        ),
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Stack(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                mainAxisAlignment:
                                                                MainAxisAlignment.start,
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment.start,
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                    EdgeInsetsDirectional.fromSTEB(
                                                                        15, 13, 0, 0),
                                                                    child: Text(
                                                                      'Gas cooker ',
                                                                      textAlign: TextAlign.start,
                                                                      style: FlutterFlowTheme.of(context)
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
                                                                    width: 170,
                                                                    child: Column(
                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        Padding(
                                                                          padding:
                                                                          EdgeInsetsDirectional.fromSTEB(
                                                                              15, 4, 0, 0),
                                                                          child: Text(
                                                                            'Seller',
                                                                            textAlign: TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context)
                                                                                .title1
                                                                                .override(
                                                                              fontFamily: 'Outfit',
                                                                              color: FlutterFlowTheme.of(
                                                                                  context)
                                                                                  .primaryText,
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.w300,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding:
                                                                          EdgeInsetsDirectional.fromSTEB(
                                                                              15, 4, 0, 0),
                                                                          child: Text(
                                                                            'Received 40,000',
                                                                            textAlign: TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context)
                                                                                .title1
                                                                                .override(
                                                                              fontFamily: 'Outfit',
                                                                              color: FlutterFlowTheme.of(
                                                                                  context)
                                                                                  .primaryText,
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
                                                              Padding(padding: EdgeInsetsDirectional.fromSTEB(
                                                                  0, 4, 0, 0),
                                                                child:  Icon(Icons.check_circle_outline, color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                  size: 40,),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ).animated(
                                                [animationsMap['containerOnPageLoadAnimation1']!]),
                                          ),),

                                      ]),
                                ),
                                      ]),
                                )])))
    );
  }}
