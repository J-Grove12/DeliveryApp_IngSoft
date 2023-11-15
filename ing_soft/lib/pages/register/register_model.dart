import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import 'register_widget.dart' show RegisterWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class RegisterModel extends FlutterFlowModel<RegisterWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for txtEmail widget.
  FocusNode? txtEmailFocusNode;
  TextEditingController? txtEmailController;
  String? Function(BuildContext, String?)? txtEmailControllerValidator;
  // State field(s) for txtNombre widget.
  FocusNode? txtNombreFocusNode;
  TextEditingController? txtNombreController;
  String? Function(BuildContext, String?)? txtNombreControllerValidator;
  // State field(s) for txtContrasena widget.
  FocusNode? txtContrasenaFocusNode;
  TextEditingController? txtContrasenaController;
  late bool txtContrasenaVisibility;
  String? Function(BuildContext, String?)? txtContrasenaControllerValidator;
  // State field(s) for txtConfir widget.
  FocusNode? txtConfirFocusNode;
  TextEditingController? txtConfirController;
  late bool txtConfirVisibility;
  String? Function(BuildContext, String?)? txtConfirControllerValidator;
  // State field(s) for txtTELEFONO widget.
  FocusNode? txtTELEFONOFocusNode;
  TextEditingController? txtTELEFONOController;
  final txtTELEFONOMask = MaskTextInputFormatter(mask: '(###) ###-####');
  String? Function(BuildContext, String?)? txtTELEFONOControllerValidator;
  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    txtContrasenaVisibility = false;
    txtConfirVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    txtEmailFocusNode?.dispose();
    txtEmailController?.dispose();

    txtNombreFocusNode?.dispose();
    txtNombreController?.dispose();

    txtContrasenaFocusNode?.dispose();
    txtContrasenaController?.dispose();

    txtConfirFocusNode?.dispose();
    txtConfirController?.dispose();

    txtTELEFONOFocusNode?.dispose();
    txtTELEFONOController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
