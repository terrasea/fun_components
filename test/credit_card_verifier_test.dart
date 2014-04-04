part of fun_components_test;

class CreditCardVerifierComponent extends PageComponent {
  CreditCardVerifierComponent(el) : super(el);

  TextInputElement get currentCardNumberInput => component.$['cardnumber'];
  String get currentNumberValue => component.number;

  Future updateNumberValue(val) {
    component.number = val;

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

      currentSchedule.onComplete.schedule(() => ccv_component.component.remove());
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


    test('outlines in blue, credit card input, on valid card number', () {
      schedule(() {
        return ccv_component.updateNumberValue('4111111111111111');
      });


      schedule(() {
        TextInputElement input = ccv_component.currentCardNumberInput;
        expect(input.style.borderColor, equals('blue'));
      });
    });

  });
}