import 'package:flutter/material.dart';

class MemberProvider with ChangeNotifier{
  List<String> _member = ["Support Staff-1", "Support staff-2"];

  List<String> get member => _member;

  set member(List<String> members){
    _member = members;
    notifyListeners();
  }
}