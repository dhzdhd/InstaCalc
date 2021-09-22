class ButtonList {
  static List<Map<String, String>> simpleButtonList = [
    {'text': 'C', 'value': 'C', 'color': 'nonint', 'func': 'clear'},
    {'text': '(', 'value': '(', 'color': 'nonint', 'func': 'calc'},
    {'text': ')', 'value': ')', 'color': 'nonint', 'func': 'calc'},
    {'text': '/', 'value': '/', 'color': 'nonint', 'func': 'calc'},
    {'text': '7', 'value': '7', 'color': 'int', 'func': 'calc'},
    {'text': '8', 'value': '8', 'color': 'int', 'func': 'calc'},
    {'text': '9', 'value': '9', 'color': 'int', 'func': 'calc'},
    {'text': 'x', 'value': 'x', 'color': 'nonint', 'func': 'calc'},
    {'text': '4', 'value': '4', 'color': 'int', 'func': 'calc'},
    {'text': '5', 'value': '5', 'color': 'int', 'func': 'calc'},
    {'text': '6', 'value': '6', 'color': 'int', 'func': 'calc'},
    {'text': '-', 'value': '-', 'color': 'nonint', 'func': 'calc'},
    {'text': '1', 'value': '1', 'color': 'int', 'func': 'calc'},
    {'text': '2', 'value': '2', 'color': 'int', 'func': 'calc'},
    {'text': '3', 'value': '3', 'color': 'int', 'func': 'calc'},
    {'text': '+', 'value': '+', 'color': 'nonint', 'func': 'calc'},
    {'text': '^', 'value': '^', 'color': 'nonint', 'func': 'calc'},
    {'text': '0', 'value': '0', 'color': 'int', 'func': 'calc'},
    {'text': '.', 'value': '.', 'color': 'nonint', 'func': 'calc'},
    {'text': '=', 'value': '=', 'color': 'equal', 'func': 'equate'},
  ];

  static List<Map<String, Object>> scientificButtonList = [
    {'text': 'C', 'value': 'C', 'color': 'nonint', 'func': 'clear'},
    {'text': '(', 'value': '(', 'color': 'nonint', 'func': 'calc'},
    {'text': ')', 'value': ')', 'color': 'nonint', 'func': 'calc'},
    {'text': '/', 'value': '/', 'color': 'nonint', 'func': 'calc'},
    {'text': 'sin', 'value': 'sin(', 'color': 'int', 'func': 'calc'},
    {'text': 'cos', 'value': 'cos(', 'color': 'int', 'func': 'calc'},
    {'text': 'tan', 'value': 'tan(', 'color': 'int', 'func': 'calc'},
    {'text': 'x', 'value': 'x', 'color': 'nonint', 'func': 'calc'},
    {
      'text': 'asin',
      'value': 'asin(',
      'color': 'int',
      'func': 'calc',
      'font': 30.0
    },
    {
      'text': 'acos',
      'value': 'acos(',
      'color': 'int',
      'func': 'calc',
      'font': 30.0
    },
    {
      'text': 'atan',
      'value': 'atan(',
      'color': 'int',
      'func': 'calc',
      'font': 30.0
    },
    {'text': '-', 'value': '-', 'color': 'nonint', 'func': 'calc'},
    {'text': 'log', 'value': 'log10(', 'color': 'int', 'func': 'calc'},
    {'text': 'ln', 'value': 'loge(', 'color': 'int', 'func': 'calc'},
    {'text': 'e', 'value': 'e^', 'color': 'int', 'func': 'calc'},
    {'text': '+', 'value': '+', 'color': 'nonint', 'func': 'calc'},
    {'text': '^', 'value': '^', 'color': 'nonint', 'func': 'calc'},
    {'text': '0', 'value': '0', 'color': 'int', 'func': 'calc'},
    {'text': '.', 'value': '.', 'color': 'nonint', 'func': 'calc'},
    {'text': '=', 'value': '=', 'color': 'equal', 'func': 'equate'},
  ];
}
