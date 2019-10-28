import 'package:flutter/material.dart';
import 'package:fnbees/models/login_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:fnbees/service_locator.dart';

class LoginView extends StatelessWidget {
  LoginView({Key key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return ScopedModel<LoginModel>(
      model: locator<LoginModel>(),
      child: ScopedModelDescendant<LoginModel>(
        builder: (context, child, model) => Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text(model.title),
            centerTitle: true,
          ),
          body: Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20),
                  child: showForm(model),
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      FlatButton(
                        child: Text('Login'),
                        color: Colors.blue,
                        onPressed: () {
                          final _formState = _formKey.currentState;
                          if (_formState.validate()) {
                            _formState.save();
                            model.doLogin().then((status) {
                              if (status) {
                                // Redirect To Home
                              } else {
                                _scaffoldKey.currentState.showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.redAccent,
                                    content: Text(
                                      model.error,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    duration: Duration(seconds: 3),
                                  ),
                                );
                              }
                            });
                          }
                        },
                      ),
                      FlatButton(
                        color: Colors.green,
                        child: Text('Sign Up'),
                        onPressed: () {
                          final _formState = _formKey.currentState;
                          if (_formState.validate()) {
                            _formState.save();
                            model.doSignUp().then((status) {
                              if (status) {
                                // Redirect To Home
                              } else {
                                _scaffoldKey.currentState.showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.redAccent,
                                    content: Text(
                                      model.error,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    duration: Duration(seconds: 3),
                                  ),
                                );
                              }
                            });
                          }
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget showForm(LoginModel model) {
    return Container(
      child: Form(
        key: _formKey,
        child: Center(
          child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                validator: (input) {
                  if (input.isEmpty) {
                    return "Email is required!";
                  }
                  return null;
                },
                onSaved: (input) => model.email = input,
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              TextFormField(
                validator: (input) {
                  if (input.length < 6) {
                    return "Password minimal 6 char";
                  }
                  return null;
                },
                onSaved: (input) => model.password = input,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
