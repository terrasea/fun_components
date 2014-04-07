part of fun_components_test;


class MarkdownMarkupComponent extends PageComponent {
  MarkdownMarkupComponent(el) : super(el);

  Element get currentDestinationElement => component.$['destination'];
}

//not testing if all markdown features works, as the used markdown package should do those tests.
markdown_markup_test() {
  solo_group('[Markdown Markup]', () {
    MarkdownMarkupComponent markdown_component;
    setUp(() {
      schedule(() {
        var markdown = """
heading
=======

<strong id="someid">strong element</strong>

""";
        PolymerElement el = createElement('<markdown-markup>$markdown</markdown-markup>');
        document.body.append(el);
        markdown_component = new MarkdownMarkupComponent(el);

        return markdown_component.flush().then((_) {
          /*Completer completer = new Completer();

          new Timer(new Duration(milliseconds: 250), () => completer.complete());

          return completer.future;*/
          return markdown_component.flush();
        });
      });
    });


    test('conmtains heading h1 element', () {
      schedule(() {
        expect(markdown_component.currentDestinationElement.querySelector('h1'), isNotNull);
        expect(markdown_component.currentDestinationElement.querySelector('h1').text, equals('heading'));
      });
    });


    test('retains existing html elements', () {
      schedule(() {
        expect(markdown_component.currentDestinationElement.querySelector('strong'), isNotNull);
        expect(markdown_component.currentDestinationElement.querySelector('strong').text, equals('strong element'));
        expect(markdown_component.currentDestinationElement.querySelector('strong').attributes.keys, contains('id'));
        expect(markdown_component.currentDestinationElement.querySelector('strong').attributes['id'], contains('someid'));
      });
    });
  });
}