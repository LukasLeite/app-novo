import '/flutter_flow/flutter_flow_util.dart';
import 'pontoeletronico_widget.dart' show PontoeletronicoWidget;
import 'package:flutter/material.dart';

class PontoeletronicoModel extends FlutterFlowModel<PontoeletronicoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  Color? colorPicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
