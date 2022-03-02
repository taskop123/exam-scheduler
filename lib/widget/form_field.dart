import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthenticationForm extends StatelessWidget{
  final GlobalKey _formKey;
  final List<Widget> _formChildren;

  const AuthenticationForm(this._formKey, this._formChildren, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _formChildren,
        ),
      )
    );
  }

}