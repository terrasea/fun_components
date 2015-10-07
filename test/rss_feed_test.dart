part of fun_components_test;

class RSSFeedComponent extends PageComponent {
  RSSFeedComponent(el) : super(el);

  callGet() => component.getRSS();
  List get displayedItems => component.querySelectorAll('rss-item');
}

rss_feed_test() {
  group('[rss-feed]', () {
    RSSFeedComponent component;

    setUp(() {
      var el =
          createElement('<rss-feed href="syndication.rss"></rss-feed>');
      document.body.append(el);
      component = new RSSFeedComponent(el);
      return component.flush();

//      currentSchedule.onComplete.schedule(() => component.component.remove());
    });

    tearDown(() => component.component.remove());

    test('items are not displayed before get called', () {
      schedule(() {
        expect(component.currentTextDisplay.trim(), equals(''));
      });

    });

    group('[GET Called]', () {
      setUp(() {
        return component.callGet().then((_) {
          return component.flush().then((_) {
            var completer = new Completer();

            (component.displayedItems[0] as PolymerElement).async(() =>
            completer.complete());

            return completer.future;
          });
        });
      });


      test('items are displayed after get called', () {
        expect(component.displayedItems.length, 10);
      });


      test('items display title, description and link', () {
        var first_item_title = "One Yak Too Many?";
        var first_item_sample_text =
            "Yesterday I was able to get a Jenkins server up"
            " and running on a Linode, properly secured, and checking out Dart"
            " and JavaScript code for testing. Although the test script ran, I do"
            " not yet have a successful test—mostly due to lack of additional"
            " dependencies.";

        expect(component.displayedItems[0].text,
            contains(first_item_title));
        expect(component.displayedItems[0].text,
            contains(first_item_sample_text));
        expect(component.displayedItems[0].
            querySelectorAll('a')[0].href,
            equals('http://feedproxy.google.com/~r/dartosphere/~3/RbPCWmdf_f4/'
                'one-yak-too-many.html'));
        expect(component.displayedItems[0].
            querySelectorAll('a')[1].href,
            equals('http://jenkins-ci.org/'));
      });
    });
  });
}