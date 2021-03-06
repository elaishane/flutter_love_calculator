import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_love_calculator/aboutpage.dart';
import 'package:flutter_love_calculator/lovecalculator.dart';
import 'package:flutter_love_calculator/resultpage.dart';
import 'package:flutter_love_calculator/utitlities.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  static final String tag = '/HomeScreen';

  @override
  _HomeScreenState createState() =>
      _HomeScreenState(
      );
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _myName = new TextEditingController(
  );
  TextEditingController _partnerName = new TextEditingController(
  );
  String myName, partnerName;
  String percentage;

  void _clear() {
    setState(
            () {
          percentage = '';
          _myName.clear(
          );
          _partnerName.clear(
          );
        }
            );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        elevation: 0.0,
        bottomOpacity: 0.0,
        brightness: Brightness.dark,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
                1,
                0.0,
              ],
              colors: [
                Color(0xffcc2b5e),
                Color(0xff753a88),
              ],
              ),
            ),
          ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Love Calculator',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            ),
          ),
        actionsIconTheme: IconThemeData(
            opacity: 2.0
            ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
                Icons.info
                ),
            onPressed: () {
              Navigator.of(
                  context
                  ).pushNamed(
                  AboutPage.tag
                  );
            },
            ),
        ],
        ),
      primary: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xffcc2b5e),
                  Color(0xff753a88),
                ],
                ),
              ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Center(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: AspectRatio(
                          aspectRatio: 3 / 2,
                          child: Image.asset(
                            'images/love1.png',
                            height: 400,
                            width: 400,
                            ),
                          ),
                        ),
                      getName(
                          hint: 'Enter your Name', name: _myName
                          ),
                      getName(
                          hint: 'Enter your Partner Name', name: _partnerName
                          ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0
                            ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Button(
                              'Heart',
                              FontAwesomeIcons.solidHeart,
                              Colors.red,
                                  () {
                                myName = _myName.text.toString(
                                ).toLowerCase(
                                );
                                partnerName =
                                    _partnerName.text.toString(
                                    ).toLowerCase(
                                    );
                                if (myName.length == 0 || partnerName == 0) {
                                  print(
                                      'Enter the Names'
                                      );
                                  alert(
                                  );
                                } else {
                                  loveCalculator calc = loveCalculator(
                                  );
                                  String calculation =
                                  calc.countChars(
                                      myName, partnerName
                                      );
                                  print(
                                      'calculation: ' + calculation
                                      );
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ResultPage(
                                                  resultPercentage: calculation
                                                  )
                                          )
                                      );
                                }
                              },
                              ),
                            Button(
                              'Clear',
                              FontAwesomeIcons.times,
                              Colors.red,
                              _clear,
                              ),
                          ],
                          ),
                        ),
                    ],
                    ),
                  ),
                ),
              ),
            ),
        ],
        ),
      );
  }

  alert() {
    return showDialog(
      context: context,
      child: AlertDialog(
        title: Text(
          'Enter the Names',
          style: TextStyle(
              color: Colors.black
              ),
          textAlign: TextAlign.center,
          maxLines: 1,
          textDirection: TextDirection.ltr,
          ),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              Navigator.pop(
                  context
                  );
            },
            icon: Icon(
              FontAwesomeIcons.solidThumbsUp,
              color: Colors.redAccent,
              ),
            label: Text(
                ''
                ),
            autofocus: true,
            ),
        ],
        elevation: 24.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              24.0
              ),
          ),
        ),
      );
  }
}
