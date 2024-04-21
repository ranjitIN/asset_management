import 'package:asset_management_app/models/UserProfileData.dart';
import 'package:asset_management_app/utils/consnts.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier{

  final _userData = const UserProfileData(
    image: AssetImage(ImageRasterPath.man),
    name: "User",
    jobDesk: "Administrator",
  );

  get userData => _userData;

  //set method for setter 

}