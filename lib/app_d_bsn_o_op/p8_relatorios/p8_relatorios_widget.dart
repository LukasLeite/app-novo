import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'p8_relatorios_model.dart';
export 'p8_relatorios_model.dart';

class P8RelatoriosWidget extends StatefulWidget {
  const P8RelatoriosWidget({super.key});

  @override
  State<P8RelatoriosWidget> createState() => _P8RelatoriosWidgetState();
}

class _P8RelatoriosWidgetState extends State<P8RelatoriosWidget>
    with TickerProviderStateMixin {
  late P8RelatoriosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => P8RelatoriosModel());

    animationsMap.addAll({
      'buttonOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 600.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.8, 1.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'buttonOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 600.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.8, 1.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 30.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Align(
          alignment: const AlignmentDirectional(-1.0, 0.0),
          child: Text(
            FFLocalizations.of(context).getText(
              'chzkeu88' /* Relatórios */,
            ),
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).headlineSmallFamily),
                ),
          ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (responsiveVisibility(
            context: context,
            desktop: false,
          ))
            Container(
              width: double.infinity,
              constraints: const BoxConstraints(
                maxWidth: 530.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FlutterFlowCheckboxGroup(
                        options: [
                          FFLocalizations.of(context).getText(
                            '2z4fi0r0' /* Ausências */,
                          ),
                          FFLocalizations.of(context).getText(
                            'dng0ny7k' /* Horas Extras */,
                          ),
                          FFLocalizations.of(context).getText(
                            't0coszny' /* Horas Trabalhadas */,
                          ),
                          FFLocalizations.of(context).getText(
                            '6v0o7wmg' /* Dispenssas */,
                          )
                        ],
                        onChanged: (val) =>
                            setState(() => _model.checkboxGroupValues1 = val),
                        controller: _model.checkboxGroupValueController1 ??=
                            FormFieldController<List<String>>(
                          [],
                        ),
                        activeColor: FlutterFlowTheme.of(context).primary,
                        checkColor: FlutterFlowTheme.of(context).info,
                        checkboxBorderColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                        itemPadding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        checkboxBorderRadius: BorderRadius.circular(4.0),
                        initialized: _model.checkboxGroupValues1 != null,
                      ),
                      Flexible(
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, -0.6),
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed('p2login');
                            },
                            text: FFLocalizations.of(context).getText(
                              '5hbd72ks' /* Gerar  */,
                            ),
                            options: FFButtonOptions(
                              width: 130.0,
                              height: 50.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Outfit'),
                                  ),
                              elevation: 2.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['buttonOnPageLoadAnimation1']!),
                        ),
                      ),
                      Divider(
                        thickness: 1.0,
                        indent: 20.0,
                        endIndent: 20.0,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      Flexible(
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 20.0, 20.0, 20.0),
                            child: ListView(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: const [],
                            ),
                          ),
                        ),
                      ),
                    ].divide(const SizedBox(height: 30.0)),
                  ),
                ),
              ),
            ),
          if (responsiveVisibility(
            context: context,
            phone: false,
            tablet: false,
            tabletLandscape: false,
          ))
            Align(
              alignment: const AlignmentDirectional(0.0, -1.0),
              child: Container(
                width: double.infinity,
                constraints: const BoxConstraints(
                  maxWidth: 530.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FlutterFlowCheckboxGroup(
                          options: [
                            FFLocalizations.of(context).getText(
                              'npjb787c' /* Ausências */,
                            ),
                            FFLocalizations.of(context).getText(
                              'xu2qw6kx' /* Horas Extras */,
                            ),
                            FFLocalizations.of(context).getText(
                              '4btfy1v4' /* Horas Trabalhadas */,
                            ),
                            FFLocalizations.of(context).getText(
                              'f9djz8u4' /* Dispenssas */,
                            )
                          ],
                          onChanged: (val) =>
                              setState(() => _model.checkboxGroupValues2 = val),
                          controller: _model.checkboxGroupValueController2 ??=
                              FormFieldController<List<String>>(
                            [],
                          ),
                          activeColor: FlutterFlowTheme.of(context).primary,
                          checkColor: FlutterFlowTheme.of(context).info,
                          checkboxBorderColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                          itemPadding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          checkboxBorderRadius: BorderRadius.circular(4.0),
                          initialized: _model.checkboxGroupValues2 != null,
                        ),
                        Flexible(
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, -0.6),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed('p2login');
                              },
                              text: FFLocalizations.of(context).getText(
                                'czaus60b' /* Gerar  */,
                              ),
                              options: FFButtonOptions(
                                width: 130.0,
                                height: 50.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey('Outfit'),
                                    ),
                                elevation: 2.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            ).animateOnPageLoad(
                                animationsMap['buttonOnPageLoadAnimation2']!),
                          ),
                        ),
                        Divider(
                          thickness: 1.0,
                          indent: 20.0,
                          endIndent: 20.0,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        Flexible(
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 20.0, 20.0, 20.0),
                              child: ListView(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: const [],
                              ),
                            ),
                          ),
                        ),
                      ].divide(const SizedBox(height: 30.0)),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
