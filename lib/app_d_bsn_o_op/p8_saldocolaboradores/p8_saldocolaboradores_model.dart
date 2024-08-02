import '/flutter_flow/flutter_flow_util.dart';
import 'p8_saldocolaboradores_widget.dart' show P8SaldocolaboradoresWidget;
import 'package:flutter/material.dart';

class P8SaldocolaboradoresModel
    extends FlutterFlowModel<P8SaldocolaboradoresWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Pesquisa widget.
  FocusNode? pesquisaFocusNode1;
  TextEditingController? pesquisaTextController1;
  String? Function(BuildContext, String?)? pesquisaTextController1Validator;
  // State field(s) for Pesquisa widget.
  FocusNode? pesquisaFocusNode2;
  TextEditingController? pesquisaTextController2;
  String? Function(BuildContext, String?)? pesquisaTextController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    pesquisaFocusNode1?.dispose();
    pesquisaTextController1?.dispose();

    pesquisaFocusNode2?.dispose();
    pesquisaTextController2?.dispose();
  }
}
