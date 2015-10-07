library fun_components.rss_item_class;

import 'package:intl/intl.dart';
import 'dart:convert' show JSON;

class RSSItem {
  String title;
  String description;
  String link;
  DateTime pubDate;
  String author;
  String comments;
  String guid;

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
