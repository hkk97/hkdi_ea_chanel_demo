import '/components/custom_appbar_widget.dart';
import '/components/custom_footer_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'haute_couture_page_widget.dart' show HauteCouturePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HauteCouturePageModel extends FlutterFlowModel<HauteCouturePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Custom_Footer component.
  late CustomFooterModel customFooterModel;
  // Model for Custom_Appbar component.
  late CustomAppbarModel customAppbarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    customFooterModel = createModel(context, () => CustomFooterModel());
    customAppbarModel = createModel(context, () => CustomAppbarModel());
  }

  void dispose() {
    customFooterModel.dispose();
    customAppbarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
