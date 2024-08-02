import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'p1capa_model.dart';
export 'p1capa_model.dart';

class P1capaWidget extends StatefulWidget {
  const P1capaWidget({super.key});

  @override
  State<P1capaWidget> createState() => _P1capaWidgetState();
}

class _P1capaWidgetState extends State<P1capaWidget> {
  late P1capaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => P1capaModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    'https://dbsnoop.com/wp-content/uploads/2023/05/cropped-semtagline.png',
                    width: 233.0,
                    height: 244.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  final localAuth = LocalAuthentication();
                  bool isBiometricSupported =
                      await localAuth.isDeviceSupported();

                  if (isBiometricSupported) {
                    _model.resultado = await localAuth.authenticate(
                        localizedReason: FFLocalizations.of(context).getText(
                      '2fgs4w5m' /* Biometria */,
                    ));
                    setState(() {});
                  }

                  if (_model.resultado) {
                    context.pushNamed('p2login');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Não validado',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: const Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                      ),
                    );
                  }

                  setState(() {});
                },
                child: Icon(
                  Icons.login_rounded,
                  color: FlutterFlowTheme.of(context).secondary,
                  size: 100.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
