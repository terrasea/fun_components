@HtmlImport('rss-item.html')
library fun_components.rss_item;

import 'dart:html' show DivElement, NodeValidatorBuilder, NodeValidator, NodeTreeSanitizer;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart';

import 'package:fun_components/html_entity.dart' show HtmlEntityResolver;

import '../rss_item.dart' as rssitem;

@PolymerRegister('rss-item')
class RSSItem extends PolymerElement {
  @Property(notify: true) String rssTitle;

  @Property(notify: true) String link;

  @Property(notify: true, observer: 'descriptionChanged') String description;

  @property String updated;

  @Property(notify: true, observer: 'itemChanged') rssitem.RSSItem item;

  @property String parsedDescription = '';

  HtmlEntityResolver _parser = new HtmlEntityResolver();

  RSSItem.created() : super.created();

  @Observe('description')
  void descriptionChanged([_, __]) {
    var validatorBuilder = new NodeValidatorBuilder();
    validatorBuilder.allowHtml5();

    ($['description'] as DivElement)
      ..appendHtml(_parser.parse(description), treeSanitizer: new RSSItemNodeTreeSanitiser())
    ;
  }

  @Observe('item')
  void itemChanged([_, __]) {
    set('rssTitle', item.title);
    set('link', item.link);
    set('description', item.description);
  }
}

//abstract class RSSItemNodeValidator extends NodeValidator {
//
//}

class RSSItemNodeTreeSanitiser implements NodeTreeSanitizer {
  void sanitizeTree(node) {}
}