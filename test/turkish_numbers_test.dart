part of fun_components_test;

class TurkishNumberComponent extends PageComponent {

  TurkishNumberComponent(el, number) : super(el) {
    component.number = number;
  }
}

turkish_numbers_test() {
  group("[Turkish numerals]", () {
    var turkish_component;

    setUp(() {
      currentSchedule.onComplete.schedule(() => turkish_component.component.remove());
    });

    test("display 0 as sıfır", () {
      schedule(() {
        PolymerElement el = createElement('<turkish-number></turkish-number>');
        document.body.append(el);
        turkish_component = new RomanNumeralComponent(el, 0);

        return turkish_component.flush();
      });

      schedule(() {
        expect(turkish_component.currentTextDisplay.trim(), equals('sıfır'));
      });
    });


    test("display 1000000000000 as bir trilyon", () {
      schedule(() {
        PolymerElement el = createElement('<turkish-number></turkish-number>');
        document.body.append(el);
        turkish_component = new RomanNumeralComponent(el, 1000000000000);

        return turkish_component.flush();
      });

      schedule(() {
        expect(turkish_component.currentTextDisplay.trim(), equals('bir trilyon'));
      });
    });
  });
}