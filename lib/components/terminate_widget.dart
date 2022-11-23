import 'package:test_app/home_page/home_page_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';

class TerminateWidget extends StatefulWidget {
  const TerminateWidget({Key? key}) : super(key: key);

  @override
  _TerminateWidgetState createState() => _TerminateWidgetState();
}

class _TerminateWidgetState extends State<TerminateWidget>
    with TickerProviderStateMixin {
  TextEditingController? textController1;
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

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
    textController1 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 15, 10, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () async {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              size: 25,
                            ),
                          ),
                           SizedBox(width: 10,),
                           Text(
                            'Terminate Contract',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                              fontFamily: 'Outfit',
                              color:
                              FlutterFlowTheme.of(context).primaryColor,
                              fontSize: 22,
                            ),
                          )
                            ],
                          ),
                    ).animated(
                        [animationsMap['textOnPageLoadAnimation1']!]),
                        ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                          child: Text(
                            'Termination Details',
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
                      controller: textController1,
                      onChanged: (_) => EasyDebounce.debounce(
                        'textController1',
                        Duration(milliseconds: 2000),
                            () => setState(() {}),
                      ),
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Please tell us the reason of terminating the contract',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).secondaryBackground,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).secondaryBackground,
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 20, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                          child: Text(
                            'Proof(If any) ',
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
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'assets/images/upload_image.jpg',
                          width: double.infinity,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ).animated(
                        [animationsMap['containerOnPageLoadAnimation']!]),
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30, 20, 30, 10),
                child: FFButtonWidget(
                  onPressed: () async {
                    // await Navigator.push(
                    //   context,
                    //   PageTransition(
                    //     type: PageTransitionType.fade,
                    //     duration: Duration(milliseconds: 0),
                    //     reverseDuration: Duration(milliseconds: 0),
                    //     child: HomePageWidget(),
                    //   ),
                    // );
                  },
                  text: 'Create Contract',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 45,
                    color: FlutterFlowTheme.of(context).secondaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                    ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ).animated([animationsMap['buttonOnPageLoadAnimation']!]),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
