import '/components/custom_appbar_with_black_color_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'auth_page_widget.dart' show AuthPageWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AuthPageModel extends FlutterFlowModel<AuthPageWidget> {
  ///  Local state fields for this page.

  bool isContactAdvisorOpen = true;

  bool isFindStoreOpen = true;

  bool isNewsletter = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for email_field widget.
  FocusNode? emailFieldFocusNode1;
  TextEditingController? emailFieldController1;
  String? Function(BuildContext, String?)? emailFieldController1Validator;
  // State field(s) for password_field widget.
  FocusNode? passwordFieldFocusNode1;
  TextEditingController? passwordFieldController1;
  late bool passwordFieldVisibility1;
  String? Function(BuildContext, String?)? passwordFieldController1Validator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for firstname_field widget.
  FocusNode? firstnameFieldFocusNode;
  TextEditingController? firstnameFieldController;
  String? Function(BuildContext, String?)? firstnameFieldControllerValidator;
  // State field(s) for lastname_field widget.
  FocusNode? lastnameFieldFocusNode;
  TextEditingController? lastnameFieldController;
  String? Function(BuildContext, String?)? lastnameFieldControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for email_field widget.
  FocusNode? emailFieldFocusNode2;
  TextEditingController? emailFieldController2;
  String? Function(BuildContext, String?)? emailFieldController2Validator;
  // State field(s) for password_field widget.
  FocusNode? passwordFieldFocusNode2;
  TextEditingController? passwordFieldController2;
  late bool passwordFieldVisibility2;
  String? Function(BuildContext, String?)? passwordFieldController2Validator;
  // Model for Custom_Appbar_With_Black_Color component.
  late CustomAppbarWithBlackColorModel customAppbarWithBlackColorModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordFieldVisibility1 = false;
    passwordFieldVisibility2 = false;
    customAppbarWithBlackColorModel =
        createModel(context, () => CustomAppbarWithBlackColorModel());
  }

  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    emailFieldFocusNode1?.dispose();
    emailFieldController1?.dispose();

    passwordFieldFocusNode1?.dispose();
    passwordFieldController1?.dispose();

    firstnameFieldFocusNode?.dispose();
    firstnameFieldController?.dispose();

    lastnameFieldFocusNode?.dispose();
    lastnameFieldController?.dispose();

    emailFieldFocusNode2?.dispose();
    emailFieldController2?.dispose();

    passwordFieldFocusNode2?.dispose();
    passwordFieldController2?.dispose();

    customAppbarWithBlackColorModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
