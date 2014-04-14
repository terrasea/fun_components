part of fun_components_test;

class GravatarImageComponent extends PageComponent {
  GravatarImageComponent(el) : super(el);

  ImageElement get currentGravatarImage => component.$['gravatar_image'];
  String get currentGravatarEmail => component.email;
  String get currentGravatarImageURL => component.imageURL;
  int get currentGravatarSize => component.size;

  Future flush() {
    return super.flush().then((_) => super.flush());
  }
}

//I am not testing the Gravatar package, just making sure the values, fetched
//or not fetched like size get put in the right place.  Like the rule says,
//don't test other peoples code.
gravatar_image_test() {
  group('[Gravatar Image]', () {
    GravatarImageComponent gravatar_component;
    //steal the email address used by the gravatar package in testing
    //hopefully they won't mind.
    var email = 'hello@blossom.io';

    setUp(() {
      currentSchedule.onComplete.schedule(() => gravatar_component.component.remove());
    });


    test('is not null', () {
      schedule(() {
        PolymerElement el = createElement('<gravatar-image email="$email"></gravatar-image>');
        document.body.append(el);
        gravatar_component = new GravatarImageComponent(el);

        return gravatar_component.flush();
      });

      schedule(() {
        expect(gravatar_component.component, isNotNull);
      });
    });


    test('img src attribute is correct and has default values', () {
      schedule(() {
        PolymerElement el = createElement('<gravatar-image email="$email"></gravatar-image>');
        document.body.append(el);
        gravatar_component = new GravatarImageComponent(el);

        return gravatar_component.flush();
      });

      schedule(() {
        expect(gravatar_component.currentGravatarSize, isNull);
        expect(gravatar_component.currentGravatarImageURL, equals('https://secure.gravatar.com/avatar/658b1158409b348bb2cb3e5bef734d1b'));
        expect(gravatar_component.currentGravatarImage.src, equals('https://secure.gravatar.com/avatar/658b1158409b348bb2cb3e5bef734d1b'));
      });
    });


    test('size attribute sets right img src attribute', () {
      schedule(() {
        PolymerElement el = createElement('<gravatar-image email="$email" size="40"></gravatar-image>');
        document.body.append(el);
        gravatar_component = new GravatarImageComponent(el);

        return gravatar_component.flush();
      });

      schedule(() {
        expect(gravatar_component.currentGravatarSize, equals(40));
        expect(gravatar_component.currentGravatarImageURL, equals('https://secure.gravatar.com/avatar/658b1158409b348bb2cb3e5bef734d1b?s=40'));
        expect(gravatar_component.currentGravatarImage.src, equals('https://secure.gravatar.com/avatar/658b1158409b348bb2cb3e5bef734d1b?s=40'));
      });
    });


    test('default image', () {
      schedule(() {
        PolymerElement el = createElement('<gravatar-image email="$email" defaultImage="images/GoogleSearchBirthday.png"></gravatar-image>');
        document.body.append(el);
        gravatar_component = new GravatarImageComponent(el);

        return gravatar_component.flush();
      });

      schedule(() {
        expect(gravatar_component.currentGravatarImageURL, equals('https://secure.gravatar.com/avatar/658b1158409b348bb2cb3e5bef734d1b?d=images/GoogleSearchBirthday.png'));
        expect(gravatar_component.currentGravatarImage.src, equals('https://secure.gravatar.com/avatar/658b1158409b348bb2cb3e5bef734d1b?d=images/GoogleSearchBirthday.png'));
      });
    });


    test('default image and size', () {
      schedule(() {
        PolymerElement el = createElement('<gravatar-image email="$email" size="40" defaultImage="images/GoogleSearchBirthday.png"></gravatar-image>');
        document.body.append(el);
        gravatar_component = new GravatarImageComponent(el);

        return gravatar_component.flush();
      });

      schedule(() {
        expect(gravatar_component.currentGravatarImageURL, equals('https://secure.gravatar.com/avatar/658b1158409b348bb2cb3e5bef734d1b?s=40&d=images/GoogleSearchBirthday.png'));
        expect(gravatar_component.currentGravatarImage.src, equals('https://secure.gravatar.com/avatar/658b1158409b348bb2cb3e5bef734d1b?s=40&d=images/GoogleSearchBirthday.png'));
      });
    });


    test('force default', () {
      schedule(() {
        PolymerElement el = createElement('<gravatar-image email="$email" forceDefault></gravatar-image>');
        document.body.append(el);
        gravatar_component = new GravatarImageComponent(el);

        return gravatar_component.flush();
      });

      schedule(() {
        expect(gravatar_component.currentGravatarImageURL, equals('https://secure.gravatar.com/avatar/658b1158409b348bb2cb3e5bef734d1b?f=y'));
        expect(gravatar_component.currentGravatarImage.src, equals('https://secure.gravatar.com/avatar/658b1158409b348bb2cb3e5bef734d1b?f=y'));
      });
    });


    test('rating set', () {
      schedule(() {
        PolymerElement el = createElement('<gravatar-image email="$email" rating="pg"></gravatar-image>');
        document.body.append(el);
        gravatar_component = new GravatarImageComponent(el);

        return gravatar_component.flush();
      });

      schedule(() {
        expect(gravatar_component.currentGravatarImageURL, equals('https://secure.gravatar.com/avatar/658b1158409b348bb2cb3e5bef734d1b?r=pg'));
        expect(gravatar_component.currentGravatarImage.src, equals('https://secure.gravatar.com/avatar/658b1158409b348bb2cb3e5bef734d1b?r=pg'));
      });
    });


  });
}