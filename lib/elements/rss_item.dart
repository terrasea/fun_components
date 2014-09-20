import 'dart:html' show DivElement;

import 'package:polymer/polymer.dart';

import 'package:fun_components/html_entity.dart' show HtmlEntityResolver;

@CustomTag('rss-item')
class RSSItem extends PolymerElement {
  @PublishedProperty(reflect: true)
  String get title => readValue(#title);
  set title(val) => writeValue(#title, val);

  @PublishedProperty(reflect: true)
  String get link => readValue(#link);
  set link(val) => writeValue(#link, val);

  @PublishedProperty(reflect: true)
  String get description => readValue(#description);
  set description(val) => writeValue(#description, val);

  @PublishedProperty(reflect: true)
  String get updated => readValue(#updated);
  set updated(val) => writeValue(#updated, val);


  @observable String parsedDescription = '';

  HtmlEntityResolver _parser = new HtmlEntityResolver();

  RSSItem.created() : super.created();

  descriptionChanged(old, current) {
    ($['description'] as DivElement).appendHtml(_parser.parse(description));
  }
}