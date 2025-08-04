import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: CalculatorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _display = '0';
  String _expression = '';
  double _result = 0;
  String _operation = '';
  double _operand = 0;
  bool _userIsTypingNumber = false;
  bool _isDarkMode = true;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'AC') {
        _allClear();
      } else if (buttonText == '±') {
        _toggleSign();
      } else if (buttonText == '%') {
        _percentage();
      } else if (['+', '-', '×', '÷'].contains(buttonText)) {
        _operatorPressed(buttonText);
      } else if (buttonText == '=') {
        _equalsPressed();
      } else if (buttonText == '.') {
        _decimalPressed();
      } else if (buttonText == '⟲') {
        _backspace();
      } else {
        _numberPressed(buttonText);
      }
    });
  }

  void _allClear() {
    _display = '0';
    _expression = '';
    _result = 0;
    _operation = '';
    _operand = 0;
    _userIsTypingNumber = false;
  }

  void _toggleSign() {
    if (_display != '0') {
      if (_display.startsWith('-')) {
        _display = _display.substring(1);
      } else {
        _display = '-$_display';
      }
    }
  }

  void _percentage() {
    double value = double.parse(_display);
    _display = (value / 100).toString();
    _formatDisplay();
  }

  void _operatorPressed(String operator) {
    if (_userIsTypingNumber) {
      _equalsPressed();
    }
    _operand = double.parse(_display);
    _operation = operator;
    _userIsTypingNumber = false;
  }

  void _equalsPressed() {
    if (_operation.isNotEmpty) {
      double secondOperand = double.parse(_display);
      switch (_operation) {
        case '+':
          _result = _operand + secondOperand;
          break;
        case '-':
          _result = _operand - secondOperand;
          break;
        case '×':
          _result = _operand * secondOperand;
          break;
        case '÷':
          _result = secondOperand != 0 ? _operand / secondOperand : 0;
          break;
      }
      _display = _result.toString();
      _formatDisplay();
      _operation = '';
      _userIsTypingNumber = false;
    }
  }

  void _decimalPressed() {
    if (_userIsTypingNumber && !_display.contains('.')) {
      _display += '.';
    } else if (!_userIsTypingNumber) {
      _display = '0.';
      _userIsTypingNumber = true;
    }
  }

  void _backspace() {
    if (_display.length > 1) {
      _display = _display.substring(0, _display.length - 1);
    } else {
      _display = '0';
      _userIsTypingNumber = false;
    }
  }

  void _numberPressed(String number) {
    if (_userIsTypingNumber) {
      _display += number;
    } else {
      _display = number;
      _userIsTypingNumber = true;
    }
  }

  void _formatDisplay() {
    // Remove unnecessary decimal places
    if (_display.contains('.') && _display.endsWith('.0')) {
      _display = _display.substring(0, _display.length - 2);
    }

    // Format large numbers with commas
    if (!_display.contains('.') && _display.length > 3) {
      int value = int.tryParse(_display) ?? 0;
      _display = _formatNumber(value);
    }
  }

  String _formatNumber(int number) {
    return number.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = _isDarkMode ? Color(0xFF1C1C1E) : Color(0xFFF2F2F7);
    final displayColor = _isDarkMode ? Colors.white : Colors.black;
    final buttonColors =
        _isDarkMode
            ? {
              'number': Color(0xFF333333),
              'operator': Color(0xFFFF9500),
              'function': Color(0xFFA6A6A6),
            }
            : {
              'number': Colors.white,
              'operator': Color(0xFFFF9500),
              'function': Color(0xFFA6A6A6),
            };

    return Theme(
      data: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          leading: Icon(
            Icons.signal_cellular_4_bar,
            color: displayColor,
            size: 18,
          ),
          title: Text(
            '9:41',
            style: TextStyle(
              color: displayColor,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          actions: [
            Icon(Icons.battery_full, color: displayColor, size: 24),
            SizedBox(width: 8),
          ],
        ),
        body: Column(
          children: [
            // Theme toggle buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => setState(() => _isDarkMode = false),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: !_isDarkMode ? Colors.white : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.wb_sunny_outlined,
                        color: !_isDarkMode ? Colors.black : Colors.grey,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () => setState(() => _isDarkMode = true),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color:
                            _isDarkMode ? Colors.grey[700] : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.brightness_2_outlined,
                        color: _isDarkMode ? Colors.white : Colors.grey,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Expression display
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '308 × 42',
                  style: TextStyle(
                    color: displayColor.withOpacity(0.6),
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),

            // Main display
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    _display,
                    style: TextStyle(
                      color: displayColor,
                      fontSize: 64,
                      fontWeight: FontWeight.w200,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
            ),

            // Button grid
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    _buildButtonRow(['AC', '±', '%', '÷'], buttonColors),
                    _buildButtonRow(['7', '8', '9', '×'], buttonColors),
                    _buildButtonRow(['4', '5', '6', '-'], buttonColors),
                    _buildButtonRow(['1', '2', '3', '+'], buttonColors),
                    _buildBottomRow(buttonColors),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonRow(List<String> buttons, Map<String, Color> colors) {
    return Expanded(
      child: Row(
        children:
            buttons.map((button) => _buildButton(button, colors)).toList(),
      ),
    );
  }

  Widget _buildBottomRow(Map<String, Color> colors) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () => _buttonPressed('⟲'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors['function'],
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  elevation: 0,
                ),
                child: Icon(Icons.refresh, size: 24),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () => _buttonPressed('0'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors['number'],
                  foregroundColor: _isDarkMode ? Colors.white : Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  '0',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () => _buttonPressed('.'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors['number'],
                  foregroundColor: _isDarkMode ? Colors.white : Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  '·',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () => _buttonPressed('='),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors['operator'],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  '=',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, Map<String, Color> colors) {
    Color backgroundColor;
    Color textColor;

    if (['AC', '±', '%'].contains(text)) {
      backgroundColor = colors['function']!;
      textColor = Colors.black;
    } else if (['+', '-', '×', '÷'].contains(text)) {
      backgroundColor = colors['operator']!;
      textColor = Colors.white;
    } else {
      backgroundColor = colors['number']!;
      textColor = _isDarkMode ? Colors.white : Colors.black;
    }

    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),
        child: ElevatedButton(
          onPressed: () => _buttonPressed(text),
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: textColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            elevation: 0,
          ),
          child: Text(
            text,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
