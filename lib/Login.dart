import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String userId = '';
  String userPassword = '';
  final _formKey = GlobalKey<FormState>();

  void _tryValidation(BuildContext context) {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
    if (userId == 'test' && userPassword == 'test') {
      Navigator.pushNamed(context, '/dashboard');
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
                          'Login',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),

                      SizedBox(height: 10),

                      Center(
                        child: Text('Welcome back, you\'ve been missed!',
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
                            'Login',
                            style: TextStyle(
                                fontSize: 17.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),

                      Center(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            textStyle: TextStyle(
                                fontSize: 17,
                                decoration: TextDecoration.underline),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: Text('Forgot Username'),
                        ),
                      ),

                      Center(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            textStyle: TextStyle(
                                fontSize: 17,
                                decoration: TextDecoration.underline),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: Text('Forgot Password'),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Not a member?',
                            style: TextStyle(fontSize: 17),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: TextStyle(
                                  fontSize: 17,
                                  decoration: TextDecoration.underline),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/register');
                            },
                            child: Text('Register'),
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