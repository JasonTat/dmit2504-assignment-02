// ignore_for_file: avoid_print, use_key_in_widget_constructors, file_names, todo, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:robbinlaw/widgets/mysnackbar.dart';

// Do not change the structure of this files code.
// Just add code at the TODO's.

final formKey = GlobalKey<FormState>();

// We must make the variable firstName nullable.
String? firstName;
final TextEditingController textEditingController = TextEditingController();

class MyFirstPage extends StatefulWidget {
  @override
  MyFirstPageState createState() => MyFirstPageState();
}

class MyFirstPageState extends State<MyFirstPage> {
  bool enabled = false;
  int timesClicked = 0;
  String msg1 = '';
  String msg2 = '';
  String name = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assignment 02 - Jason Tat'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //TODO: Replace this Text Widget
              // and build the label and switch here
              // as children of the row.

            const Text('Enable Button'),
              Switch(
                      value: enabled,
                      onChanged: (bool onChangedValue) {
                        print('onChangedValue changed to $onChangedValue');
                      enabled = onChangedValue;
                        setState((){
                          if(enabled){
                            // timesClicked = 0;
                            if(timesClicked > 0){
                              msg1 = 'Clicked $timesClicked';
                            }
                            else{
                              msg1 = 'Click Me';
                            }

                            print('enabled = true');
                          } 
                          else {
                            msg1 = 'disabled';
                            print('enabled = false');
                          }
                        });
                      }),              
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //TODO: Buuild the two buttons here 
              // as children of the row.
              // For each button use a 
              // "Visibility Widget" and its child 
              // will be an "ElevatedButton"
              
              Visibility(
                visible: enabled,
                child: ElevatedButton(
                  onPressed: () {
                    setState((){
                      timesClicked++;
                      msg1 = 'Clicked $timesClicked';
                      print('$timesClicked');
                    });
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                    elevation: MaterialStateProperty.all(3)
                  ),
                  child: Text(msg1),
                )
                ),
                const SizedBox(
                  width: 20
                ),
              Visibility(
                visible: enabled,
                child: 
                ElevatedButton(
                  
                  onPressed: () {
                    setState((){
                      timesClicked = 0;
                      msg1 = 'Click Me';
                      msg2 = 'reset $timesClicked';
                      print('reset $timesClicked');
                    });
                  },
                  style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                  elevation: MaterialStateProperty.all(3)
                  
                ),
                  child: Text('Reset'),
                )
                ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  //TODO: Build the text form field
                  // here as the first
                  // child of the column.
                  // Include as the second child
                  // of the column
                  // a submit button that will show a
                  // snackbar with the "firstName"
                  // if validation is satisfied.
                  TextFormField(
                      controller: textEditingController,
                      onChanged: (value) {
                        name = value;
                        print(value);
                      },
                      maxLength: 20,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.hourglass_top),
                        labelText: 'first name',
                        helperText: 'min 1, max 20',
                        suffixIcon: Icon(Icons.check_circle)
                      )
                    ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: 
                  ElevatedButton(
                    onPressed: () {
                      if(formKey.currentState!.validate()){
                        formKey.currentState!.save();                    
                        MySnackBar(text: 'Hey there, your name is $name').show();                  
                      }
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                      elevation: MaterialStateProperty.all(3)
                      
                    ),
                    child: const Text('Submit'),                    
                    )
                
              ),


            ]
          )
        ],
      ),
    );
  }
}
