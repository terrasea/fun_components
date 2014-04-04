library fun_components.turkish_numbers;

import 'package:polymer/polymer.dart';
import 'package:turkish_numbers/turkish_numbers.dart';


@CustomTag('turkish-number')
class TurkishNumberElement extends PolymerElement {
  @observable String turkish_number;
  @published String number;

  TurkishNumberElement.created() : super.created();

  numberChanged() {
    turkish_number = turkishIntToString(int.parse(number));
  }
}