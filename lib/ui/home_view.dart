import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fnbees/models/home_model.dart';
import 'package:fnbees/service_locator.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:convert';

class HomeView extends StatefulWidget {
  final AuthResult authResult;
  HomeView({Key key, this.authResult}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  HomeModel model = locator<HomeModel>();
  @override
  void initState() {
    model.authResult = this.widget.authResult;
    Map dataProvider = json.decode(this.widget.authResult.toString());
    print(dataProvider['providerData']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<HomeModel>(
      model: model,
      child: ScopedModelDescendant<HomeModel>(
        builder: (context, child, model) => Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text(model.title),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Container(),
          ),
        ),
      ),
    );
  }
}
