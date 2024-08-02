import '/flutter_flow/flutter_flow_util.dart';
import 'p1capa_widget.dart' show P1capaWidget;
import 'package:flutter/material.dart';

class P1capaModel extends FlutterFlowModel<P1capaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool resultado = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
