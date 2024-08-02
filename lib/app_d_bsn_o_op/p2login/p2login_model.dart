import '/components/input_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'p2login_widget.dart' show P2loginWidget;
import 'package:flutter/material.dart';

class P2loginModel extends FlutterFlowModel<P2loginWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for input component.
  late InputModel inputModel;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    inputModel = createModel(context, () => InputModel());
    passwordVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    inputModel.dispose();
    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
