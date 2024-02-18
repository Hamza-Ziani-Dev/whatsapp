// ignore_for_file: avoid_print, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  final _formKey = GlobalKey<FormState>();
  String countryCode = "";
  String phone = "";
  String message = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Home"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: const Image(
                    image: AssetImage('assets/images/whatsapp.png'),
                    width: 100,
                    height: 100,
                  ),
                ),
                // const SizedBox(width: 30,),
                Container(
                  margin: const EdgeInsets.only(bottom: 10), // Add margin here
                  child: Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          onSaved: (val) {
                            countryCode = val!;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueAccent, width: 2),
                            ),
                            labelText: 'Enter your Country Code',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Country Code';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                          width: 10), // Add spacing between the text fields
                      Flexible(
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          onSaved: (val) {
                            phone = val!;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueAccent, width: 2),
                            ),
                            labelText: 'Enter your Phone',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Phone';
                            } else if (value.length != 10) {
                              return "Phone number must be of length 10";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10), // Add margin here
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    onSaved: (val) {
                      message = val!;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blueAccent, width: 2),
                        ),
                        labelText: 'Enter your Message'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Message';
                      }
                      return null;
                    },
                  ),
                ),
                MaterialButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                      _formKey.currentState!.save();
                      print("Country : $countryCode");
                      print("Phone : $phone");
                      print("Message : $message");
                      //
                      // _sendWhatsAppMessage();
                      String url = 'https://wa.me/$phone?text=$message';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                      setState(() {});
                    }
                  },
                  color: Colors.blue, // Set button color
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    // Set border radius here
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.send), // Add send icon here
                      SizedBox(width: 8), // Add spacing between icon and text
                      Text('Submit'),
                    ],
                  ),
                ),
                const SizedBox(height: 340),
                Container(
                  height: 50,
                  color: Colors.pink,
                ),
              ],
            ),
          ),
          
        ),
      ),
    );
  }

  // void _sendWhatsAppMessage() async {
  //   String phoneNumber =
  //       '$countryCode$phone'; // Include the country code without '+' or '00'
  //   String encodedMessage = Uri.encodeFull(message);
  //   String url = 'https://wa.me/$phoneNumber?text=$encodedMessage';
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
}
