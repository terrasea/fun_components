@HtmlImport('rss-feed.html')
library fun_components.rss_feed;

import 'dart:html' as html;
import 'dart:convert' show JSON, HtmlEscape;
import 'dart:async' show Completer;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart';

import 'package:xml2json/xml2json.dart' as xml2json;
import 'package:intl/intl.dart';

import 'package:polymer_elements/iron_ajax.dart';

import 'rss_item.dart';

import '../rss_item.dart' as rssitem;

@PolymerRegister('rss-feed')
class RSSFeed extends PolymerElement {
  @property String href;

  @property bool auto;

  @property List items = [];

  @Property(notify: true, observer: 'responseXMLChanged') var responseXML;

  RSSFeed.created() : super.created();

  getRSS() {
    var completer = new Completer();
    items.clear();
    var request = html.HttpRequest.getString(href)
      ..then((value) {
        set('responseXML', value);
        completer.complete();
    });
    //($['ajax'] as IronAjax).generateRequest()
//      ..handleResponse((res) {
//        completer.complete();
//        print('response: $res');
//      })
//      ..response.listen((_) => completer.complete())
      ;

    return completer.future;
  }

  @Observe('responseXML')
  responseXMLChanged([_, __]) => parseRSS();

  parseRSS() {
    var parser = new xml2json.Xml2Json()
      ..parse(responseXML)
      ;

    set('items', (JSON.decode(parser.toParker())['rss']['channel']['item'] as List).map((item) => new rssitem.RSSItem.fromMap(item)).toList());
  }


  @Observe('auto')
  autoChanged([_, __]) {
    if(auto == true) getRSS();
  }

  @reflectable
  void responseReceived(e, detail, [_, __]) {
  }
}

