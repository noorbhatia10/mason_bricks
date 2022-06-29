import 'package:flutter/services.dart';

/*
 * Created by Nimish Nandwana on 29/06/2021.
 * Description - 
 */

///used to hide the keyboard
///but the textfield still has focus i.e
/// the cursor is still blinking in the Textfield
void hideKeyBoard() {
  SystemChannels.textInput.invokeMethod<dynamic>('TextInput.hide');
}
