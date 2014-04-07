import 'package:polymer/polymer.dart';
import 'dart:html';
import 'package:markdown/markdown.dart' show markdownToHtml, InlineSyntax, TextSyntax;

@CustomTag('markdown-markup')
class PolyMarkdown extends PolymerElement {

  List<InlineSyntax> nyanSyntax =
      [new TextSyntax('nyan', sub: '~=[,,_,,]:3')];

  PolyMarkdown.created() : super.created();


  @override
  void enteredView() {
    super.enteredView();

    _tranformAndDisplayContainedMarkdown();
  }


  void _tranformAndDisplayContainedMarkdown() {
    //get the nodes with the markdown
    List<Node> nodes = (shadowRoot.querySelector('content') as ContentElement).getDistributedNodes();

    //transform these nodes to text, representing element tags as their text equivalent, then run them through the Markdown transformer
    String content = markdownToHtml(
        nodes.fold("", (orig, el) => "${orig}${preserveExistingHTMLElements(el)}"),
        inlineSyntaxes: nyanSyntax
        );

    //remove these existing nodes from the DOM
    //@TODO: consider just hiding them, as manipulating the DOM is expensive ie <content style="display: none"></content>
    nodes.forEach((el) => el.remove());


    //insert the resulting transformed text from the markdown into the awaiting HTML tag
    $['destination']
      ..setInnerHtml(
        content,
        validator: new NodeValidatorBuilder()
        ..allowHtml5()
        ..allowElement('a', attributes: ['href'])
        //..allowNavigation(new MyUriPolicy())
      );
  }

  //make sure any HTML elements included are preserved.
  String preserveExistingHTMLElements(Node el) {
    return el is Text ? el.toString() : el is Element ? "<${el.nodeName.toLowerCase()} ${el.attributes.keys.fold("", (orig, key) {
      return '${key}="${el.attributes[key]}"';
    })}>${el.childNodes.fold("", (orig, node) => "${orig}${preserveExistingHTMLElements(node)}")}</${el.nodeName.toLowerCase()}>" : "";
  }
}


class MyUriPolicy implements UriPolicy {
  bool allowsUri(uri) => uri == 'http://slashdot.org';
}
