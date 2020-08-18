import 'package:com/pages/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sms/flutter_sms.dart';

import '../contact.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List<String> _colors = <String>['', 'on', 'off'];
  String _color = '';
  String _message = 'test message';
  Contact newContact = new Contact();
  List<String> phoneList = [];

  void _sendSMS() async {
    String _result = await FlutterSms.sendSMS(
        message: newContact.cmd, recipients: phoneList);
    setState(() => _message = _result);
    print(_result);
    print(_message);
    phoneList.clear();
    goToSwitchRemote();
  }

  void goToSwitchRemote() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Loading()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: SafeArea(
          top: false,
          bottom: false,
          child: Form(
              key: _formKey,
              autovalidate: true,
              child: new ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.location_city),
                      hintText: 'Enter the location',
                      labelText: 'City Name',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your location';
                      }
                    },
                    onSaved: (val) => setState(() => newContact.city = val),
                  ),
//                  new TextFormField(
//                    decoration: const InputDecoration(
//                      icon: const Icon(Icons.calendar_today),
//                      hintText: 'Enter your date of birth',
//                      labelText: 'Dob',
//                    ),
//                    keyboardType: TextInputType.datetime,
//                  ),
                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.phone),
                      hintText: 'Enter a phone number',
                      labelText: 'Phone',
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly,
                    ],
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter the phone number';
                      }
                    },
                    onSaved: (val) =>
                        setState(() => phoneList.add(val.toString())),
                  ),
                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.code),
                      hintText: 'Enter override command',
                      labelText: 'cmd text',
                    ),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter the command text';
                      }
                    },
                    onSaved: (val) => setState(() => newContact.cmd = val),
                  ),
                  new FormField(
                    builder: (FormFieldState state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          icon: const Icon(Icons.signal_wifi_off),
                          labelText: 'ON/OFF wifi',
                        ),
                        isEmpty: _color == '',
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton(
                            value: _color,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                newContact.status = newValue;
                                _color = newValue;
                                state.didChange(newValue);
                              });
                            },
                            items: _colors.map((String value) {
                              return new DropdownMenuItem(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                  new Container(
                      padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                      child: new RaisedButton(
                        onPressed: () {
                          final form = _formKey.currentState;
                          if (form.validate()) {
                            form.save();
                            _sendSMS();
                          }
                        },
                        child: Text('send'),
                      )),
                ],
              ))),
    );
  }
}
