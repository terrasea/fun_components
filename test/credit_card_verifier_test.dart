part of fun_components_test;

class CreditCardVerifierComponent extends PageComponent {
  CreditCardVerifierComponent(el) : super(el);

  TextInputElement get currentCardNumberInput => component.querySelector('#cardnumber');
  String get currentNumberValue => component.number;
  String get currentCSSBorderErrorColour => component.errorColour;

  Future updateNumberValue(val) {
    component.set('number', val);

    return flush();
  }


  Future updateCSSBorderErrorColour(colour) {
    component.errorColour = colour;

    return flush();
  }
}

credit_card_verifier_test() {
  group('[Credit Card verifier]', () {
    var ccv_component;

    setUp(() {
      schedule(() {
        PolymerElement el = createElement('<creditcard-verifier></creditcard-verifier>');
        document.body.append(el);
        ccv_component = new CreditCardVerifierComponent(el);

        return ccv_component.flush();
      });

    });

    tearDown(() {
      ccv_component.component.remove();
    });

    test('outlines in red, card number input, on invalid card number', () {
      schedule(() {
        return ccv_component.updateNumberValue('1111111111111111');
      });


      schedule(() {
        TextInputElement input = ccv_component.currentCardNumberInput;
        expect(input.style.borderColor, equals('red'));
      });
    });


    test('no red outline, credit card input, on valid card number', () {
      schedule(() {
        return ccv_component.updateNumberValue('4111111111111111');
      });


      schedule(() {
        TextInputElement input = ccv_component.currentCardNumberInput;
        expect(input.style.borderColor, equals(''));
      });
    });


    test('outline colour is green on error', () {
      schedule(() {
        return ccv_component.updateCSSBorderErrorColour('green');
      });

      schedule(() {
        return ccv_component.updateNumberValue('1111111111111111');
      });

      schedule(() {
        TextInputElement input = ccv_component.currentCardNumberInput;
        expect(input.style.borderColor, equals('green'));
      });
    });


  });
}