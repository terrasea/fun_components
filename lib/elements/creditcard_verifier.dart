library fun_components.creditcard_verifier;

import 'package:polymer/polymer.dart';
import 'package:credit_cat/credit_cat.dart';

@CustomTag('creditcard-verifier')
class CreditCardVerifierElement extends PolymerElement {
  @observable String number;

  CreditCardVerifierElement.created() : super.created();

  numberChanged(old) {
    try {
      var card = new creditCat(number);
      $['cardnumber'].style.borderColor = card.valid ? "blue" : "red";
      print(card.valid);
    } on FormatException {
      $['cardnumber'].style.borderColor = "red";
    }
  }
}