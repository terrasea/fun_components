fun_components
==============

[![Build Status](https://drone.io/github.com/terrasea/fun_components/status.png)](https://drone.io/github.com/terrasea/fun_components/latest)

Polymer components made for fun

The aim is to create Polymer Elements to carry out simple trivial tasks, like translating a number to roman numerals or turkish.

Now with a Markdown Polymer element.

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
  <link rel="import" href="packages/fun_components/elements/roman-numeral.html">
  ...
</head>
<body>
  ...
  <roman-numeral number="10"></roman-numeral>
  ...
</body>
```

For Turkish Numbers:

Turns the number to the written turkish word:

1000000000000 is displayed as 'bir trilyon'
 
```
<head>
  ...
  <link rel="import" href="packages/fun_components/elements/turkish-number.html">
  ...
</head>
<body>
  ...
  <turkish-number number="10"></turkish-number>
  ...
</body>
```

For the credit card verifier, which may or may not be usable in html forms:

```
<head>
  ...
  <link rel="import" href="packages/fun_components/elements/creditcard-verifier.html">
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
  <link rel="import" href="packages/fun_components/elements/markdown-markup.html">
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

There will be more to come.