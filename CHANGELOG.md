## 0.0.2

* Created &lt;roman-numerals&gt; polymer element
* Created &lt;turkish-number&gt; polymer element
* Created &lt;creditcard-verifier&gt; polymer element

## 0.1.0

* Changed &lt;roman-numerals&gt; polymer element number attribute from String to int
* Changed &lt;turkish-number&gt; polymer element number attribute from String to int
* Changed &lt;creditcard-verifier&gt; polymer element to display red border on invalid credit card number and from blue border, no border if correct
* Created &lt;markdown-markup&gt; polymer element

## 0.2.0

* Made markdown_markup.dart into a library fun_components.markdown_markup
* Created a &lt;gravatar-image&gt; polymer element where you can specify the size of the image to use.

## 0.2.1

* Added remaining defaultImage, forceDefault and ratings attributes to &lt;gravatar-image&gt; polymer element

## 0.2.2

* Fixed a bug where roman-numerals would be blank when set to 1

## 0.3.0

* Added &lt;text-speech&gt; element

## 0.4.0

* Updated to the latest stable version of Polymer Dart
* Removed drone.io badge, which is showing a false negative (test it yourself if you're worried, they will pass, but not on Drone.io)

## 0.5.0

* Added &lt;ajax-get&gt; element

## 0.5.1

* Updated pubspec.yaml to use the latest available dependancies

## 0.5.2

* Added <rss-feed ...> and <rss-item ..> elements
* Updated some of the elements to use _src and _href to overcome the problems with transformers rewriting them
 