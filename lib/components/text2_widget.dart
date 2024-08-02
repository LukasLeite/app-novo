import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'text2_model.dart';
export 'text2_model.dart';

class Text2Widget extends StatefulWidget {
  const Text2Widget({super.key});

  @override
  State<Text2Widget> createState() => _Text2WidgetState();
}

class _Text2WidgetState extends State<Text2Widget> {
  late Text2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Text2Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, -1.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: Text(
          FFLocalizations.of(context).getText(
            'mon7s7c0' /* [Nome do Funcionário] */,
          ),
          style: FlutterFlowTheme.of(context).displaySmall.override(
                fontFamily: FlutterFlowTheme.of(context).displaySmallFamily,
                color: FlutterFlowTheme.of(context).primaryBackground,
                letterSpacing: 0.0,
                useGoogleFonts: GoogleFonts.asMap().containsKey(
                    FlutterFlowTheme.of(context).displaySmallFamily),
              ),
        ),
      ),
    );
  }
}
