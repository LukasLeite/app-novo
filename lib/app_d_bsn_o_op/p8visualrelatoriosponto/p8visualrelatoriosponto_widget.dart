import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'p8visualrelatoriosponto_model.dart';
export 'p8visualrelatoriosponto_model.dart';

class P8visualrelatoriospontoWidget extends StatefulWidget {
  const P8visualrelatoriospontoWidget({super.key});

  @override
  State<P8visualrelatoriospontoWidget> createState() =>
      _P8visualrelatoriospontoWidgetState();
}

class _P8visualrelatoriospontoWidgetState
    extends State<P8visualrelatoriospontoWidget> {
  late P8visualrelatoriospontoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => P8visualrelatoriospontoModel());

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
        title: Text(
          FFLocalizations.of(context).getText(
            'miecbkfp' /* Pontos */,
          ),
          style: FlutterFlowTheme.of(context).headlineSmall.override(
                fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                letterSpacing: 0.0,
                useGoogleFonts: GoogleFonts.asMap().containsKey(
                    FlutterFlowTheme.of(context).headlineSmallFamily),
              ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
        child: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          children: <Widget>[].divide(const SizedBox(height: 20.0)),
        ),
      ),
    );
  }
}
