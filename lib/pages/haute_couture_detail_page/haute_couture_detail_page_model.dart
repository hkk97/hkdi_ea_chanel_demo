import '/components/custom_appbar_with_white_color_widget.dart';
import '/components/custom_footer_widget.dart';
import '/components/watch_film_btn_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'haute_couture_detail_page_widget.dart'
    show HauteCoutureDetailPageWidget;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HauteCoutureDetailPageModel
    extends FlutterFlowModel<HauteCoutureDetailPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Watch_Film_Btn component.
  late WatchFilmBtnModel watchFilmBtnModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for Custom_Footer component.
  late CustomFooterModel customFooterModel;
  // Model for Custom_Appbar_With_White_Color component.
  late CustomAppbarWithWhiteColorModel customAppbarWithWhiteColorModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    watchFilmBtnModel = createModel(context, () => WatchFilmBtnModel());
    customFooterModel = createModel(context, () => CustomFooterModel());
    customAppbarWithWhiteColorModel =
        createModel(context, () => CustomAppbarWithWhiteColorModel());
  }

  void dispose() {
    unfocusNode.dispose();
    watchFilmBtnModel.dispose();
    customFooterModel.dispose();
    customAppbarWithWhiteColorModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
