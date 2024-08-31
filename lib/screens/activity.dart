import 'package:flutter/material.dart';

class Activity extends StatefulWidget {
  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  late List<int> _selectedOptionIndices;
  late List<bool?> _results;

  List<Map<String, dynamic>> _questions = [
    {
      "question": 'What does HTML stand for?',
      "options": [
        'Hyper Text Markup Language',
        'Hyperlinks and Text Markup Language',
        'Home Tool Markup Language',
        'Hyperlinks Text Management Language'
      ],
      "correctIndex": 0,
    },
    {
      "question": 'What does the <a> tag represent in HTML?',
      "options": ['Anchor', 'Italic text', 'Bold text', 'Image'],
      "correctIndex": 0,
    },
    {
      "question": 'Which tag is used to define an unordered list in HTML?',
      "options": ['<ul>', '<ol>', '<li>', '<list>'],
      "correctIndex": 0,
    },
    {
      "question": 'Which tag is used to define a table row in HTML?',
      "options": ['<tr>', '<td>', '<th>', '<table>'],
      "correctIndex": 0,
    },
    {
      "question":
          'Which HTML attribute specifies an alternate text for an image, if the image cannot be displayed?',
      "options": ['src', 'alt', 'title', 'href'],
      "correctIndex": 1,
    },
    {
      "question": 'What is the correct HTML for creating a hyperlink?',
      "options": [
        '<a url="http://www.example.com">Example</a>',
        '<a href="http://www.example.com">Example</a>',
        '<link>http://www.example.com</link>',
        '<href>http://www.example.com</href>'
      ],
      "correctIndex": 1,
    },
    {
      "question":
          'Which tag is used to define the header for a document or a section in HTML5?',
      "options": ['<header>', '<head>', '<h1>', '<h>'],
      "correctIndex": 0,
    },
    {
      "question": 'What is the correct HTML for creating a checkbox?',
      "options": [
        '<input type="checkbox">',
        '<check>',
        '<checkbox>',
        '<input type="check">'
      ],
      "correctIndex": 0,
    },
    {
      "question":
          'Which HTML tag is used to define an option in a drop-down list?',
      "options": ['<option>', '<select>', '<list>', '<dropdown>'],
      "correctIndex": 0,
    },
    {
      "question": 'What does CSS stand for?',
      "options": [
        'Creative Style Sheets',
        'Colorful Style Sheets',
        'Cascading Style Sheets',
        'Computer Style Sheets'
      ],
      "correctIndex": 2,
    },
  ];

  late double w, h;

  @override
  void initState() {
    super.initState();
    _selectedOptionIndices = List.generate(_questions.length, (index) => -1);
    _results = List.generate(_questions.length, (_) => null);
  }

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: h * 0.14,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        leading: Container(
          margin: EdgeInsets.only(bottom: h * 0.08, right: h * 0.03),
          width: 32.0,
          height: 32.0,
          child: IconButton(
            icon: Icon(
              Icons.arrow_circle_left_outlined,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 5.0, left: 0, right: 40.0),
              width: w,
              height: h * 0.1,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img/logo.png"),
                      fit: BoxFit.contain)),
            )
          ],
        ),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: _questions.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Card(
                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Q ${index + 1}: ${_questions[index]['question']}',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      SizedBox(height: 10.0),
                      Column(
                        children: List.generate(
                          _questions[index]['options'].length,
                          (optionIndex) {
                            return RadioListTile(
                              title: Text(
                                  _questions[index]['options'][optionIndex]),
                              value: optionIndex,
                              groupValue: _selectedOptionIndices[index],
                              onChanged: (value) {
                                setState(() {
                                  _selectedOptionIndices[index] = value as int;
                                });
                              },
                            );
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _results[index] == true
                                ? 'Correct!'
                                : (_results[index] == false ? 'Wrong!' : ''),
                            style: TextStyle(
                              color: _results[index] == true
                                  ? Colors.green
                                  : (_results[index] == false
                                      ? Colors.red
                                      : Colors.transparent),
                              fontWeight: _results[index] == true
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontStyle: _results[index] == false
                                  ? FontStyle.italic
                                  : FontStyle.normal,
                              decoration: _results[index] == true
                                  ? TextDecoration.underline
                                  : TextDecoration.none,
                              fontSize: _results[index] == false ? 20.0 : 16.0,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (_selectedOptionIndices[index] ==
                                    _questions[index]['correctIndex']) {
                                  _results[index] = true;
                                } else {
                                  _results[index] = false;
                                }
                              });
                            },
                            child: Text('Submit'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Activity(),
  ));
}
