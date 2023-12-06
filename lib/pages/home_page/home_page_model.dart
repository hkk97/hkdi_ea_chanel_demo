import '/components/custom_appbar_with_bag_widget.dart';
import '/components/custom_footer_widget.dart';
import '/components/see_looks_btn_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  bool isFashionDrawer = false;

  ///  State fields for stateful widgets in this page.

  // Model for See_Looks_Btn component.
  late SeeLooksBtnModel seeLooksBtnModel1;
  // Model for See_Looks_Btn component.
  late SeeLooksBtnModel seeLooksBtnModel2;
  // Model for See_Looks_Btn component.
  late SeeLooksBtnModel seeLooksBtnModel3;
  // Model for See_Looks_Btn component.
  late SeeLooksBtnModel seeLooksBtnModel4;
  // Model for See_Looks_Btn component.
  late SeeLooksBtnModel seeLooksBtnModel5;
  // Model for See_Looks_Btn component.
  late SeeLooksBtnModel seeLooksBtnModel6;
  // Model for Custom_Footer component.
  late CustomFooterModel customFooterModel;
  // Model for CustomAppbar_with_bag component.
  late CustomAppbarWithBagModel customAppbarWithBagModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    seeLooksBtnModel1 = createModel(context, () => SeeLooksBtnModel());
    seeLooksBtnModel2 = createModel(context, () => SeeLooksBtnModel());
    seeLooksBtnModel3 = createModel(context, () => SeeLooksBtnModel());
    seeLooksBtnModel4 = createModel(context, () => SeeLooksBtnModel());
    seeLooksBtnModel5 = createModel(context, () => SeeLooksBtnModel());
    seeLooksBtnModel6 = createModel(context, () => SeeLooksBtnModel());
    customFooterModel = createModel(context, () => CustomFooterModel());
    customAppbarWithBagModel =
        createModel(context, () => CustomAppbarWithBagModel());
  }

  void dispose() {
    seeLooksBtnModel1.dispose();
    seeLooksBtnModel2.dispose();
    seeLooksBtnModel3.dispose();
    seeLooksBtnModel4.dispose();
    seeLooksBtnModel5.dispose();
    seeLooksBtnModel6.dispose();
    customFooterModel.dispose();
    customAppbarWithBagModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
