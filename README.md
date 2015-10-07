fun_components
==============

Polymer components made for fun

The aim is to create Polymer Elements to carry out simple trivial tasks, like translating a number to roman numerals or turkish.

Now with a AJAX GET element.

## Installing

Add this to your package's pubspec.yaml file:
```
dependencies:
  fun_components: any
```

If you're using the Dart Editor, choose:

```
Menu > Tools > Pub Install
```

Or if you want to install from the command line, run:

```
$ pub install
```


Now in your HTML include:

For Roman Numerals:

Turns the number to the Roman Numeral:

10 is displayed as 'X'

```
<head>
  ...
  ...
</head>
<body>
  ...
  <roman-numeral number="10"></roman-numeral>
  OR
  <roman-numeral>10</roman-numeral>
  ...
</body>
```

For Turkish Numbers:

Turns the number to the written turkish word:

1000000000000 is displayed as 'bir trilyon'
 
```
<head>
  ...
  ...
</head>
<body>
  ...
  <turkish-number number="10"></turkish-number>
  OR
  <turkish-number>10</turkish-number>
  ...
</body>
```

For the credit card verifier, which may or may not be usable in html forms:

```
<head>
  ...
  ...
</head>
<body>
  ...
  <creditcard-verifier></creditcard-verifier>
  ...
</body>
```

For the Markdown element:

```
<head>
  ...
  ...
</head>
<body>
  ...
  <markdown-markup>
  Markdown inserted here
  ======================
  
  <strong>With normal HTML elements retained</strong>
   
  </markdown-markup>
  ...
</body>
```

For Gravatar Image

```
<head>
  ...
  ...
</head>
<body>
  ...
  <gravatar-image email="someemail@example.com" size="40" defaultImage="retro" rating="pg"></gravatar-image>
  <br> <!-- OR if you want to force default image -->
  <gravatar-image email="someemail@example.com" forceDefault></gravatar-image>
  ...
</body>
```


For Text to Voice (a text to speech element)

```
<head>
  ...
  ...
</head>
<body>
  ...
  <text-speech>I have something to say, it is better to burn out, than to fade away</text-speech>
  ...
</body>
```


For ajax get (an ajax element for doing get requests)

```
<head>
  ...
  ...
</head>
<body>
  ...
  <text-speech url="someurl" auto on-get-error="{{handleError}}" on-get-request="{{handleResponse}}" on-get-complete="{{handleCompleted}}"></ajax-get>
  ...
</body>

...

void handleError(e) {
  int status = e.detail;  //response code like 404 or 500
}


void handleResponse(e) {
  var responseText = e.detail;
}


void handleCompleted(e) {
  //do any post response stuff here.  No message is passed via the event
}
...
```

For RSS Feeds

```
<head>
  ...
  ...
</head>
<body>
  ...
  <rss-feed href="syndication.rss"></rss-feed>
  ...
</body>
```

There will be more to come.