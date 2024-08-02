import '/flutter_flow/flutter_flow_util.dart';
import 'p8editarperfilcolaborador_widget.dart'
    show P8editarperfilcolaboradorWidget;
import 'package:flutter/material.dart';

class P8editarperfilcolaboradorModel
    extends FlutterFlowModel<P8editarperfilcolaboradorWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameTextController;
  String? Function(BuildContext, String?)? yourNameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameTextController?.dispose();
  }
}
