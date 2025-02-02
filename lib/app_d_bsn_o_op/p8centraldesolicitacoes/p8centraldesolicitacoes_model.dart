import '/flutter_flow/flutter_flow_util.dart';
import 'p8centraldesolicitacoes_widget.dart' show P8centraldesolicitacoesWidget;
import 'package:flutter/material.dart';

class P8centraldesolicitacoesModel
    extends FlutterFlowModel<P8centraldesolicitacoesWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
