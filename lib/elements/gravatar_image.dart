@HtmlImport('gravatar-image.html')
library fun_components.gravatar_image;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart';

import 'package:gravatar/gravatar.dart';


@PolymerRegister('gravatar-image')
class GravatarImageElement extends PolymerElement {
  @property String email;
  @property String imageURL;
  @property int size;
  @property String defaultImage;
  @property bool forceDefault = false;
  @property String rating;

  GravatarImageElement.created() : super.created();


  attached() {
    super.attached();

    var img = new Gravatar(email).imageUrl(size: size, defaultImage: defaultImage, forceDefault: forceDefault, rating: rating);

    set('imageURL', img);
  }
}