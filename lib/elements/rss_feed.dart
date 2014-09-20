import 'dart:html' as html;
import 'dart:convert' show JSON, HtmlEscape;
import 'dart:async' show Completer;

import 'package:polymer/polymer.dart';

import 'package:xml2json/xml2json.dart' as xml2json;
import 'package:intl/intl.dart';

import 'package:core_elements/core_ajax_dart.dart';

@CustomTag('rss-feed')
class RSSFeed extends PolymerElement {
  @PublishedProperty(reflect:true)
  String get href => readValue(#href);
  set href(val) => writeValue(#href, val);

  @PublishedProperty(reflect:true)
  bool get auto => readValue(#auto);
  set auto(val) => writeValue(#auto, val);

  List items = toObservable([]);

  @observable var responseXML;

  RSSFeed.created() : super.created();

  get() {
    var completer = new Completer();
    items.clear();
    ($['ajax'] as CoreAjax)
      ..go()
      ..onCoreResponse.listen((_) => completer.complete())
      ;

    return completer.future;
  }

  responseXMLChanged(old, current) => parseRSS();

  parseRSS() {
    var parser = new xml2json.Xml2Json()
      ..parse(responseXML)
      ;

    items
      ..addAll((JSON.decode(parser.toParker())['rss']['channel']['item'] as List).map((item) => new RSSItem.fromMap(item)))
      ;
    print(items.length);
    //var parser = new RssParser(e.detail);
    /*parser.onFinished.listen((e) {
      print(e);
    });*/
    /*parser.onProcess().listen((rssItem) {
        items.add(rssItem);
        print('added');
      });*/
  }


  autoChanged(old, current) {
    if(auto == true) get();
  }
}


class RSSItem extends Observable {
  @observable String title;
  @observable String description;
  @observable String link;
  @observable DateTime pubDate;
  @observable String author;
  @observable String comments;
  @observable String guid;

  //@TODO: enclosure, category, source

  RSSItem(this.title, this.description, this.link, {this.pubDate: null, this.author: '', this.comments: '', this.guid: ''});

  factory RSSItem.fromMap(Map item) {
    //Tue, 09 Sep 2014 00:00:00 +0200
    var format = new DateFormat('EEE, dd MMM yyyy hh:mm:ss Z');
    return new RSSItem(
            item['title'],
            item['description'],
            item['link'],
            pubDate: item.containsKey('pubDate') ? format.parse(item['pubDate']) : null,
            author: item.containsKey('author') ? item['author'] : '',
            comments: item.containsKey('comments') ? item['comments'] : '',
            guid: item.containsKey('guid') ? item['guid'] : ''
        );
  }


  factory RSSItem.fromJson(String json) {
    return new RSSItem.fromMap(JSON.decode(json));
  }

  Map toMap() {
    var item = {
      'title': title,
      'description': description,
      'link': link,
    };

    if(pubDate != null) item['pubDate'] = pubDate.toIso8601String();
    if(author.isNotEmpty) item['author'] = author;
    if(comments.isNotEmpty) item['comments'] = comments;
    if(guid.isNotEmpty) item['guid'] = guid;

    return item;
  }


  String toJson() {
    return JSON.encode(toMap());
  }
}