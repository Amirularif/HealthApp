import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String userId = '';
  String userPassword = '';
  String Fitbit = '';
  final _formKey = GlobalKey<FormState>();

  void _tryValidation(BuildContext context) {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
    if (userId !.isNotEmpty && userPassword !.isNotEmpty && Fitbit !.isNotEmpty) {
      Navigator.pushNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false, // make sure no overflow when keyboard appears
        backgroundColor: Colors.grey.shade100,
        body: Stack(children: [
          Positioned(
            top: 0,
            child: Container(
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.symmetric(horizontal: 0.0),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                //padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 2 - 230),
                child: Center(
                  heightFactor: 1.7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),

                      SizedBox(height: 10),

                      Center(
                        child: Text('Create an Account, it\'s free!',
                            style: TextStyle(
                              fontSize: 20.0,
                            )
                        ),
                      ),

                      SizedBox(height: 30),

                      Container(
                        //margin: EdgeInsets.only(top: 20),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                key: ValueKey(1),
                                validator: (value) {
                                  if (value!.isEmpty || value.length < 4) {
                                    return 'Input your Username';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  userId = value!;
                                },
                                onChanged: (value) {
                                  userId = value;
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.account_circle,
                                    color: Colors.grey.shade500,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade500,
                                    ),
                                  ),
                                  hintText: 'Username',
                                  hintStyle:
                                  TextStyle(color: Colors.grey),
                                  contentPadding: EdgeInsets.all(10.0),
                                ),
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                obscureText: true,
                                key: ValueKey(2),
                                validator: (value) {
                                  if (value!.isEmpty || value.length < 4) {
                                    return 'Input your password';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  userPassword = value!;
                                },
                                onChanged: (value) {
                                  userPassword = value;
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.password,
                                    color: Colors.grey.shade500,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade500,
                                    ),
                                  ),
                                  hintText: 'Password',
                                  hintStyle:
                                  TextStyle(color: Colors.grey),
                                  contentPadding: EdgeInsets.all(10.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        key: ValueKey(1),
                        validator: (value) {
                          if (value!.isEmpty || value.length < 4) {
                            return 'Input your Fitbit Model';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          Fitbit = value!;
                        },
                        onChanged: (value) {
                          Fitbit = value;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.watch,
                            color: Colors.grey.shade500,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade500,
                            ),
                          ),
                          hintText: 'Fitbit Model',
                          hintStyle:
                          TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.all(10.0),
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 40,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            _tryValidation(context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.indigo, // Background color
                          ),
                          child: Text(
                            'Register',
                            style: TextStyle(
                                fontSize: 17.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Already have an Account?',
                            style: TextStyle(fontSize: 17),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: TextStyle(
                                  fontSize: 17,
                                  decoration: TextDecoration.underline),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/');
                            },
                            child: Text('Login'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
              ),
            ),
          ),

        ]),
      ),
    );
  }
}