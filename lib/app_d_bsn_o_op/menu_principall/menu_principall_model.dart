import '/flutter_flow/flutter_flow_util.dart';
import 'menu_principall_widget.dart' show MenuPrincipallWidget;
import 'package:flutter/material.dart';

class MenuPrincipallModel extends FlutterFlowModel<MenuPrincipallWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
