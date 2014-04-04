part of fun_components_test;

class RomanNumeralComponent extends PageComponent {

  RomanNumeralComponent(el, number) : super(el) {
    component.number = number;
  }
}

roman_numerals_test() {
  group("[roman-numerals]", () {
    var roman_component;
    setUp(() {
      currentSchedule.onComplete.schedule(() => roman_component.component.remove());
    });


    test("display 10 as X", () {
      schedule(() {
        PolymerElement el = createElement('<roman-numeral></roman-numeral>');
        document.body.append(el);
        roman_component = new RomanNumeralComponent(el, "10");

        return roman_component.flush();
      });

      schedule(() {
        expect(roman_component.currentTextDisplay.trim(), equals('X'));
      });
    });


    test("display 9 as XL", () {
      schedule(() {
        PolymerElement el = createElement('<roman-numeral></roman-numeral>');
        document.body.append(el);
        roman_component = new RomanNumeralComponent(el, "9");

        return roman_component.flush();
      });

      schedule(() {
        expect(roman_component.currentTextDisplay.trim(), equals('IX'));
      });
    });


    test("display 2000 as MM", () {
      schedule(() {
        PolymerElement el = createElement('<roman-numeral></roman-numeral>');
        document.body.append(el);
        roman_component = new RomanNumeralComponent(el, "2000");

        return roman_component.flush();
      });


      schedule(() {
        expect(roman_component.currentTextDisplay.trim(), equals('MM'));
      });
    });
  });
}