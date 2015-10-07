@HtmlImport('creditcard-verifier.html')
library fun_components.creditcard_verifier;

import 'dart:html';

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart';

import 'package:polymer_elements/iron_input.dart';

import 'package:credit_cat/credit_cat.dart';

@PolymerRegister('creditcard-verifier')
class CreditCardVerifierElement extends PolymerElement {
  @Property(notify: true, observer: 'numberChanged') String number;
  @property String errorColour = 'red';

  CreditCardVerifierElement.created() : super.created();

  @Observe('number')
  void numberChanged([_, __]) {
    try {
      var card = new creditCat(number);

      $['cardnumber'].style.borderColor = card.valid ? "" : errorColour;
    } catch(_) {
      $['cardnumber'].style.borderColor = errorColour;
    }
  }
}