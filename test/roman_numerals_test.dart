part of fun_components_test;

class RomanNumeralComponent extends PageComponent {

  RomanNumeralComponent(el) : super(el);
}

roman_numerals_test() {
  group("[roman-numerals]", () {
    var roman_component;
    setUp(() {
      Completer completer = new Completer();
      new Timer(new Duration(milliseconds: 200), () {
        completer.complete();
      });

      return completer.future;
    });

    tearDown(() => roman_component.component.remove());

    test("display 1 as I", () {
      schedule(() {
        PolymerElement el = createElement('<roman-numeral number="1"></roman-numeral>');
        document.body.append(el);
        roman_component = new RomanNumeralComponent(el);

        return roman_component.flush().then((_) => roman_component.flush());
      });

      schedule(() {
        expect(roman_component.currentTextDisplay.trim(), equals('I'));
      });
    });


    test("display 10 as X", () {
      schedule(() {
        PolymerElement el = createElement('<roman-numeral number="10"></roman-numeral>');
        document.body.append(el);
        roman_component = new RomanNumeralComponent(el);

        return roman_component.flush();
      });

      schedule(() {
        expect(roman_component.currentTextDisplay.trim(), equals('X'));
      });
    });


    test("display 9 as XL", () {
      schedule(() {
        PolymerElement el = createElement('<roman-numeral number="9"></roman-numeral>');
        document.body.append(el);
        roman_component = new RomanNumeralComponent(el);

        return roman_component.flush();
      });

      schedule(() {
        expect(roman_component.currentTextDisplay.trim(), equals('IX'));
      });
    });


    test("display 2000 as MM", () {
      schedule(() {
        PolymerElement el = createElement('<roman-numeral number="2000"></roman-numeral>');
        document.body.append(el);
        roman_component = new RomanNumeralComponent(el);

        return roman_component.flush();
      });


      schedule(() {
        expect(roman_component.currentTextDisplay.trim(), equals('MM'));
      });
    });


    group('from <content> of tag', () {
      test('valid content', () {
        PolymerElement el = createElement('<roman-numeral>10</roman-numeral>');
        document.body.append(el);
        roman_component = new RomanNumeralComponent(el);

        roman_component.flush();

        expect(roman_component.currentTextDisplay.trim(), 'X');
      });

      test('invalid content', () {
        PolymerElement el = createElement('<roman-numeral>I</roman-numeral>');
        document.body.append(el);
        roman_component = new RomanNumeralComponent(el);

        roman_component.flush();

        expect(roman_component.currentTextDisplay.trim(), '');
      });
    });

    //@TODO: decide if it's worth testing for exceptions when number > 3999 or < 1

  });
}